#!/usr/bin/env bash
set -euo pipefail

MODE="all"
PORTFOLIO_PATH=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --mode|-m)
      MODE="${2:-all}"
      shift 2
      ;;
    --portfolio|-p|--root)
      PORTFOLIO_PATH="${2:-}"
      shift 2
      ;;
    all|receita|saude)
      MODE="$1"
      shift
      ;;
    *)
      echo "ERRO: Argumento desconhecido: $1 (use --mode <all|receita|saude> [--portfolio <caminho>])" >&2
      exit 2
      ;;
  esac
done

case "$MODE" in
  all|receita|saude) ;;
  *)
    echo "ERRO: Modo invalido '$MODE'. Use: all, receita ou saude." >&2
    exit 2
    ;;
esac

if ! command -v python3 >/dev/null 2>&1; then
  echo "ERRO: python3 nao encontrado no PATH." >&2
  exit 2
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "ERRO: curl nao encontrado no PATH." >&2
  exit 2
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

python3 - "$MODE" "$PORTFOLIO_PATH" "$SCRIPT_DIR" <<'PYEOF'
from concurrent.futures import ThreadPoolExecutor
import datetime
import json
import os
import subprocess
import sys
import time

mode = sys.argv[1]
portfolio_hint = sys.argv[2]
script_dir = sys.argv[3]

CURL_ENV = {**os.environ, "LC_ALL": "C"}


def get_env_secret(name: str) -> str:
    val = os.environ.get(name, "")
    return val.strip() if val else ""


def resolve_portfolio_root(hint: str) -> str:
    candidates = []
    if hint and hint.strip():
        candidates.append(hint.strip())
    cwd = os.getcwd()
    candidates.append(os.path.join(cwd, "portfolio-renda-usd"))
    candidates.append(cwd)
    parent = os.path.dirname(cwd)
    if parent:
        candidates.append(os.path.join(parent, "portfolio-renda-usd"))
    candidates.append(os.path.expanduser("~/Documents/Meus projetos/pessoal/portfolio-renda-usd"))
    candidates.append(os.path.expanduser("~/pessoal/repositorios/portfolio-renda-usd"))
    candidates.append(os.path.abspath(os.path.join(script_dir, "..", "..", "..", "..")))

    for cand in candidates:
        if cand and os.path.isfile(os.path.join(cand, "data", "receitas_portfolio.json")):
            return os.path.realpath(cand)
    return ""


def curl_json(url: str, headers=None, timeout: int = 12):
    cmd = [
        "curl",
        "-sS",
        "-g",
        "-L",
        "--max-time",
        str(timeout),
        "--connect-timeout",
        str(timeout),
        "-w",
        "\n%{http_code}",
    ]
    for k, v in (headers or {}).items():
        cmd.extend(["-H", f"{k}: {v}"])
    cmd.append(url)

    try:
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            env=CURL_ENV,
            timeout=timeout + 5,
        )
    except Exception as exc:
        return {"ok": False, "status_code": 0, "data": None, "error": str(exc)}

    out = proc.stdout or ""
    if proc.returncode != 0:
        err = (proc.stderr or "").strip() or f"curl exit {proc.returncode}"
        return {"ok": False, "status_code": 0, "data": None, "error": err}

    parts = out.rsplit("\n", 1)
    if len(parts) == 2:
        body, code_str = parts[0], parts[1].strip()
    else:
        body, code_str = "", out.strip()

    try:
        code = int(code_str)
    except ValueError:
        code = 0

    if 200 <= code < 300:
        try:
            return {"ok": True, "status_code": code, "data": json.loads(body), "error": ""}
        except Exception as exc:
            return {"ok": False, "status_code": code, "data": None, "error": f"JSON invalido: {exc}"}

    return {"ok": False, "status_code": code, "data": None, "error": f"HTTP {code}"}


