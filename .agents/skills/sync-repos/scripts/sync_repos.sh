#!/usr/bin/env bash
set -u

MODE="pull"
ROOT_PATH="$(pwd)"

print_usage() {
    cat <<'EOF'
Uso: sync_repos.sh [--mode pull|check] [--root CAMINHO]

Opcoes:
  -m, --mode, -Mode       Modo de operacao: pull (padrao) ou check
  -r, --root, -RootPath   Diretorio raiz do workspace (padrao: diretorio atual)
  -h, --help              Exibe esta ajuda
EOF
}

while [ $# -gt 0 ]; do
    case "$1" in
        -m|--mode|-Mode)
            if [ $# -lt 2 ]; then
                echo "ERRO: Parametro $1 exige um valor (pull ou check)."
                exit 1
            fi
            MODE="$2"
            shift 2
            ;;
        --mode=*)
            MODE="${1#*=}"
            shift
            ;;
        -r|--root|-RootPath)
            if [ $# -lt 2 ]; then
                echo "ERRO: Parametro $1 exige um caminho."
                exit 1
            fi
            ROOT_PATH="$2"
            shift 2
            ;;
        --root=*)
            ROOT_PATH="${1#*=}"
            shift
            ;;
        -h|--help)
            print_usage
            exit 0
            ;;
        *)
            echo "ERRO: Argumento desconhecido: $1"
            exit 1
            ;;
    esac
done

if [ "$MODE" != "pull" ] && [ "$MODE" != "check" ]; then
    echo "ERRO: Modo invalido '$MODE'. Use 'pull' ou 'check'."
    exit 1
fi

if [ ! -d "$ROOT_PATH" ]; then
    echo "ERRO: Caminho raiz nao encontrado: $ROOT_PATH"
    exit 1
fi

RESOLVED_ROOT="$(cd "$ROOT_PATH" 2>/dev/null && pwd -P)"
if [ -z "$RESOLVED_ROOT" ]; then
    echo "ERRO: Caminho raiz nao encontrado: $ROOT_PATH"
    exit 1
fi

get_repo_status_counts() {
    local repo_path="$1"
    local upstream="$2"
    local ahead=0
    local behind=0

    if [ -n "$upstream" ]; then
        local counts_out
        local counts_rc
        counts_out="$(git -C "$repo_path" rev-list --left-right --count "HEAD...$upstream" 2>&1)"
        counts_rc=$?
        if [ "$counts_rc" -eq 0 ] && [ -n "$counts_out" ]; then
            local p1=""
            local p2=""
            read -r p1 p2 _ <<< "$counts_out"
            case "$p1" in
                ''|*[!0-9]*) ;;
                *) ahead="$p1" ;;
            esac
            case "$p2" in
                ''|*[!0-9]*) ;;
                *) behind="$p2" ;;
            esac
        fi
    fi

    printf '%s %s\n' "$ahead" "$behind"
}

REPOS=()
while IFS= read -r dir; do
    if [ -n "$dir" ] && [ -e "$dir/.git" ]; then
        REPOS+=("$dir")
    fi
done < <(find "$RESOLVED_ROOT" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort)

if [ "${#REPOS[@]}" -eq 0 ] && [ -e "$RESOLVED_ROOT/.git" ]; then
    REPOS+=("$RESOLVED_ROOT")
fi

if [ "${#REPOS[@]}" -eq 0 ]; then
    echo "AVISO: Nenhum repositorio Git encontrado em: $RESOLVED_ROOT"
    exit 1
fi

TOTAL="${#REPOS[@]}"
OK_OR_UPDATED=0
SKIPPED_OR_PENDING=0
ERROR_COUNT=0

echo "MODE=$MODE ROOT=$RESOLVED_ROOT REPOS=$TOTAL"

