# Catálogo Mestre de Ativos Digitais (Inventário 360°)

> Centralização de informações técnicas, operacionais, de infraestrutura e monetização de todos os empreendimentos digitais geradores de renda em Dólar (USD).

---

## 1. Visão Geral do Portfólio

| Ativo | Tipo | Canal de Venda / Tráfego | Status | Modelo de Receita | Custo Operacional Mensal |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Actor OSHA MCP** | API / MCP Tool | Apify Store (B2B, Agentes de IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor EPA ECHO MCP** | API / MCP Tool | Apify Store (ESG, Imobiliário, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
| **Actor FMCSA MCP** | API / MCP Tool | Apify Store (Logística, Seguros, IA) | 🟢 Publicado | Pay-Per-Event (PPE): $5.00/1k | US$ 0,00 (sob demanda) |
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

### Ativo #04: HomeEnergyCalcs (Portal Web Programático)

- **O que faz:** Ferramentas interativas e gratuitas de cálculo de economia energética residencial para o mercado dos EUA, cobrindo **custo de recarga de veículos elétricos (EV Home Charging)**, **bomba de calor vs. forno a gás natural (Heat Pump vs. Gas Furnace)** e **retorno de energia solar residencial (Solar Payback)** para todos os 50 estados + D.C.
- **Como faz (Tech Stack):** Next.js 15 (App Router, Static Site Generation - SSG), TypeScript, Tailwind CSS. Geração de 161 URLs estáticas ultra-rápidas no sitemap XML (51 EV + 51 Heat Pump + 51 Solar + comparativos e institucionais) e metadados OpenGraph/Twitter Cards.
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
| **Código Fonte** | GitHub (3 repositórios) | `ferrazmichel` | US$ 0,00 | Repositórios privados gratuitos |

> [!NOTE]
> **Custo operacional total do portfólio:** Apenas **~US$ 0,87 por mês** (referente ao domínio). Todo o restante opera sobre camadas gratuitas ou monetização sob demanda.

