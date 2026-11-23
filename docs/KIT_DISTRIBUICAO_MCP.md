# Kit de Distribuição MCP — Actors #1 a #7 (`us-public-data-actors`)

> Guia prático com textos prontos em inglês e snippets de conexão MCP para cadastrar os **7 Actors públicos da Apify Store** em diretórios gratuitos de MCP e atrair os primeiros **Paying Users** em USD.

---

## 1. Estratégia de Distribuição em 2 Ondas

### Onda 1 — Submissão Imediata via URL da Apify Store / Remote MCP (~15 min)
Estes diretórios aceitam submissão direta por formulário web apontando para o servidor remoto da Apify (`https://mcp.apify.com`) e para as páginas da Apify Store, **sem precisar abrir o código-fonte**:

1. **PulseMCP:** https://www.pulsemcp.com (usar formulário *Submit* no site)
2. **MCP.so:** https://mcp.so/ (usar opção *Submit* no topo)
3. **mcpservers.org:** https://mcpservers.org/ (usar *Submit Your MCP Server*)

### Onda 2 — Destravar Glama, Smithery e `awesome-mcp-servers` Sem Expor Código Privado
Diretórios como **Glama** (`https://glama.ai/mcp/servers`), **Smithery** (`https://smithery.ai/`) e a lista **punkpeye/awesome-mcp-servers** no GitHub exigem vincular um **repositório público no GitHub**.
- **Repositório vitrine público criado:** https://github.com/ferrazmichel/us-gov-mcp-suite
- Contém **apenas** documentação, `mcp.json`, `glama.json` e exemplos de uso apontando para os endpoints hospedados na Apify (`https://mcp.apify.com/?actors=...`), mantendo 100% do código Python dos Actors protegido no repositório privado `us-public-data-actors`.

---

## 2. Snippets Prontos de Conexão MCP (All-in-One)

### Opção A — Remote Streamable HTTP (Recomendado — usa OAuth Apify, sem token no arquivo)

```json
{
  "mcpServers": {
    "us-gov-data-suite": {
      "transport": "http",
      "url": "https://mcp.apify.com/?actors=ferraz_michel/osha-safety-compliance-mcp,ferraz_michel/epa-echo-environmental-mcp,ferraz_michel/fmcsa-carrier-safety-mcp,ferraz_michel/usitc-hts-tariff-mcp,ferraz_michel/us-1099-nec-state-compliance-mcp,ferraz_michel/openfda-recall-device-radar,ferraz_michel/sec-edgar-filings-mcp"
    }
  }
}
```

### Opção B — Local `npx` (`@apify/actors-mcp-server`)

```json
{
  "mcpServers": {
    "us-gov-data-suite": {
      "command": "npx",
      "args": [
        "-y",
        "@apify/actors-mcp-server",
        "--actors",
        "ferraz_michel/osha-safety-compliance-mcp,ferraz_michel/epa-echo-environmental-mcp,ferraz_michel/fmcsa-carrier-safety-mcp,ferraz_michel/usitc-hts-tariff-mcp,ferraz_michel/us-1099-nec-state-compliance-mcp,ferraz_michel/openfda-recall-device-radar,ferraz_michel/sec-edgar-filings-mcp"
      ],
      "env": {
        "APIFY_TOKEN": "YOUR_APIFY_TOKEN"
      }
    }
  }
}
```

---

## 3. Fichas Prontas para Copiar e Colar (em Inglês)