for repo_path in "${REPOS[@]}"; do
    name="$(basename "$repo_path")"

    branch_out="$(git -C "$repo_path" rev-parse --abbrev-ref HEAD 2>&1)"
    branch_rc=$?
    if [ "$branch_rc" -eq 0 ] && [ -n "$branch_out" ]; then
        branch="$(printf '%s\n' "$branch_out" | head -n 1)"
    else
        branch="(desconhecida)"
    fi

    up_out="$(git -C "$repo_path" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>&1)"
    up_rc=$?
    if [ "$up_rc" -eq 0 ] && [ -n "$up_out" ]; then
        upstream="$(printf '%s\n' "$up_out" | head -n 1)"
    else
        upstream=""
    fi

    porcelain_out="$(git -C "$repo_path" status --porcelain 2>&1)"
    porcelain_rc=$?
    dirty_lines=()
    if [ "$porcelain_rc" -eq 0 ] && [ -n "$porcelain_out" ]; then
        while IFS= read -r line; do
            case "$line" in
                *[![:space:]]*) dirty_lines+=("$line") ;;
            esac
        done <<< "$porcelain_out"
    fi
    dirty_count="${#dirty_lines[@]}"

    stash_out="$(git -C "$repo_path" stash list 2>&1)"
    stash_rc=$?
    stash_count=0
    if [ "$stash_rc" -eq 0 ] && [ -n "$stash_out" ]; then
        while IFS= read -r line; do
            case "$line" in
                *[![:space:]]*) stash_count=$((stash_count + 1)) ;;
            esac
        done <<< "$stash_out"
    fi

    before_out="$(git -C "$repo_path" rev-parse --short HEAD 2>&1)"
    before_rc=$?
    if [ "$before_rc" -eq 0 ] && [ -n "$before_out" ]; then
        before_hash="$(printf '%s\n' "$before_out" | head -n 1)"
    else
        before_hash=""
    fi

    status_text=""
    details=()

    if [ "$MODE" = "pull" ]; then
        if [ "$dirty_count" -gt 0 ]; then
            fetch_out="$(git -C "$repo_path" fetch --prune 2>&1)"
            fetch_rc=$?
            status_text="PULADO (alteracoes locais: $dirty_count)"
            SKIPPED_OR_PENDING=$((SKIPPED_OR_PENDING + 1))
            if [ "${#dirty_lines[@]}" -gt 0 ]; then
                for line in "${dirty_lines[@]}"; do
                    details+=("  dirty: $line")
                done
            fi
            if [ "$fetch_rc" -ne 0 ]; then
                status_text="$status_text | erro_fetch"
                ERROR_COUNT=$((ERROR_COUNT + 1))
                if [ -n "$fetch_out" ]; then
                    while IFS= read -r line; do
                        case "$line" in
                            *[![:space:]]*) details+=("  fetch_err: $line") ;;
                        esac
                    done <<< "$fetch_out"
                fi
            fi
        else
            pull_out="$(git -C "$repo_path" pull --ff-only 2>&1)"
            pull_rc=$?
            if [ "$pull_rc" -ne 0 ]; then
                status_text="ERRO_PULL"
                ERROR_COUNT=$((ERROR_COUNT + 1))
                if [ -n "$pull_out" ]; then
                    while IFS= read -r line; do
                        case "$line" in
                            *[![:space:]]*) details+=("  pull_err: $line") ;;
                        esac
                    done <<< "$pull_out"
                fi
            else
                after_out="$(git -C "$repo_path" rev-parse --short HEAD 2>&1)"
                after_rc=$?
                if [ "$after_rc" -eq 0 ] && [ -n "$after_out" ]; then
                    after_hash="$(printf '%s\n' "$after_out" | head -n 1)"
                else
                    after_hash=""
                fi
                if [ -n "$before_hash" ] && [ -n "$after_hash" ] && [ "$after_hash" != "$before_hash" ]; then
                    status_text="ATUALIZADO ($before_hash..$after_hash)"
                else
                    status_text="JA_ATUALIZADO"
                fi
                OK_OR_UPDATED=$((OK_OR_UPDATED + 1))
            fi
        fi
    else
        fetch_failed=0
        fetch_out="$(git -C "$repo_path" fetch --prune 2>&1)"
        fetch_rc=$?
        if [ "$fetch_rc" -ne 0 ]; then
            fetch_failed=1
            ERROR_COUNT=$((ERROR_COUNT + 1))
            if [ -n "$fetch_out" ]; then
                while IFS= read -r line; do
                    case "$line" in
                        *[![:space:]]*) details+=("  fetch_err: $line") ;;
                    esac
                done <<< "$fetch_out"
            fi
        fi

        read -r pre_ahead pre_behind <<< "$(get_repo_status_counts "$repo_path" "$upstream")"
        pendencias=()
        if [ "$dirty_count" -gt 0 ]; then
            pendencias+=("alteracoes_nao_commitadas=$dirty_count")
            if [ "${#dirty_lines[@]}" -gt 0 ]; then
                for line in "${dirty_lines[@]}"; do
                    details+=("  dirty: $line")
                done
            fi
        fi
        if [ "$pre_ahead" -gt 0 ]; then
            pendencias+=("commits_sem_push=$pre_ahead")
        fi
        if [ "$pre_behind" -gt 0 ]; then
            pendencias+=("commits_para_pull=$pre_behind")
        fi
        if [ "$stash_count" -gt 0 ]; then
            pendencias+=("stashes=$stash_count")
        fi
        if [ -z "$upstream" ]; then
            pendencias+=("sem_upstream")
        fi
        if [ "$fetch_failed" -eq 1 ]; then
            pendencias+=("erro_fetch")
        fi

        if [ "${#pendencias[@]}" -eq 0 ]; then
            status_text="OK"
            OK_OR_UPDATED=$((OK_OR_UPDATED + 1))
        else
            pendencias_joined=""
            for p in "${pendencias[@]}"; do
                if [ -z "$pendencias_joined" ]; then
                    pendencias_joined="$p"
                else
                    pendencias_joined="$pendencias_joined, $p"
                fi
            done
            status_text="PENDENTE ($pendencias_joined)"
            SKIPPED_OR_PENDING=$((SKIPPED_OR_PENDING + 1))
        fi
    fi

    read -r post_ahead post_behind <<< "$(get_repo_status_counts "$repo_path" "$upstream")"
    log_out="$(git -C "$repo_path" log -1 --oneline 2>&1)"
    log_rc=$?
    if [ "$log_rc" -eq 0 ] && [ -n "$log_out" ]; then
        last_commit="$(printf '%s\n' "$log_out" | head -n 1)"
    else
        last_commit="(sem commits)"
    fi

    upstream_display="(nenhum)"
    if [ -n "$upstream" ]; then
        upstream_display="$upstream"
    fi

    echo "=== $name ==="
    echo "branch: $branch | upstream: $upstream_display"
    echo "status: $status_text"
    echo "ahead: $post_ahead | behind: $post_behind | stashes: $stash_count"
    echo "commit: $last_commit"
    if [ "${#details[@]}" -gt 0 ]; then
        for d in "${details[@]}"; do
            echo "$d"
        done
    fi
done

echo "=== RESUMO ==="
if [ "$MODE" = "pull" ]; then
    echo "total=$TOTAL atualizados_ou_em_dia=$OK_OR_UPDATED pulados=$SKIPPED_OR_PENDING erros=$ERROR_COUNT"
else
    echo "total=$TOTAL ok=$OK_OR_UPDATED pendentes=$SKIPPED_OR_PENDING erros=$ERROR_COUNT"
fi

if [ "$ERROR_COUNT" -gt 0 ]; then
    exit 2
fi
exit 0

