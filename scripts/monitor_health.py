#!/usr/bin/env python3
"""
Monitor Automatizado de Saúde e Uptime do Portfólio Digital (portfolio-renda-usd).

Verifica disponibilidade HTTP, tempo de resposta (ms), integridade de certificados SSL
e gera relatório executivo consolidado sem dependências externas (Python standard library).
"""

from __future__ import annotations

import argparse
import os
import ssl
import sys
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

# ANSI Color Codes for terminal formatting
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
BLUE = "\033[94m"
BOLD = "\033[1m"
RESET = "\033[0m"

TARGETS: list[dict[str, Any]] = [
    {
        "category": "Portal Web (HomeEnergyCalcs)",
        "name": "Página Inicial (Root /)",
        "url": "https://homeenergycalcs.com/",
        "expected_code": 200,
        "critical": True,
    },
    {
        "category": "Portal Web (HomeEnergyCalcs)",
        "name": "Calculadora Estadual (Texas)",
        "url": "https://homeenergycalcs.com/ev-charging-cost/texas",
        "expected_code": 200,
        "critical": True,
    },
    {
        "category": "Portal Web (HomeEnergyCalcs)",
        "name": "Sitemap XML (SEO Indexing)",
        "url": "https://homeenergycalcs.com/sitemap.xml",
        "expected_code": 200,
        "critical": True,
    },
    {
        "category": "Portal Web (HomeEnergyCalcs)",
        "name": "Redirecionamento Canônico WWW",
        "url": "https://www.homeenergycalcs.com/",
        "expected_code": 301,
        "critical": False,
    },
    {
        "category": "Apify Store Actors",
        "name": "Actor #1 OSHA Safety Search",
        "url": "https://apify.com/ferraz_michel/osha-safety-compliance-mcp",
        "expected_code": 200,
        "critical": True,
    },
    {
        "category": "Apify Store Actors",
        "name": "Actor #2 EPA Environmental Search",
        "url": "https://apify.com/ferraz_michel/epa-echo-environmental-mcp",
        "expected_code": 200,
        "critical": True,
    },
    {
        "category": "APIs Oficiais Governamentais (Upstream)",
        "name": "US EPA ECHO REST Services",
        "url": "https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX",
        "expected_code": 200,
        "critical": False,
    },
    {
        "category": "APIs Oficiais Governamentais (Upstream)",
        "name": "US DOL Enforcement API Gateway",
        "url": "https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1",
        "expected_code": [200, 401],  # 401 is normal when pinging without API key
        "critical": False,
    },
]


class NoRedirectHandler(urllib.request.HTTPRedirectHandler):
    """Custom handler to inspect 301/302 redirects without automatically following them."""

    def redirect_request(self, req: Any, fp: Any, code: int, msg: str, headers: Any, newurl: str) -> None:
        return None


def _probe_once(url: str, expected_codes: list[int], timeout: float) -> tuple[int, float, bool, str | None]:
    """Execute a single HTTP request and return status, latency, health flag, and error."""
    headers = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) PortfolioHealthMonitor/1.0",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    }
    req = urllib.request.Request(url, headers=headers)
    https_handler = urllib.request.HTTPSHandler(context=ssl.create_default_context())

    if 301 in expected_codes or 302 in expected_codes:
        opener = urllib.request.build_opener(NoRedirectHandler, https_handler)
    else:
        opener = urllib.request.build_opener(https_handler)

    start_time = time.perf_counter()
    status_code = 0
    error_message = None

    try:
        with opener.open(req, timeout=timeout) as response:
            status_code = response.getcode()
    except urllib.error.HTTPError as exc:
        status_code = exc.code
    except urllib.error.URLError as exc:
        error_message = str(exc.reason)
    except Exception as exc:
        error_message = str(exc)

    latency_ms = round((time.perf_counter() - start_time) * 1000, 1)
    is_healthy = status_code in expected_codes
    if not is_healthy and error_message is None:
        error_message = f"Status code {status_code} inesperado (esperado: {expected_codes})"

    return status_code, latency_ms, is_healthy, error_message


def check_url(
    target: dict[str, Any],
    timeout: float = 10.0,
    retries: int = 2,
    retry_delay: float = 2.0,
) -> dict[str, Any]:
    """Perform HTTP probe on target URL with automatic retries to avoid transient false alarms."""
    url = target["url"]
    expected = target["expected_code"]
    expected_codes = [expected] if isinstance(expected, int) else expected

    status_code = 0
    latency_ms = 0.0
    is_healthy = False
    error_message: str | None = None
    attempts_used = 0

    for attempt in range(retries + 1):
        attempts_used = attempt + 1
        status_code, latency_ms, is_healthy, error_message = _probe_once(url, expected_codes, timeout)
        if is_healthy:
            break
        if attempt < retries:
            time.sleep(retry_delay)

    return {
        **target,
        "status_code": status_code,
        "latency_ms": latency_ms,
        "is_healthy": is_healthy,
        "error_message": error_message,
        "attempts": attempts_used,
    }