def get_usd_brl_rate():
    fx_res = curl_json("https://economia.awesomeapi.com.br/json/last/USD-BRL", timeout=10)
    if fx_res["ok"] and isinstance(fx_res["data"], dict):
        usdbrl = fx_res["data"].get("USDBRL") or {}
        if usdbrl.get("bid"):
            try:
                return {
                    "rate": float(str(usdbrl["bid"])),
                    "source": "AwesomeAPI",
                    "date": str(usdbrl.get("create_date", "")),
                }
            except ValueError:
                pass

    today = datetime.date.today()
    start_str = (today - datetime.timedelta(days=7)).strftime("%m-%d-%Y")
    end_str = today.strftime("%m-%d-%Y")
    bcb_url = (
        "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/"
        f"CotacaoDolarPeriodo(dataInicial=@i,dataFinalCotacao=@f)?@i='{start_str}'&@f='{end_str}'"
        "&$top=1&$orderby=dataHoraCotacao%20desc&$format=json"
    )
    bcb_res = curl_json(bcb_url, timeout=10)
    if bcb_res["ok"] and isinstance(bcb_res["data"], dict):
        vals = bcb_res["data"].get("value") or []
        if len(vals) > 0 and vals[0].get("cotacaoVenda") is not None:
            try:
                return {
                    "rate": float(vals[0]["cotacaoVenda"]),
                    "source": "BCB_PTAX",
                    "date": str(vals[0].get("dataHoraCotacao", "")),
                }
            except ValueError:
                pass

    return {
        "rate": 5.75,
        "source": "FALLBACK",
        "date": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    }


def invoke_apify_get(uri: str, token: str):
    headers = {"Accept": "application/json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    return curl_json(uri, headers=headers, timeout=12)


def http_probe_once(url: str, expected_codes, timeout_sec: int = 10):
    """
    Faz GET real e encerra assim que os headers da resposta final chegam (TTFB),
    equivalente ao HttpWebRequest.GetResponse() + Close() do painel_usd.ps1.
    """
    follow_redirects = (301 not in expected_codes) and (302 not in expected_codes)
    cmd = [
        "curl",
        "-sS",
        "-g",
        "-N",
        "--suppress-connect-headers",
        "-D",
        "-",
        "-o",
        "/dev/null",
        "--max-time",
        str(timeout_sec),
        "--connect-timeout",
        str(timeout_sec),
        "-A",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) PortfolioHealthMonitor/1.0",
        "-H",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    ]
    if follow_redirects:
        cmd.append("-L")
    cmd.append(url)

    status_code = 0
    latency_ms = 0.0
    err_msg = ""

    t0 = time.monotonic()
    proc = None
    try:
        proc = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            env=CURL_ENV,
        )
        block_status = 0
        block_status_line = ""
        while True:
            line_bytes = proc.stdout.readline()
            if not line_bytes:
                break
            line = line_bytes.decode("latin-1", errors="replace").strip()
            if line.upper().startswith("HTTP/"):
                block_status_line = line
                parts = line.split()
                if len(parts) >= 2:
                    try:
                        block_status = int(parts[1])
                    except ValueError:
                        block_status = 0
            elif line == "" and block_status > 0:
                is_proxy_connect = (
                    block_status == 200
                    and "connection established" in block_status_line.lower()
                )
                is_informational = 100 <= block_status < 200
                is_redirect = follow_redirects and block_status in (301, 302, 303, 307, 308)

                status_code = block_status
                if is_proxy_connect or is_informational or is_redirect:
                    block_status = 0
                    block_status_line = ""
                    continue
                # Headers finais recebidos: mede TTFB e encerra sem baixar o corpo inteiro
                latency_ms = round((time.monotonic() - t0) * 1000.0, 1)
                break

        if latency_ms == 0.0:
            latency_ms = round((time.monotonic() - t0) * 1000.0, 1)

        if proc.poll() is None:
            try:
                proc.terminate()
            except ProcessLookupError:
                pass

        try:
            _, stderr_bytes = proc.communicate(timeout=2)
        except subprocess.TimeoutExpired:
            proc.kill()
            _, stderr_bytes = proc.communicate()

        if status_code == 0 and proc.returncode != 0:
            err_msg = stderr_bytes.decode("utf-8", errors="replace").strip() or f"curl exit {proc.returncode}"
    except Exception as exc:
        latency_ms = round((time.monotonic() - t0) * 1000.0, 1)
        err_msg = str(exc)
        if proc is not None and proc.poll() is None:
            try:
                proc.kill()
                proc.wait(timeout=2)
            except Exception:
                pass

    healthy = status_code in expected_codes
    if not healthy and not err_msg:
        exp_str = ",".join(str(c) for c in expected_codes)
        err_msg = f"HTTP {status_code} inesperado (esperado: {exp_str})"

    return {
        "status_code": status_code,
        "latency_ms": latency_ms,
        "is_healthy": healthy,
        "error": err_msg,
    }


