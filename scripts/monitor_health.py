#!/usr/bin/env python3
"""
Monitor Automatizado de Saúde e Uptime do Portfólio Digital (portfolio-renda-usd).

Verifica disponibilidade HTTP, tempo de resposta (ms), integridade de certificados SSL
e gera relatório executivo consolidado sem dependências externas (Python standard library).
"""

from __future__ import annotations

import json
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


def check_url(target: dict[str, Any], timeout: float = 10.0) -> dict[str, Any]:
    """Perform HTTP probe on target URL and calculate metrics."""
    url = target["url"]
    expected = target["expected_code"]
    expected_codes = [expected] if isinstance(expected, int) else expected

    headers = {
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) PortfolioHealthMonitor/1.0",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    }

    req = urllib.request.Request(url, headers=headers)
    ssl_context = ssl.create_default_context()

    # If checking redirect, don't auto-follow
    if 301 in expected_codes or 302 in expected_codes:
        opener = urllib.request.build_opener(NoRedirectHandler)
    else:
        opener = urllib.request.build_opener()

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

    return {
        **target,
        "status_code": status_code,
        "latency_ms": latency_ms,
        "is_healthy": is_healthy,
        "error_message": error_message,
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
            if result["latency_ms"] < 600:
                badge = f"{GREEN}● ONLINE{RESET}"
            else:
                badge = f"{YELLOW}▲ LENTO {RESET}"
            print(f"  {badge}  {name} {latency}  {code_str}")
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


def save_markdown_report(results: list[dict[str, Any]], output_path: Path) -> None:
    """Save latest health check table into docs/STATUS_SAUDE_SISTEMAS.md."""
    now_str = datetime.now(timezone.utc).strftime("%d/%m/%Y às %H:%M:%S UTC")
    lines = [
        "# Relatório em Tempo Real: Saúde e Uptime dos Sistemas",
        "",
        f"> Última checagem automática executada em: **{now_str}**.",
        "",
        "| Categoria | Serviço / Endpoint | Status | HTTP | Latência (ms) | URL |",
        "| :--- | :--- | :--- | :--- | :--- | :--- |",
    ]

    for r in results:
        status_icon = "🟢 Online" if r["is_healthy"] else "🔴 Falha"
        if r["is_healthy"] and r["latency_ms"] >= 1000:
            status_icon = "🟡 Lento"
        lines.append(
            f"| {r['category']} | {r['name']} | {status_icon} | `{r['status_code']}` | `{r['latency_ms']} ms` | [{r['url']}]({r['url']}) |"
        )

    lines.extend([
        "",
        "---",
        "",
        "## Como Executar Novamente",
        "",
        "Para realizar uma nova checagem completa de saúde a qualquer momento:",
        "```bash",
        "python3 scripts/monitor_health.py",
        "```",
    ])

    output_path.write_text("\n".join(lines), encoding="utf-8")


if __name__ == "__main__":
    report_results = run_health_checks()
    report_file = Path(__file__).resolve().parent.parent / "docs" / "STATUS_SAUDE_SISTEMAS.md"
    save_markdown_report(report_results, report_file)
