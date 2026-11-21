# Relatório em Tempo Real: Saúde e Uptime dos Sistemas

> Última checagem automática executada em: **21/11/2026 às 17:19:59 UTC**.

| Categoria | Serviço / Endpoint | Status | HTTP | Latência (ms) | URL |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Portal Web (HomeEnergyCalcs) | Página Inicial (Root /) | 🟢 Online | `200` | `375.9 ms` | [https://homeenergycalcs.com/](https://homeenergycalcs.com/) |
| Portal Web (HomeEnergyCalcs) | Calculadora Estadual (Texas) | 🟢 Online | `200` | `182.0 ms` | [https://homeenergycalcs.com/ev-charging-cost/texas](https://homeenergycalcs.com/ev-charging-cost/texas) |
| Portal Web (HomeEnergyCalcs) | Sitemap XML (SEO Indexing) | 🟢 Online | `200` | `176.9 ms` | [https://homeenergycalcs.com/sitemap.xml](https://homeenergycalcs.com/sitemap.xml) |
| Portal Web (HomeEnergyCalcs) | Redirecionamento Canônico WWW | 🟢 Online | `301` | `169.0 ms` | [https://www.homeenergycalcs.com/](https://www.homeenergycalcs.com/) |
| Apify Store Actors | Actor #1 OSHA Safety Search | 🟢 Online | `200` | `539.5 ms` | [https://apify.com/ferraz_michel/osha-safety-compliance-mcp](https://apify.com/ferraz_michel/osha-safety-compliance-mcp) |
| Apify Store Actors | Actor #2 EPA Environmental Search | 🟢 Online | `200` | `437.3 ms` | [https://apify.com/ferraz_michel/epa-echo-environmental-mcp](https://apify.com/ferraz_michel/epa-echo-environmental-mcp) |
| APIs Oficiais Governamentais (Upstream) | US EPA ECHO REST Services | 🟡 Lento | `200` | `2802.7 ms` | [https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX](https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX) |
| APIs Oficiais Governamentais (Upstream) | US DOL Enforcement API Gateway | 🟡 Lento | `401` | `1040.3 ms` | [https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1](https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1) |

---

## Como Executar Novamente

Para realizar uma nova checagem completa de saúde a qualquer momento:
```bash
python3 scripts/monitor_health.py
```