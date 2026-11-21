# Catálogo Mestre de Ativos Digitais (Inventário 360°)

> Centralização de informações técnicas, operacionais, de infraestrutura e monetização de todos os empreendimentos digitais geradores de renda em Dólar (USD).

---

## 1. Visão Geral do Portfólio

| Ativo | Tipo | Canal de Venda / Tráfego | Status | Modelo de Receita | Custo Operacional Mensal |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Actor OSHA MCP** | API / MCP Tool | Apify Store (B2B, Agentes de IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor EPA ECHO MCP** | API / MCP Tool | Apify Store (ESG, Imobiliário, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor FMCSA MCP** | API / MCP Tool | Apify Store (Logística, Seguros, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor USITC HTS Tariff MCP (Projeto #3)** | API / MCP Tool | Apify Store (Importação EUA, E-commerce, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor US 1099-NEC Compliance MCP** | API / MCP Tool | Apify Store (Contabilidade EUA, CPAs, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor openFDA Recall Radar MCP** | API / MCP Tool | Apify Store (Saúde, Jurídico, Supply Chain, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor SEC EDGAR Filings & XBRL MCP** | API / MCP Tool | Apify Store (Finanças EUA, Equity Research, IA) | 🟡 Build Pronto (`ufSzc2Gs2Gm7bvVbo`) | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **HomeEnergyCalcs** | Portal Web (Programmatic SEO) | Tráfego Orgânico Google EUA | 🟢 Online (161 páginas / 3 verticais) | Ads Programáticos (Mediavine) + Afiliados | ~US$ 0,87/mês (domínio anualizado) |

---

## 2. Detalhamento dos Ativos

### Ativo #01: OSHA Safety & Compliance Search (MCP-Ready)

- **O que faz:** Consulta inspeções, violações de segurança do trabalho e multas do Departamento do Trabalho dos EUA (DOL / OSHA) por empresa, estado e código NAICS. Entrega um resumo de risco compacto para agentes de IA.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK (`Actor.push_data`), `httpx`, `pydantic`. Consulta a API REST oficial de produção da DOL (`apiprod.dol.gov/v4/get`).
- **Diferencial Competitivo:** Resumo executivo MCP (`OUTPUT`) com métricas consolidadas (soma de penalidades, violações sérias/reincidentes) consumindo menos de 2 KB de contexto.
- **Hospedagem & Infra:** Apify Cloud (Container Docker com 512 MB de RAM, ativação sob demanda).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/osha-safety-compliance-mcp`).
- **Links Oficiais:**
  - URL da Apify Store: [apify.com/ferraz_michel/osha-safety-compliance-mcp](https://apify.com/ferraz_michel/osha-safety-compliance-mcp)
  - Console de Gestão: [console.apify.com/actors/YcWPKUwd0iaiv2dpb](https://console.apify.com/actors/YcWPKUwd0iaiv2dpb)
- **Precificação (PPE):**
  - Evento Primário (`inspection-record`): **US$ 0,005** por inspeção retornada (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.
  - Custo de computação na nuvem Apify: ~US$ 0,002 por chamada (Margem líquida > 90%).

---

### Ativo #02: EPA ECHO Environmental Compliance Search (MCP-Ready)

- **O que faz:** Consulta instalações industriais e comerciais reguladas pela Agência de Proteção Ambiental dos EUA (EPA), cobrindo conformidade da Lei do Ar Limpo (CAA), Água Limpa (CWA) e Resíduos Tóxicos (RCRA), identificando Violações Significativas (SNC) e multas.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK, `httpx`, `pydantic`. Orquestração em 2 etapas com a API EPA ECHO (`echodata.epa.gov`): `get_facilities` gerando `QueryID` + `get_qid` paginado.
- **Diferencial Competitivo:** Resolve a complexidade dos endpoints da EPA sem exigir API Key do usuário final e gera score de risco ambiental (*CRITICAL*, *HIGH*, *MODERATE*, *LOW*) para agentes de IA.
- **Hospedagem & Infra:** Apify Cloud (Container Docker com 512 MB de RAM).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/epa-echo-environmental-mcp`).
- **Links Oficiais:**
  - URL da Apify Store: [apify.com/ferraz_michel/epa-echo-environmental-mcp](https://apify.com/ferraz_michel/epa-echo-environmental-mcp)
  - Console de Gestão: [console.apify.com/actors/sG7gYBRMpubMo9gHV](https://console.apify.com/actors/sG7gYBRMpubMo9gHV)
- **Precificação (PPE):**
  - Evento Primário (`facility-record`): **US$ 0,005** por instalação retornada (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.
  - Custo de computação na nuvem Apify: ~US$ 0,001 por chamada (3 segundos de execução).

---

### Ativo #03: FMCSA & USDOT Carrier Safety, Authority & Leads (MCP-Ready)

- **O que faz:** Valida a segurança, autoridade operacional (MC/MX/FF), cobertura de seguro BIPD e histórico regulatório de transportadoras rodoviárias dos EUA, além de gerar leads qualificados de frotas recém-registradas.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK, `httpx`, `pydantic`, `certifi`. Consulta e cruza 3 datasets oficiais Socrata em `data.transportation.gov` (`az4n-8mr2` Company Census, `6eyk-hxee` L&I Authority e `qh9u-swkp` Insurance Policies).
- **Diferencial Competitivo:** Join automático em lote via USDOT de 8 dígitos, classificação de risco imediata (`PASS`, `CAUTION`, `HIGH_RISK`, `DO_NOT_USE`) para agentes de IA sem exigir API Key do usuário.
- **Hospedagem & Infra:** Apify Cloud (Container Docker com 512 MB de RAM).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/fmcsa-carrier-safety-mcp`).
- **Links Oficiais:**
  - URL da Apify Store: [apify.com/ferraz_michel/fmcsa-carrier-safety-mcp](https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp)
  - Console de Gestão: [console.apify.com/actors/dXTzf5zWuI3i1aNvd](https://console.apify.com/actors/dXTzf5zWuI3i1aNvd)
- **Precificação (PPE):**
  - Evento Primário (`Result / Carrier Record`): **US$ 0,005** por transportadora retornada (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.

---

### Ativo #05: USITC HTS Tariff & Landed Cost Calculator (Projeto #3 / Actor #4)

- **O que faz:** Consulta tarifas alfandegárias oficiais da USITC (`hts.usitc.gov`), resolve herança hierárquica de códigos estatísticos de 10 dígitos, identifica isenções de Acordos de Livre Comércio (USMCA `MX`/`CA`, KORUS `KR`, etc.), estima adicionais do Capítulo 99 (Section 301/232), calcula taxas CBP (**MPF** e **HMF**) e compara o **Landed Cost** total entre múltiplos países de origem.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK, `httpx`, `pydantic`, `certifi`. Consulta a API REST pública gratuita da USITC (`hts.usitc.gov/reststop/search`) sem necessidade de API Key pelo usuário final.
- **Diferencial Competitivo:** Resolve sozinho a lacuna de códigos de 10 dígitos sem tarifa no JSON oficial e entrega tabela comparativa pronta (`CN` vs. `VN` vs. `MX` vs. `KR`) + resumo enxuto MCP (`OUTPUT`).
- **Hospedagem & Infra:** Apify Cloud (Container Docker com 512 MB de RAM).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/usitc-hts-tariff-mcp`).
- **Links Oficiais:**
  - URL da Apify Store: [apify.com/ferraz_michel/usitc-hts-tariff-mcp](https://apify.com/ferraz_michel/usitc-hts-tariff-mcp)
  - Console de Gestão: [console.apify.com/actors/k2m3X9Dr7skOSvzTu](https://console.apify.com/actors/k2m3X9Dr7skOSvzTu)
- **Precificação (PPE):**
  - Evento Primário (`hts-tariff-record`): **US$ 0,005** por linha tarifária calculada (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.

---

### Ativo #06: US 1099-NEC \$2,000 Threshold & State Compliance (Actor #5)

- **O que faz:** Audita conformidade de Form 1099-NEC nos **50 estados dos EUA + D.C.** para o novo cenário fiscal de 2026 (teto federal de \$2.000 vs. tetos estaduais menores de \$600/\$1.000/\$1.200), avalia canais de envio (IRS CF/SF vs. portal estadual direto), exceções (cartão de crédito/1099-K § 6050W, corporações vs. advogados) e calcula **24% de backup withholding** por falta de W-9.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK, `pydantic`. Matriz normativa dos 51 entes em memória + modo lote de fornecedores (`contractors`) + resumo MCP (`OUTPUT`).
- **Diferencial Competitivo:** Resolve uma dor urgente do fechamento fiscal de 2026 para contadores (CPAs), ERPs e agentes financeiros sem exigir API externa.
- **Hospedagem & Infra:** Apify Cloud (Container Docker com 512 MB de RAM).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/us-1099-nec-state-compliance-mcp`).
- **Links Oficiais:**
  - URL da Apify Store: [apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp](https://apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp)
  - Console de Gestão: [console.apify.com/actors/LfH9ZtoktBUjEskhT](https://console.apify.com/actors/LfH9ZtoktBUjEskhT)
- **Precificação (PPE):**
  - Evento Primário (`compliance-check`): **US$ 0,005** por avaliação/fornecedor (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.

---

### Ativo #07: openFDA Drug, Medical Device & Food Recall Radar (Actor #6)

- **O que faz:** Monitora recalls oficiais e ações de enforcement da U.S. FDA em **Medicamentos, Dispositivos Médicos e Alimentos** via APIs openFDA, unificando os 3 domínios em ordem cronológica reversa, atribuindo score de risco (`CRITICAL`, `HIGH`, `MODERATE`, `LOW`) e gerando alertas MCP para hospitais, farmácias, escritórios jurídicos e supply chain.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK, `httpx`, `pydantic`, `certifi`. Orquestração paralela em `api.fda.gov/{drug|device|food}/enforcement.json` sem exigir API Key.
- **Diferencial Competitivo:** Abstrai a sintaxe Lucene da openFDA, trata `HTTP 404` em filtros vazios e normaliza metadados `openfda` (`brandNames`, `deviceNames`, `productNdcs`) + datas ISO.
- **Hospedagem & Infra:** Apify Cloud (Container Docker com 512 MB de RAM).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/openfda-recall-device-radar`).
- **Links Oficiais:**
  - URL da Apify Store: [apify.com/ferraz_michel/openfda-recall-device-radar](https://apify.com/ferraz_michel/openfda-recall-device-radar)
  - Console de Gestão: [console.apify.com/actors/2CCGzUBUIwm3dfFCD](https://console.apify.com/actors/2CCGzUBUIwm3dfFCD)
- **Precificação (PPE):**
  - Evento Primário (`fda-recall-record`): **US$ 0,005** por recall retornado (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.

---

### Ativo #08: SEC EDGAR Filings, 8-K Events & XBRL Financials (Actor #7)

- **O que faz:** Extrai arquivamentos oficiais da SEC dos EUA (`10-K`, `10-Q`, `8-K`, `Form 4`, `DEF 14A`, `S-1`), decodifica itens de eventos materiais `8-K` e extrai snapshots auditados US-GAAP XBRL (`Revenue`, `Net Income`, `Net Margin %`, `Assets`, `Equity`, `Cash`) por ticker ou CIK.
- **Como faz (Tech Stack):** Python 3.12, Apify SDK, `httpx`, `pydantic`, `certifi`. Consulta `data.sec.gov/submissions/` e `data.sec.gov/api/xbrl/companyfacts/` com `User-Agent` compatível com a SEC e zero API keys.
- **Diferencial Competitivo:** Comprime arquivos XBRL de ~4 MB em poucos KB de dataset + resumo MCP (`OUTPUT`) com indicadores financeiros auditados do último `10-K`.
- **Hospedagem & Infra:** Apify Cloud (Container Docker — build `0.1.1` concluído `ufSzc2Gs2Gm7bvVbo`, aguardando publicação final na Store com 512 MB).
- **Repositório:** [`ferrazmichel/us-public-data-actors`](https://github.com/ferrazmichel/us-public-data-actors) (`actors/sec-edgar-filings-mcp`).
- **Links Oficiais:**
  - Console de Gestão: [console.apify.com/actors/ufSzc2Gs2Gm7bvVbo](https://console.apify.com/actors/ufSzc2Gs2Gm7bvVbo)
  - URL Futura na Apify Store: [apify.com/ferraz_michel/sec-edgar-filings-mcp](https://apify.com/ferraz_michel/sec-edgar-filings-mcp)
- **Precificação (PPE):**
  - Evento Primário (`sec-filing-record`): **US$ 0,005** por arquivamento retornado (US$ 5,00 por 1.000).
  - Custo de arranque (`Actor start`): **US$ 0,001** por execução.

---

### Ativo #04: HomeEnergyCalcs (Portal Web Programático)

- **O que faz:** Ferramentas interativas e gratuitas de cálculo de economia energética residencial para o mercado dos EUA, cobrindo **custo de recarga de veículos elétricos (EV Home Charging)**, **bomba de calor vs. forno a gás natural (Heat Pump vs. Gas Furnace)** e **retorno de energia solar residencial (Solar Payback)** para todos os 50 estados + D.C., alimentado com tarifas oficiais da U.S. EIA API v2 (`2026-08`).
- **Como faz (Tech Stack):** Next.js 15 (App Router, Static Site Generation - SSG), TypeScript, Tailwind CSS + atualização automática via `scripts/fetch_eia_rates.py` (EIA API v2). Geração de 161 URLs estáticas ultra-rápidas no sitemap XML (51 EV + 51 Heat Pump + 51 Solar + comparativos e institucionais) e metadados OpenGraph/Twitter Cards.
- **Hospedagem & Infra:** Cloudflare Pages (Deploy contínuo via GitHub, CDN global em borda, SSL automático). Custo: **US$ 0,00**.
- **Domínio & Registro:** `homeenergycalcs.com` registrado no Cloudflare Registrar por ~US$ 10,44/ano (renovação automática em Novembro/2027). Redirecionamento 301 ativo de `www` para raiz.
- **Repositório:** [`ferrazmichel/us-home-energy-calcs`](https://github.com/ferrazmichel/us-home-energy-calcs).
- **Links Oficiais:**
  - Website em Produção: [https://homeenergycalcs.com](https://homeenergycalcs.com)
  - Dashboard Cloudflare: [dash.cloudflare.com](https://dash.cloudflare.com)
  - Google Search Console: [search.google.com/search-console](https://search.google.com/search-console)
  - Google Analytics 4 (GA4): Stream `G-XG2MW8RJJH` via Tag `GTM-KLKPB4WP` (ativo no `<head>`)
- **Estratégia de Monetização:**
  1. **Anúncios Display Premium (Fase Principal):** Aprovação na **Journey by Mediavine** (requisito: domínio com mais de 120 dias e tráfego orgânico crescente nos EUA; RPM médio entre **US$ 25 e US$ 45** por 1.000 visualizações).
  2. **Marketing de Afiliados:** Recomendações de carregadores residenciais Level 2 (Amazon Associates EUA) e cotação de energia solar.

---

## 3. Resumo de Infraestrutura, Credenciais e Custos

| Recurso | Fornecedor | Conta Vinculada | Custo Anual Estimado | Forma de Cobrança |
| :--- | :--- | :--- | :--- | :--- |
| **Domínio `.com`** | Cloudflare Registrar | `ferrazmichel@gmail.com` | US$ 10,44 / ano | Cartão de crédito (renovação anual) |
| **Hospedagem Web (Pages)** | Cloudflare Pages | `ferrazmichel@gmail.com` | US$ 0,00 | Gratuito (Ilimitado para sites estáticos) |
| **Execução de Actors** | Apify Platform | `ferraz_michel` | US$ 0,00 | Coberto pela cota gratuita ($5/mês) + repasse aos usuários |
| **API DOL OSHA** | U.S. Dept of Labor | `ferrazmichel@gmail.com` | US$ 0,00 | Chave gratuita de dados abertos |
| **API EPA ECHO** | U.S. EPA | Aberta ao público | US$ 0,00 | Acesso irrestrito de utilidade pública |
| **API USITC HTS** | U.S. ITC (`hts.usitc.gov`) | Aberta ao público | US$ 0,00 | Acesso irrestrito sem API key |
| **API openFDA** | U.S. FDA (`api.fda.gov`) | Aberta ao público | US$ 0,00 | Acesso irrestrito sem API key |
| **API SEC EDGAR** | U.S. SEC (`data.sec.gov`) | Aberta (`User-Agent` declarado) | US$ 0,00 | Acesso irrestrito sem API key |
| **Código Fonte** | GitHub (3 repositórios) | `ferrazmichel` | US$ 0,00 | Repositórios privados gratuitos |

> [!NOTE]
> **Custo operacional total do portfólio:** Apenas **~US$ 0,87 por mês** (referente ao domínio). Todo o restante opera sobre camadas gratuitas ou monetização sob demanda.