def http_probe_with_retry(url: str, expected_codes, retries: int = 2, delay_sec: int = 2):
    last = None
    attempts = 0
    for i in range(retries + 1):
        attempts = i + 1
        last = http_probe_once(url, expected_codes)
        if last["is_healthy"]:
            break
        if i < retries:
            time.sleep(delay_sec)
    last["attempts"] = attempts
    return last


def fmt2(val: float) -> str:
    return f"{float(val):.2f}"


portfolio_root = resolve_portfolio_root(portfolio_hint)
if not portfolio_root:
    print("ERRO: Nao foi possivel localizar portfolio-renda-usd/data/receitas_portfolio.json")
    sys.exit(2)

ledger_path = os.path.join(portfolio_root, "data", "receitas_portfolio.json")
try:
    with open(ledger_path, "r", encoding="utf-8") as fh:
        ledger = json.load(fh)
except Exception as exc:
    print(f"ERRO: Falha ao ler JSON financeiro em {ledger_path} : {exc}")
    sys.exit(2)

critical_health_failures = 0
now_str = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print(f"PAINEL_USD mode={mode} portfolio={portfolio_root} generated_at={now_str}")

if mode in ("all", "receita"):
    fx = get_usd_brl_rate()
    rate = float(fx["rate"])

    print("=== CAMBIO ===")
    print(f"usd_brl={fmt2(rate)} | fonte={fx['source']} | ref={fx['date']}")

    tot_apify_bruto = 0.0
    tot_apify_liq = 0.0
    tot_ads = 0.0
    tot_shop = 0.0
    tot_afil = 0.0
    tot_custos = 0.0
    tot_wise_brl = 0.0
    meses = ledger.get("meses") or []
    mes_count = len(meses)

    for m in meses:
        tot_apify_bruto += float(m.get("apify_bruto_usd", 0.0))
        tot_apify_liq += float(m.get("apify_liquido_usd", 0.0))
        tot_ads += float(m.get("ads_web_usd", 0.0))
        tot_shop += float(m.get("shoppulse_usd", 0.0))
        tot_afil += float(m.get("afiliados_usd", 0.0))
        tot_custos += float(m.get("custos_infra_usd", 0.0))
        tot_wise_brl += float(m.get("resgate_wise_brl", 0.0))

    bruto_total_usd = tot_apify_bruto + tot_ads + tot_shop + tot_afil
    liq_total_usd = tot_apify_liq + tot_ads + tot_shop + tot_afil
    lucro_liq_usd = liq_total_usd - tot_custos

    metas = ledger.get("metas") or {}
    wise_min = float(metas.get("wise_min_payout_usd", 20.0))
    falta_wise = max(0.0, wise_min - tot_apify_liq)
    meta_mensal_liq = float(metas.get("marco2_liq_usd", 0.0))
    pct_meta2 = (
        min(100.0, (max(0.0, lucro_liq_usd) / meta_mensal_liq) * 100.0)
        if meta_mensal_liq > 0
        else 0.0
    )

    print("=== RECEITAS_ACUMULADAS (LEDGER) ===")
    print(
        f"meses_registrados={mes_count} | apify_bruto_usd={fmt2(tot_apify_bruto)} | "
        f"apify_liquido_usd={fmt2(tot_apify_liq)} | ads_web_usd={fmt2(tot_ads)} | "
        f"shoppulse_usd={fmt2(tot_shop)} | afiliados_usd={fmt2(tot_afil)}"
    )
    print(f"receita_bruta_total_usd={fmt2(bruto_total_usd)} (BRL {fmt2(bruto_total_usd * rate)})")
    print(f"receita_liquida_total_usd={fmt2(liq_total_usd)} (BRL {fmt2(liq_total_usd * rate)})")
    print(f"custos_infra_usd={fmt2(tot_custos)} (BRL {fmt2(tot_custos * rate)})")
    print(f"lucro_liquido_usd={fmt2(lucro_liq_usd)} (BRL {fmt2(lucro_liq_usd * rate)})")
    print(f"resgate_wise_brl={fmt2(tot_wise_brl)}")
    print(f"saque_minimo_wise_usd={fmt2(wise_min)} | falta_para_saque_apify_usd={fmt2(falta_wise)}")
    print(f"meta_mensal_marco2_liq_usd={fmt2(meta_mensal_liq)} | progresso_acumulado_pct={fmt2(pct_meta2)}%")

    if mes_count > 0:
        ultimo = meses[-1]
        m_lucro = (
            float(ultimo.get("apify_liquido_usd", 0.0))
            + float(ultimo.get("ads_web_usd", 0.0))
            + float(ultimo.get("shoppulse_usd", 0.0))
            + float(ultimo.get("afiliados_usd", 0.0))
            - float(ultimo.get("custos_infra_usd", 0.0))
        )
        print(f"ultimo_mes={ultimo.get('mes', '')} | lucro_mes_usd={fmt2(m_lucro)} | obs={ultimo.get('observacao', '')}")

    print("=== DOMINIOS_MATURACAO ===")
    today = datetime.date.today()
    for dom in ledger.get("dominios") or []:
        reg_str = str(dom.get("registrado_em", ""))
        reg_date = datetime.date.fromisoformat(reg_str)
        dias_ativos = (today - reg_date).days
        meta_dias = int(dom.get("meta_dias_mediavine", 120))
        restantes = max(0, meta_dias - dias_ativos)
        qualif_date = (reg_date + datetime.timedelta(days=meta_dias)).isoformat()
        print(
            f"dominio={dom.get('nome', '')} | registrado_em={reg_str} | "
            f"dias_ativos={dias_ativos}/{meta_dias} | faltam_dias={restantes} | "
            f"qualificacao_prevista={qualif_date}"
        )

    print("=== APIFY_STORE_AO_VIVO ===")
    apify_token = get_env_secret("APIFY_TOKEN")
    polar_token = get_env_secret("POLAR_ACCESS_TOKEN")
    lemon_token = get_env_secret("LEMONSQUEEZY_API_KEY")
    auth_mode = "AUTENTICADO" if apify_token else "PUBLICO"
    polar_status = "configurado" if polar_token else "nao_configurado"
    lemon_status = "configurado" if lemon_token else "nao_configurado"
    print(f"apify_auth_mode={auth_mode} | polar_token={polar_status} | lemonsqueezy_token={lemon_status}")

    if apify_token:
        usage_res = invoke_apify_get("https://api.apify.com/v2/users/me/usage/monthly", apify_token)
        limits_res = invoke_apify_get("https://api.apify.com/v2/users/me/limits", apify_token)
        if usage_res["ok"] and isinstance(usage_res["data"], dict) and usage_res["data"].get("data"):
            u_data = usage_res["data"]["data"]
            usd_used = u_data.get("totalUsageCreditsUsdAfterVolumeDiscount")
            if usd_used is None:
                usd_used = u_data.get("totalUsageCreditsUsdBeforeVolumeDiscount")
            usd_used = float(usd_used) if usd_used is not None else 0.0

            max_usd = 0.0
            if limits_res["ok"] and isinstance(limits_res["data"], dict):
                l_limits = (limits_res["data"].get("data") or {}).get("limits") or {}
                if l_limits.get("maxMonthlyUsageUsd") is not None:
                    max_usd = float(l_limits["maxMonthlyUsageUsd"])
            print(f"conta_apify_uso_mensal_usd={fmt2(usd_used)} | limite_mensal_usd={fmt2(max_usd)}")

    actor_ids = []
    if apify_token:
        list_res = invoke_apify_get("https://api.apify.com/v2/acts?my=true&limit=100", apify_token)
        if list_res["ok"] and isinstance(list_res["data"], dict):
            items = (list_res["data"].get("data") or {}).get("items") or []
            for it in items:
                actor_ids.append({"label": it.get("name", ""), "query_id": it.get("id", "")})

    if not actor_ids:
        apify_user = str(ledger.get("apify_username", ""))
        for slug in ledger.get("apify_actors_fallback") or []:
            actor_ids.append({"label": slug, "query_id": f"{apify_user}~{slug}"})

    sum_users_total = 0
    sum_users_30d = 0
    sum_runs_total = 0
    sum_runs_30d = 0
    sum_succeeded_30d = 0
    public_actors = 0
    private_or_unpub = 0

    with ThreadPoolExecutor(max_workers=min(8, max(1, len(actor_ids)))) as pool:
        actor_results = list(
            pool.map(
                lambda t: (t, invoke_apify_get(f"https://api.apify.com/v2/acts/{t['query_id']}", apify_token)),
                actor_ids,
            )
        )

    for target, act_res in actor_results:
        if not act_res["ok"]:
            if act_res["status_code"] == 404:
                private_or_unpub += 1
                print(f"actor={target['label']} | status=PRIVADO_OU_NAO_PUBLICADO (HTTP 404 sem APIFY_TOKEN)")
            else:
                print(f"actor={target['label']} | status=ERRO_API (HTTP {act_res['status_code']}: {act_res['error']})")
            continue

        d = (act_res["data"] or {}).get("data") or {}
        is_pub = bool(d.get("isPublic", False))
        if is_pub:
            public_actors += 1
        else:
            private_or_unpub += 1

        pricing_model = "FREE"
        pricing_list = d.get("pricingInfos") or []
        if pricing_list:
            latest_p = pricing_list[-1]
            if isinstance(latest_p, dict) and latest_p.get("pricingModel"):
                pricing_model = str(latest_p["pricingModel"])

        st = d.get("stats") or {}
        u_tot = int(st.get("totalUsers") or 0)
        u_30 = int(st.get("totalUsers30Days") or 0)
        r_tot = int(st.get("totalRuns") or 0)
        pub_stats = st.get("publicActorRunStats30Days") or {}
        r_30_tot = int(pub_stats.get("TOTAL") or 0)
        r_30_ok = int(pub_stats.get("SUCCEEDED") or 0)
        bkm = int(st.get("bookmarkCount") or 0)
        last_run = str(st.get("lastRunStartedAt") or "-")

        sum_users_total += u_tot
        sum_users_30d += u_30
        sum_runs_total += r_tot
        sum_runs_30d += r_30_tot
        sum_succeeded_30d += r_30_ok

        print(
            f"actor={d.get('name', target['label'])} | publico={is_pub} | pricing={pricing_model} | "
            f"users_total={u_tot} | users_30d={u_30} | runs_total={r_tot} | "
            f"runs_30d={r_30_ok}/{r_30_tot} | bookmarks={bkm} | last_run={last_run}"
        )

    print(
        f"apify_totais: actors_publicos={public_actors} priv_ou_nao_pub={private_or_unpub} "
        f"users_total={sum_users_total} users_30d={sum_users_30d} "
        f"runs_total={sum_runs_total} runs_30d_ok={sum_succeeded_30d}/{sum_runs_30d}"
    )
    print(
        "nota_apify_payouts: API v2 nao expoe extrato fechado de Creator Payouts em USD; "
        "confira Apify Console > Development > Insights > Payouts e registre em data/receitas_portfolio.json"
    )