### Actor #1 — OSHA Safety & Compliance Search
- **Title:** `OSHA Safety & Compliance Search (US DOL MCP)`
- **Tagline:** `Query official US DOL OSHA workplace inspections, citations, and penalties for AI compliance agents.`
- **Description:** `API-first Apify Actor & MCP tool querying official US Department of Labor (DOL) OSHA enforcement datasets. Auto-paginates past the 200-row limit, joins inspection records with linked violations and penalty totals, and returns compact 2KB mcp_summary digests by company, state, or NAICS code—no headless browser needed.`
- **Apify Store URL:** `https://apify.com/ferraz_michel/osha-safety-compliance-mcp`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/osha-safety-compliance-mcp`
- **Tags / Categories:** `compliance`, `osha`, `safety`, `us-government`, `b2b`, `mcp`
- **Example AI Prompt:** `"Check the last 50 OSHA safety inspections and total penalties for Amazon facilities in Texas using mcp_summary mode."`

### Actor #2 — EPA ECHO Environmental Compliance Search
- **Title:** `EPA ECHO Environmental Compliance Search (US EPA MCP)`
- **Tagline:** `Search US EPA ECHO air, water, and hazardous waste compliance records with automated risk scoring.`
- **Description:** `Queries official US Environmental Protection Agency (EPA ECHO) REST services across Clean Air Act (CAA), Clean Water Act (CWA), and RCRA hazardous waste programs. Resolves EPA's two-step QueryID pagination automatically and computes facility environmental risk scores (CRITICAL to LOW) for real estate, ESG, and legal AI agents—no API key required.`
- **Apify Store URL:** `https://apify.com/ferraz_michel/epa-echo-environmental-mcp`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/epa-echo-environmental-mcp`
- **Tags / Categories:** `epa`, `esg`, `environmental`, `real-estate`, `compliance`, `mcp`
- **Example AI Prompt:** `"Screen industrial facilities in Ohio with Significant Non-Compliance (SNC) flags under the Clean Water Act."`

### Actor #3 — FMCSA & USDOT Carrier Safety, Authority & Leads
- **Title:** `FMCSA & USDOT Carrier Safety, Authority & Fleet Leads (MCP)`
- **Tagline:** `Verify US trucking carrier safety, MC/USDOT authority, BIPD insurance, and newly registered fleets.`
- **Description:** `Joins three official US Department of Transportation Socrata datasets (Company Census, L&I Authority, and Insurance Policies) by 8-digit USDOT number. Delivers instant PASS/CAUTION/HIGH_RISK/DO_NOT_USE vetting verdicts and fresh motor carrier lead lists for logistics, freight brokers, insurance, and AI agents.`
- **Apify Store URL:** `https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/fmcsa-carrier-safety-mcp`
- **Tags / Categories:** `logistics`, `trucking`, `usdot`, `fmcsa`, `lead-generation`, `mcp`
- **Example AI Prompt:** `"Vet USDOT carrier safety status, operating authority, and BIPD insurance coverage for newly registered Texas fleets."`

### Actor #4 — USITC HTS Tariff & Landed Cost Calculator
- **Title:** `US Tariff, HTS Code & Landed Cost Calculator (USITC MCP)`
- **Tagline:** `Look up 10-digit USITC HTS duty rates, Section 301/232 duties, MPF/HMF fees, and sourcing savings.`
- **Description:** `Queries the official US International Trade Commission (USITC) HTS REST API and automatically resolves 10-digit statistical rate inheritance from 8-digit parents. Calculates FY2026 CBP Merchandise Processing Fee (MPF), Harbor Maintenance Fee (HMF), USMCA/FTA exemptions, and side-by-side landed cost comparisons across China, Vietnam, Mexico, and South Korea.`
- **Apify Store URL:** `https://apify.com/ferraz_michel/usitc-hts-tariff-mcp`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/usitc-hts-tariff-mcp`
- **Tags / Categories:** `tariffs`, `hts`, `ecommerce`, `supply-chain`, `trade`, `mcp`
- **Example AI Prompt:** `"Compare total US landed cost for HTS 8507.60 lithium-ion batteries on a $25,000 ocean shipment from China vs. Vietnam vs. Mexico."`

### Actor #5 — US 1099-NEC 2026 Threshold & State Compliance
- **Title:** `US 1099-NEC 2026 State Compliance & Withholding Audit (MCP)`
- **Tagline:** `Audit 2026 Form 1099-NEC $2,000 federal vs. lower state thresholds across all 50 US states + DC.`
- **Description:** `In 2026 the federal Form 1099-NEC threshold rose to $2,000 while key US states kept $600–$1,200 thresholds. This MCP tool audits all 51 jurisdictions, checks IRS CF/SF participation vs. direct state filing, handles 1099-K credit card and attorney exemptions, and flags mandatory 24% backup withholding for missing W-9s—in batch or single-vendor mode.`
- **Apify Store URL:** `https://apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/us-1099-nec-state-compliance-mcp`
- **Tags / Categories:** `tax`, `1099-nec`, `accounting`, `compliance`, `finance`, `mcp`
- **Example AI Prompt:** `"Audit whether a $1,250 contractor payment in CA, NY, TX, and MA triggers 2026 1099-NEC filing or 24% backup withholding."`

