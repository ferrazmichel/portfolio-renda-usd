# Relatório em Tempo Real: Saúde e Uptime dos Sistemas

> Última checagem automática executada em: **21/11/2026 às 20:05:09 UTC**.

| Categoria | Serviço / Endpoint | Status | HTTP | Latência (ms) | URL |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Portal Web (HomeEnergyCalcs) | Página Inicial (Root /) | 🟢 Online | `200` | `447.5 ms` | [https://homeenergycalcs.com/](https://homeenergycalcs.com/) |
| Portal Web (HomeEnergyCalcs) | Calculadora Estadual (Texas) | 🟢 Online | `200` | `365.8 ms` | [https://homeenergycalcs.com/ev-charging-cost/texas](https://homeenergycalcs.com/ev-charging-cost/texas) |
| Portal Web (HomeEnergyCalcs) | Calculadora Heat Pump (Ohio) | 🟢 Online | `200` | `364.7 ms` | [https://homeenergycalcs.com/heat-pump-vs-gas/ohio](https://homeenergycalcs.com/heat-pump-vs-gas/ohio) |
| Portal Web (HomeEnergyCalcs) | Calculadora Solar (Arizona) | 🟢 Online | `200` | `399.0 ms` | [https://homeenergycalcs.com/solar-payback/arizona](https://homeenergycalcs.com/solar-payback/arizona) |
| Portal Web (HomeEnergyCalcs) | Sitemap XML (SEO Indexing) | 🟢 Online | `200` | `154.6 ms` | [https://homeenergycalcs.com/sitemap.xml](https://homeenergycalcs.com/sitemap.xml) |
| Portal Web (HomeEnergyCalcs) | Redirecionamento Canônico WWW | 🟢 Online | `301` | `275.5 ms` | [https://www.homeenergycalcs.com/](https://www.homeenergycalcs.com/) |
| Apify Store Actors | Actor #1 OSHA Safety Search | 🟢 Online | `200` | `504.1 ms` | [https://apify.com/ferraz_michel/osha-safety-compliance-mcp](https://apify.com/ferraz_michel/osha-safety-compliance-mcp) |
| Apify Store Actors | Actor #2 EPA Environmental Search | 🟢 Online | `200` | `336.3 ms` | [https://apify.com/ferraz_michel/epa-echo-environmental-mcp](https://apify.com/ferraz_michel/epa-echo-environmental-mcp) |
| Apify Store Actors | Actor #3 FMCSA Carrier Safety | 🟢 Online | `200` | `327.1 ms` | [https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp](https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp) |
| APIs Oficiais Governamentais (Upstream) | US EPA ECHO REST Services | 🟡 Lento | `200` | `2521.3 ms` | [https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX](https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX) |
| APIs Oficiais Governamentais (Upstream) | US DOL Enforcement API Gateway | 🟢 Online | `401` | `817.4 ms` | [https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1](https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1) |

---

## Como Executar Novamente

Para realizar uma nova checagem completa de saúde a qualquer momento:
```bash
python3 scripts/monitor_health.py
```