if mode in ("all", "saude"):
    print("=== SAUDE_UPTIME ===")
    targets = [
        {"category": "Portal Web", "name": "HomeEnergyCalcs Root /", "url": "https://homeenergycalcs.com/", "expected": [200], "critical": True},
        {"category": "Portal Web", "name": "EV Charging (Texas)", "url": "https://homeenergycalcs.com/ev-charging-cost/texas", "expected": [200], "critical": True},
        {"category": "Portal Web", "name": "Heat Pump (Ohio)", "url": "https://homeenergycalcs.com/heat-pump-vs-gas/ohio", "expected": [200], "critical": True},
        {"category": "Portal Web", "name": "Solar Payback (Arizona)", "url": "https://homeenergycalcs.com/solar-payback/arizona", "expected": [200], "critical": True},
        {"category": "Portal Web", "name": "Sitemap XML", "url": "https://homeenergycalcs.com/sitemap.xml", "expected": [200], "critical": True},
        {"category": "Portal Web", "name": "Redirect WWW (301)", "url": "https://www.homeenergycalcs.com/", "expected": [301], "critical": False},
        {"category": "Apify Store", "name": "Actor #1 OSHA", "url": "https://apify.com/ferraz_michel/osha-safety-compliance-mcp", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #2 EPA ECHO", "url": "https://apify.com/ferraz_michel/epa-echo-environmental-mcp", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #3 FMCSA", "url": "https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #4 USITC HTS", "url": "https://apify.com/ferraz_michel/usitc-hts-tariff-mcp", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #5 US 1099-NEC", "url": "https://apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #6 openFDA", "url": "https://apify.com/ferraz_michel/openfda-recall-device-radar", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #7 SEC EDGAR", "url": "https://apify.com/ferraz_michel/sec-edgar-filings-mcp", "expected": [200], "critical": True},
        {"category": "Apify Store", "name": "Actor #8 USAspending", "url": "https://apify.com/ferraz_michel/usaspending-federal-contracts-mcp", "expected": [200], "critical": True},
        {"category": "APIs Gov EUA", "name": "US EPA ECHO REST", "url": "https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX", "expected": [200], "critical": False},
        {"category": "APIs Gov EUA", "name": "US FDA openFDA", "url": "https://api.fda.gov/device/enforcement.json?limit=1", "expected": [200], "critical": False},
        {"category": "APIs Gov EUA", "name": "USITC HTS REST", "url": "https://hts.usitc.gov/reststop/search?keyword=8507.60", "expected": [200], "critical": False},
        {"category": "APIs Gov EUA", "name": "US DOL API Gateway", "url": "https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1", "expected": [200, 401], "critical": False},
    ]

    with ThreadPoolExecutor(max_workers=9) as pool:
        probe_results = list(
            pool.map(lambda t: (t, http_probe_with_retry(t["url"], t["expected"])), targets)
        )

    healthy_count = 0
    total_targets = len(targets)

    for t, probe in probe_results:
        if probe["is_healthy"]:
            healthy_count += 1
            badge = "LENTO" if probe["latency_ms"] >= 1000 else "ONLINE"
            retry_info = f" (tentativas={probe['attempts']})" if probe["attempts"] > 1 else ""
            print(f"[{badge}] {t['category']} | {t['name']} | HTTP {probe['status_code']} | {probe['latency_ms']} ms{retry_info}")
        else:
            if t["critical"]:
                critical_health_failures += 1
            print(
                f"[FALHA] {t['category']} | {t['name']} | HTTP {probe['status_code']} | "
                f"{probe['latency_ms']} ms | critical={t['critical']} | err={probe['error']}"
            )

    print(f"saude_resumo: saudaveis={healthy_count}/{total_targets} falhas_criticas={critical_health_failures}")

if critical_health_failures > 0:
    sys.exit(2)
sys.exit(0)
PYEOF