### Actor #6 — openFDA Drug, Medical Device & Food Recall Radar
- **Title:** `openFDA Drug, Medical Device & Food Recall Radar (MCP)`
- **Tagline:** `Unified real-time monitor for official US FDA drug, medical device, and food recalls with risk scoring.`
- **Description:** `Orchestrates parallel queries across official openFDA enforcement endpoints (drug, device, and food) in reverse chronological order without requiring an API key. Abstracts Lucene query syntax, normalizes brand/device/NDC metadata, scores recall severity (CRITICAL to LOW), and outputs compact MCP alerts for healthcare, legal, and supply chain teams.`
- **Apify Store URL:** `https://apify.com/ferraz_michel/openfda-recall-device-radar`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/openfda-recall-device-radar`
- **Tags / Categories:** `fda`, `healthcare`, `recalls`, `medical-devices`, `compliance`, `mcp`
- **Example AI Prompt:** `"List ongoing Class I medical device recalls from the openFDA database reported since 2026-01-01 using mcp_summary."`

### Actor #7 — SEC EDGAR Filings, 8-K Events & XBRL Financials
- **Title:** `SEC EDGAR Filings, 8-K Events & XBRL Financials (MCP)`
- **Tagline:** `Extract US SEC 10-K, 10-Q, 8-K filings and audited US-GAAP XBRL financials in 2KB MCP summaries.`
- **Description:** `Queries official data.sec.gov submissions and companyfacts XBRL endpoints with compliant User-Agent headers and built-in rate throttling—zero API keys needed. Decodes Form 8-K material event item codes (2.02 Earnings, 1.05 Cybersecurity, 5.02 Leadership) and compresses multi-megabyte XBRL blobs into audited 10-K financial snapshots (Revenue, Net Income, Margin, Assets, Equity, Cash).`
- **Apify Store URL:** `https://apify.com/ferraz_michel/sec-edgar-filings-mcp`
- **Remote MCP URL:** `https://mcp.apify.com/?actors=ferraz_michel/sec-edgar-filings-mcp`
- **Tags / Categories:** `sec-edgar`, `finance`, `xbrl`, `equity-research`, `10-k`, `mcp`
- **Example AI Prompt:** `"Fetch AAPL and NVDA latest 10-K and 8-K filings along with audited US-GAAP Revenue, Net Income, and Cash in mcp_summary mode."`

---

## 4. Tabela de Atividades (Controle de Submissões)

| Atividade | Diretório / Canal | Onda | Status |
| :--- | :--- | :--- | :--- |
| Submeter suíte `us-gov-mcp-suite` | mcpservers.org (`mcpservers.org`, Grátis $0, Finanças, OAuth) | Onda 1 | 🔄 *(Enviado em 23/11/2026 — revisão em até 2 semanas)* |
| Submeter fichas dos 7 Actors (ou suite) | PulseMCP (`pulsemcp.com`) | Onda 1 | ⬜ *(Novas submissões pausadas temporariamente em 23/11/2026)* |
| Submeter fichas dos 7 Actors (ou suite) | MCP.so (`mcp.so`) | Onda 1 | ⬜ *(Exigindo taxa de $39 em 23/11/2026 — pulado por disciplina de custo zero)* |
| Criar repositório vitrine público `us-gov-mcp-suite` | GitHub (`ferrazmichel`) | Onda 2 | ✅ |
| Registrar `Hosted endpoint` da suíte | Glama (`glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite`) | Onda 2 | ✅ *(Aprovado e no ar em 23/11/2026; badge no README; e-mail de claim enviado)* |
| Registrar repositório vitrine | Smithery (`smithery.ai`) | Onda 2 | ⬜ *(Proxy de terceiros descontinuado em 31/10/2026 — descartado)* |
| Abrir PR em lista curada | `punkpeye/awesome-remote-mcp-servers` ([PR #5684](https://github.com/punkpeye/awesome-remote-mcp-servers/pull/5684)) | Onda 2 | 🔄 *(Aberto em 23/11/2026 como `ferrazmichel` — aguardando CI/merge)* |
