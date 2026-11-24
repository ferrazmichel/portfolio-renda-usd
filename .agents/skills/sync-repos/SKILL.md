---
name: sync-repos
description: >-
  Synchronize and check all Git repositories in the current workspace across work and home machines.
  Use when the user invokes /sync-repos, asks to sync or pull all repositories at the start of work,
  or asks to check pending uncommitted changes, unpushed commits, or stashes before switching machines.
---

# Sync Repos

Sincroniza ou verifica todos os repositórios Git do workspace atual usando [sync_repos.ps1](./scripts/sync_repos.ps1) (Windows) ou [sync_repos.sh](./scripts/sync_repos.sh) (macOS/Linux), sem depender de Python ou Node.js.

## Modos de Uso

- **`pull` (padrão — início do dia):**
  - Descobre todos os repositórios Git no workspace (`RootPath`).
  - Se o repositório tiver alterações locais não commitadas, **pula** o `pull` para proteger o trabalho local e faz apenas `git fetch --prune` para diagnóstico.
  - Nos repositórios limpos, executa `git pull --ff-only` e informa o último commit.
- **`check` (checagem — fim do dia / antes de trocar de máquina):**
  - Não altera o working tree.
  - Executa `git fetch --prune` e reporta alterações não commitadas, commits sem `push` (`ahead`), commits pendentes de `pull` (`behind`) e `stashes`.

## Execução

Determine o modo pedido pelo usuário (`pull` por padrão; `check` se pedir checagem, pendências, status ou "antes de sair") e execute o script correspondente ao sistema operacional com o caminho absoluto do workspace atual:

**Windows (PowerShell):**

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<CAMINHO_PARA_ESTA_SKILL>\scripts\sync_repos.ps1" -Mode <pull|check> -RootPath "<WORKSPACE_ROOT>"
```

Exemplo com a skill global (Windows):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "$env:USERPROFILE\.gemini\config\skills\sync-repos\scripts\sync_repos.ps1" -Mode pull -RootPath "<WORKSPACE_ROOT>"
```

**macOS / Linux (Bash):**

```bash
bash "<CAMINHO_PARA_ESTA_SKILL>/scripts/sync_repos.sh" --mode <pull|check> --root "<WORKSPACE_ROOT>"
```

Exemplo com a skill global (macOS / Linux):

```bash
bash "$HOME/.gemini/config/skills/sync-repos/scripts/sync_repos.sh" --mode pull --root "<WORKSPACE_ROOT>"
```

## Formato da Resposta

Responda em **português**, de forma enxuta, apresentando um resumo por repositório (status, branch, último commit e pendências/erros quando existirem).

## Regras de Segurança

- **Nunca** execute `git push`, `merge`, `rebase`, `reset` ou descarte alterações locais sem confirmação explícita do usuário.
- **Nunca** altere a conta ativa global do `gh` CLI (`gh auth switch`).
- Se algum repositório pessoal falhar no PC corporativo com `Repository not found` (ou erro de permissão), informe o usuário que o repositório pode estar sem `credential.https://github.com.helper` local configurado para a conta `ferrazmichel`.

## Instalação Global (PC de Casa / Trabalho)

Após fazer `git pull` do repositório `portfolio-renda-usd`, entre na pasta do repositório e instale esta skill globalmente no computador executando:

**Windows (PowerShell):**

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\.agents\skills\sync-repos\scripts\install_global.ps1"
```

**macOS / Linux (Bash / Zsh):**

```bash
bash "./.agents/skills/sync-repos/scripts/install_global.sh"
```
