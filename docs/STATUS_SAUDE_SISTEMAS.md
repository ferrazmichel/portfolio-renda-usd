# Relatório em Tempo Real: Saúde e Uptime dos Sistemas

> Última checagem automática executada em: **21/11/2026 às 21:25:01 UTC**.

| Categoria | Serviço / Endpoint | Status | HTTP | Latência (ms) | URL |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Portal Web (HomeEnergyCalcs) | Página Inicial (Root /) | 🟢 Online | `200` | `366.4 ms` | [https://homeenergycalcs.com/](https://homeenergycalcs.com/) |
| Portal Web (HomeEnergyCalcs) | Calculadora Estadual (Texas) | 🟢 Online | `200` | `406.0 ms` | [https://homeenergycalcs.com/ev-charging-cost/texas](https://homeenergycalcs.com/ev-charging-cost/texas) |
| Portal Web (HomeEnergyCalcs) | Calculadora Heat Pump (Ohio) | 🟢 Online | `200` | `408.3 ms` | [https://homeenergycalcs.com/heat-pump-vs-gas/ohio](https://homeenergycalcs.com/heat-pump-vs-gas/ohio) |
| Portal Web (HomeEnergyCalcs) | Calculadora Solar (Arizona) | 🟢 Online | `200` | `431.5 ms` | [https://homeenergycalcs.com/solar-payback/arizona](https://homeenergycalcs.com/solar-payback/arizona) |
| Portal Web (HomeEnergyCalcs) | Sitemap XML (SEO Indexing) | 🟢 Online | `200` | `459.0 ms` | [https://homeenergycalcs.com/sitemap.xml](https://homeenergycalcs.com/sitemap.xml) |
| Portal Web (HomeEnergyCalcs) | Redirecionamento Canônico WWW | 🟢 Online | `301` | `136.1 ms` | [https://www.homeenergycalcs.com/](https://www.homeenergycalcs.com/) |
| Apify Store Actors | Actor #1 OSHA Safety Search | 🟢 Online | `200` | `234.8 ms` | [https://apify.com/ferraz_michel/osha-safety-compliance-mcp](https://apify.com/ferraz_michel/osha-safety-compliance-mcp) |
| Apify Store Actors | Actor #2 EPA Environmental Search | 🟢 Online | `200` | `336.0 ms` | [https://apify.com/ferraz_michel/epa-echo-environmental-mcp](https://apify.com/ferraz_michel/epa-echo-environmental-mcp) |
| Apify Store Actors | Actor #3 FMCSA Carrier Safety | 🟢 Online | `200` | `393.4 ms` | [https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp](https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp) |
| Apify Store Actors | Actor #4 USITC HTS Tariff & Landed Cost | 🟢 Online | `200` | `360.1 ms` | [https://apify.com/ferraz_michel/usitc-hts-tariff-mcp](https://apify.com/ferraz_michel/usitc-hts-tariff-mcp) |
| APIs Oficiais Governamentais (Upstream) | US EPA ECHO REST Services | 🟡 Lento | `200` | `2852.3 ms` | [https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX](https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX) |
| APIs Oficiais Governamentais (Upstream) | USITC HTS REST API | 🟢 Online | `200` | `508.2 ms` | [https://hts.usitc.gov/reststop/search?keyword=8507.60](https://hts.usitc.gov/reststop/search?keyword=8507.60) |
| APIs Oficiais Governamentais (Upstream) | US DOL Enforcement API Gateway | 🟢 Online | `401` | `837.3 ms` | [https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1](https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1) |

---

## Como Executar Novamente

Para realizar uma nova checagem completa de saúde a qualquer momento:
```bash
python3 scripts/monitor_health.py
```