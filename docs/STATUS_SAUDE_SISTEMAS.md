# Relatório em Tempo Real: Saúde e Uptime dos Sistemas

> Última checagem automática executada em: **21/11/2026 às 22:42:07 UTC**.

| Categoria | Serviço / Endpoint | Status | HTTP | Latência (ms) | URL |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Portal Web (HomeEnergyCalcs) | Página Inicial (Root /) | 🟢 Online | `200` | `422.6 ms` | [https://homeenergycalcs.com/](https://homeenergycalcs.com/) |
| Portal Web (HomeEnergyCalcs) | Calculadora Estadual (Texas) | 🟢 Online | `200` | `310.2 ms` | [https://homeenergycalcs.com/ev-charging-cost/texas](https://homeenergycalcs.com/ev-charging-cost/texas) |
| Portal Web (HomeEnergyCalcs) | Calculadora Heat Pump (Ohio) | 🟢 Online | `200` | `316.1 ms` | [https://homeenergycalcs.com/heat-pump-vs-gas/ohio](https://homeenergycalcs.com/heat-pump-vs-gas/ohio) |
| Portal Web (HomeEnergyCalcs) | Calculadora Solar (Arizona) | 🟢 Online | `200` | `139.5 ms` | [https://homeenergycalcs.com/solar-payback/arizona](https://homeenergycalcs.com/solar-payback/arizona) |
| Portal Web (HomeEnergyCalcs) | Sitemap XML (SEO Indexing) | 🟢 Online | `200` | `120.4 ms` | [https://homeenergycalcs.com/sitemap.xml](https://homeenergycalcs.com/sitemap.xml) |
| Portal Web (HomeEnergyCalcs) | Redirecionamento Canônico WWW | 🟢 Online | `301` | `400.0 ms` | [https://www.homeenergycalcs.com/](https://www.homeenergycalcs.com/) |
| Apify Store Actors | Actor #1 OSHA Safety Search | 🟢 Online | `200` | `602.6 ms` | [https://apify.com/ferraz_michel/osha-safety-compliance-mcp](https://apify.com/ferraz_michel/osha-safety-compliance-mcp) |
| Apify Store Actors | Actor #2 EPA Environmental Search | 🟢 Online | `200` | `309.6 ms` | [https://apify.com/ferraz_michel/epa-echo-environmental-mcp](https://apify.com/ferraz_michel/epa-echo-environmental-mcp) |
| Apify Store Actors | Actor #3 FMCSA Carrier Safety | 🟢 Online | `200` | `292.1 ms` | [https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp](https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp) |
| Apify Store Actors | Actor #4 USITC HTS Tariff & Landed Cost | 🟢 Online | `200` | `391.4 ms` | [https://apify.com/ferraz_michel/usitc-hts-tariff-mcp](https://apify.com/ferraz_michel/usitc-hts-tariff-mcp) |
| Apify Store Actors | Actor #5 US 1099-NEC Compliance | 🟢 Online | `200` | `644.7 ms` | [https://apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp](https://apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp) |
| Apify Store Actors | Actor #6 openFDA Recall Radar | 🟢 Online | `200` | `295.1 ms` | [https://apify.com/ferraz_michel/openfda-recall-device-radar](https://apify.com/ferraz_michel/openfda-recall-device-radar) |
| APIs Oficiais Governamentais (Upstream) | US EPA ECHO REST Services | 🟡 Lento | `200` | `3226.9 ms` | [https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX](https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX) |
| APIs Oficiais Governamentais (Upstream) | US FDA openFDA Enforcement API | 🟡 Lento | `200` | `1398.0 ms` | [https://api.fda.gov/device/enforcement.json?limit=1](https://api.fda.gov/device/enforcement.json?limit=1) |
| APIs Oficiais Governamentais (Upstream) | USITC HTS REST API | 🟡 Lento | `200` | `1325.6 ms` | [https://hts.usitc.gov/reststop/search?keyword=8507.60](https://hts.usitc.gov/reststop/search?keyword=8507.60) |
| APIs Oficiais Governamentais (Upstream) | US DOL Enforcement API Gateway | 🟡 Lento | `401` | `1186.6 ms` | [https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1](https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1) |

---

## Como Executar Novamente

Para realizar uma nova checagem completa de saúde a qualquer momento:
```bash
python3 scripts/monitor_health.py
```