def run_health_checks() -> list[dict[str, Any]]:
    """Execute all health checks and print results to terminal."""
    now_utc = datetime.now(timezone.utc).strftime("%d/%m/%Y %H:%M:%S UTC")
    print(f"\n{BOLD}{BLUE}==================================================================={RESET}")
    print(f"{BOLD}{BLUE}  MONITOR DE CONTROLE E SAÚDE DO PORTFÓLIO (PORTFOLIO-RENDA-USD)   {RESET}")
    print(f"{BOLD}{BLUE}  Data/Hora: {now_utc}                                       {RESET}")
    print(f"{BOLD}{BLUE}==================================================================={RESET}\n")

    results = []
    current_category = ""

    for target in TARGETS:
        category = target["category"]
        if category != current_category:
            current_category = category
            print(f"{BOLD}► {current_category}:{RESET}")

        result = check_url(target)
        results.append(result)

        name = result["name"].ljust(35)
        latency = f"{result['latency_ms']} ms".rjust(10)
        code_str = f"[{result['status_code']}]".rjust(6)

        if result["is_healthy"]:
            badge = f"{GREEN}● ONLINE{RESET}" if result["latency_ms"] < 600 else f"{YELLOW}▲ LENTO {RESET}"
            retry_note = f" (após {result['attempts']} tentativas)" if result["attempts"] > 1 else ""
            print(f"  {badge}  {name} {latency}  {code_str}{retry_note}")
        else:
            badge = f"{RED}✖ FALHA {RESET}"
            err = result["error_message"] or "Indisponível"
            print(f"  {badge}  {name} {latency}  {code_str} -> {RED}{err}{RESET}")

    total = len(results)
    healthy_count = sum(1 for r in results if r["is_healthy"])
    critical_failures = sum(1 for r in results if not r["is_healthy"] and r.get("critical"))

    print(f"\n{BOLD}-------------------------------------------------------------------{RESET}")
    if critical_failures == 0:
        summary_color = GREEN
        summary_text = "TODOS OS SERVIÇOS CRÍTICOS OPERANDO NORMALMENTE"
    else:
        summary_color = RED
        summary_text = f"ATENÇÃO: {critical_failures} SERVIÇO(S) CRÍTICO(S) COM FALHA"

    print(f"Status Geral: {summary_color}{BOLD}{summary_text}{RESET} ({healthy_count}/{total} ativos saudáveis)")
    print(f"{BOLD}-------------------------------------------------------------------{RESET}\n")

    return results


def build_status_table_lines(results: list[dict[str, Any]]) -> list[str]:
    """Format health check results as Markdown table rows."""
    lines = [
        "| Categoria | Serviço / Endpoint | Status | HTTP | Latência (ms) | URL |",
        "| :--- | :--- | :--- | :--- | :--- | :--- |",
    ]
    for r in results:
        if not r["is_healthy"]:
            status_icon = "🔴 Falha"
        elif r["latency_ms"] >= 1000:
            status_icon = "🟡 Lento"
        else:
            status_icon = "🟢 Online"
        lines.append(
            f"| {r['category']} | {r['name']} | {status_icon} | `{r['status_code']}` | `{r['latency_ms']} ms` | [{r['url']}]({r['url']}) |"
        )
    return lines


def save_markdown_report(results: list[dict[str, Any]], output_path: Path) -> None:
    """Save latest health check table into docs/STATUS_SAUDE_SISTEMAS.md."""
    now_str = datetime.now(timezone.utc).strftime("%d/%m/%Y às %H:%M:%S UTC")
    lines = [
        "# Relatório em Tempo Real: Saúde e Uptime dos Sistemas",
        "",
        f"> Última checagem automática executada em: **{now_str}**.",
        "",
        *build_status_table_lines(results),
        "",
        "---",
        "",
        "## Como Executar Novamente",
        "",
        "Para realizar uma nova checagem completa de saúde a qualquer momento:",
        "```bash",
        "python3 scripts/monitor_health.py",
        "```",
    ]
    output_path.write_text("\n".join(lines), encoding="utf-8")


def write_github_step_summary(results: list[dict[str, Any]], summary_path: str) -> None:
    """Write Markdown summary table to GitHub Actions Step Summary."""
    now_str = datetime.now(timezone.utc).strftime("%d/%m/%Y às %H:%M:%S UTC")
    critical_failures = [r for r in results if not r["is_healthy"] and r.get("critical")]

    lines = [
        "## Monitor de Uptime — Portfólio Renda USD",
        "",
        f"Executado em: **{now_str}**",
        "",
        *build_status_table_lines(results),
        "",
    ]

    if critical_failures:
        lines.append("### ❌ Serviços Críticos com Falha")
        lines.append("")
        for fail in critical_failures:
            lines.append(f"- **{fail['name']}** ({fail['url']}): `{fail['error_message']}`")
        lines.append("")
    else:
        lines.append("✅ Todos os serviços críticos operam normalmente.")
        lines.append("")

    with Path(summary_path).open("a", encoding="utf-8") as fp:
        fp.write("\n".join(lines))


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    """Parse CLI arguments."""
    parser = argparse.ArgumentParser(description="Monitor de saúde e uptime do portfólio.")
    parser.add_argument(
        "--fail-on-critical",
        action="store_true",
        help="Encerra com código de saída 1 se houver falha em serviço crítico.",
    )
    parser.add_argument(
        "--no-save",
        action="store_true",
        help="Não sobrescreve docs/STATUS_SAUDE_SISTEMAS.md (recomendado para CI).",
    )
    return parser.parse_args(argv)


if __name__ == "__main__":
    args = parse_args()
    report_results = run_health_checks()

    if not args.no_save:
        report_file = Path(__file__).resolve().parent.parent / "docs" / "STATUS_SAUDE_SISTEMAS.md"
        save_markdown_report(report_results, report_file)

    gh_summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if gh_summary:
        write_github_step_summary(report_results, gh_summary)

    critical_fail_count = sum(1 for r in report_results if not r["is_healthy"] and r.get("critical"))
    if args.fail_on_critical and critical_fail_count > 0:
        sys.exit(1)
