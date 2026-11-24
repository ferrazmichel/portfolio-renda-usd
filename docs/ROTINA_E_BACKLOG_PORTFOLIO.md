# Rotina Semanal e Backlog Mestre do Portfólio

> Desenhado especificamente para o ritmo real do usuário: **1 a 2 horas/dia nos dias úteis** + **blocos de execução no computador de casa nos feriados e fins de semana**.

---

## 1. Como Dividir Trabalho vs. Casa

| Ambiente | O que fazer melhor lá | O que NÃO fazer lá |
| :--- | :--- | :--- |
| **Trabalho (1–2 h/dia livre)** | Planejamento com a IA, pesquisa de palavras-chave/APIs, escrita/refatoração de código, criação de páginas/textos em inglês, revisão de documentação e análise de métricas | Criar ou autenticar repositórios com o `gh` corporativo (`michel-ferraz_sefazes`); rodar instalações pesadas bloqueadas; testar credenciais pessoais |
| **Casa (feriados / fins de semana)** | `git push` para a conta pessoal `ferrazmichel`, executar `npm install` / Python localmente, testar APIs com suas chaves reais, registrar domínio `.com`, fazer deploy (Apify / Cloudflare Pages), conectar Analytics/AdSense | Perder o tempo livre em casa fazendo pesquisa longa que a IA já pode deixar pronta durante a semana |

---

## 2. Meta de Marcos (Primeiros 6 Meses)

### Mês 1 (Novembro–Dezembro/2026) — Fundação no Ar
- Subir os 3 repositórios no GitHub pessoal (`ferrazmichel`).
- Publicar e validar **Actor #1 (`osha-safety-compliance-mcp`)** na Apify Store com dados reais da API DOL.
- Registrar domínio `.com` e publicar **Projeto #2 (`us-home-energy-calcs`)** com as 51 páginas (`/ev-charging-cost/[state]`) na Cloudflare Pages / Vercel, ligado ao GA4 e Google Search Console.
  - *Por que isso importa agora:* o relógio de **4 meses de idade do domínio** do Journey by Mediavine começa a correr no dia do registro/publicação!

### Meses 2–3 (Janeiro–Fevereiro/2027) — Expansão dos 2 Pilares
- **Projeto #1:** Publicar **Actor #2 (`epa-echo-environmental-mcp`)** e **Actor #3 (`fmcsa-carrier-safety-mcp`)**; ajustar títulos, READMEs e preços PPE conforme métricas de execuções na Apify.
- **Projeto #2:** Adicionar a 2ª vertical de calculadora (**Heat Pump vs. Gas Furnace por estado — +51 páginas**) e criar 5–10 guias de apoio ligando às calculadoras; aplicar para AdSense assim que o site estiver maduro com tráfego inicial orgânico.

### Meses 4–6 (Março–Maio/2027) — Consolidação e Otimização
- **Projeto #1:** Otimizar os 3–5 Actors para uso via MCP (redução de tokens, exemplos claros para LangGraph/Claude/n8n) buscando atingir **US\$ 150–300/mês** na Apify.
- **Projeto #2:** Adicionar a 3ª vertical (**Solar Payback por estado — +51 páginas** usando NREL PVWatts API), acompanhar tráfego Tier-1 EUA rumo às **5.000 sessões/mês** para aplicar ao **Journey by Mediavine**.
- **Avaliação de Portfólio:** Somar receita dos dois pilares; só então decidir entre escalar mais os mesmos dois ou ativar a **Ideia A (Etsy EUA)** ou **Ideia B (Extensão Shopify)** do Radar Fase 2.

---

## 3. Indicadores para Acompanhar Todo Mês (15 min/mês)

| Métrica | Projeto #1 (Apify) | Projeto #2 (Energy Calcs) |
| :--- | :--- | :--- |
| Alcance | Usuários totais e execuções mensais por Actor | Impressões e cliques orgânicos EUA no Search Console |
| Engajamento | Taxa de sucesso das runs (> 95%) e uso via MCP | Sessões mensais Tier-1 no GA4 (rumo a 5.000/mês) |
| Receita | Repasse líquido mensal (após comissão e custo infra) | Receita AdSense/Journey + Amazon Associates |
| Tempo gasto | Horas gastas no mês (meta: < 6–8 h/mês após estabilizar) | Horas gastas no mês (meta: < 4 h/mês após estabilizar) |

---

## Tabela de Atividades Consolidada

| ID | Frente | Atividade | Status |
| :--- | :--- | :--- | :--- |
| HQ-01 | Portfólio | Criar centralização estratégica e documentação de pagamentos/rotina | ✅ |
| HQ-02 | Portfólio | Criar repositórios privados no GitHub pessoal `ferrazmichel` e dar `git push` | ✅ |
| HQ-03 | Portfólio | Implementar catálogo de ativos, painel financeiro e alertas automáticos de uptime por e-mail | ✅ |
| P1-01 | `us-public-data-actors` | Criar plano, roadmap, guia do feriado e scaffold do Actor 1 (`osha-safety-compliance-mcp`) | ✅ |
| P1-02 | `us-public-data-actors` | Obter API Key gratuita DOL + testar Actor OSHA com chamada real em casa | ✅ |
| P1-03 | `us-public-data-actors` | Publicar Actor 1 na Apify Store com PPE ($5.00/1k) e suporte MCP | ✅ |
| P1-04 | `us-public-data-actors` | Desenvolver e publicar Actor 2 (`epa-echo-environmental-mcp`) | ✅ |
| P1-05 | `us-public-data-actors` | Desenvolver e publicar Actor 3 (`fmcsa-carrier-safety-mcp`) na Apify Store com PPE ($5.00/1k) | ✅ |
| P2-01 | `us-home-energy-calcs` | Criar plano SEO, guia do feriado e scaffold Next.js com 51 páginas EV Charging | ✅ |
| P2-02 | `us-home-energy-calcs` | Implementar Fase 1 completa, rodar `npm install && npm test && npm run build` e validar exportação estática (`out/`) | ✅ |
| P2-03 | `us-home-energy-calcs` | Registrar domínio `.com` (`homeenergycalcs.com`) e publicar na Cloudflare Pages + Search Console | ✅ |
| P2-04 | `us-home-energy-calcs` | Atualizar tarifas reais de 2026 via `scripts/fetch_eia_rates.py` (EIA API v2) | ✅ |
| P2-05 | `us-home-energy-calcs` | Implementar vertical 2 (`heat-pump-vs-gas`) para os 50 estados + DC | ✅ |
| P2-06 | `us-home-energy-calcs` | Implementar vertical 3 (`solar-payback`) para os 50 estados + DC (161 URLs) | ✅ |
| P3-01 | `us-public-data-actors` | Desenvolver e publicar Projeto #3 / Actor #4 (`usitc-hts-tariff-mcp`) | ✅ |
| P3-02 | `us-public-data-actors` | Desenvolver e publicar Actor #5 (`us-1099-nec-state-compliance-mcp`) | ✅ |
| P3-03 | `us-public-data-actors` | Desenvolver e publicar Actor #6 (`openfda-recall-device-radar`) | ✅ |
| P3-04 | `us-public-data-actors` | Desenvolver e fazer deploy do Actor #7 (`sec-edgar-filings-mcp`) | ✅ |
| P4-01 | `shopify-pixel-catalog-inspector` | Construir e empacotar Extensão Chrome MV3 para Shopify EUA (`dist/*.zip`) | ✅ |
| P4-02 | `shopify-pixel-catalog-inspector` | Testar no Chrome local (`chrome://extensions`), configurar Polar.sh e publicar na Chrome Web Store usando `docs/KIT_PUBLICACAO_SHOPPULSE.md` | ⬜ |
| P4-03 | `shopify-pixel-catalog-inspector` | Executar plano de divulgação pós-aprovação (`AlternativeTo`, `SaaSHub`, `Product Hunt`, Reddit — ver `docs/KIT_PUBLICACAO_SHOPPULSE.md`) | ⬜ |
| HQ-04 | Portfólio | Criar skills `/sync-repos` e `/painel-usd` (PowerShell) e ledger `data/receitas_portfolio.json` | ✅ |
| P2-07 | `us-home-energy-calcs` | Configurar Bing Webmaster Tools + IndexNow (161 URLs submetidas) | ✅ |
| P3-05 | `us-public-data-actors` | Publicar Actor #7 (SEC EDGAR) e otimizar os 7 Actors (512 MB, categorias e SEO) | ✅ |
| P3-06 | `us-public-data-actors` | Pesquisar APIs oficiais e especificar Actor #8 (USAspending Federal Contracts & Re-Compete Radar — [`PROPOSTA_ACTOR_8_USASPENDING.md`](PROPOSTA_ACTOR_8_USASPENDING.md)) | ✅ |
| P3-07 | `us-public-data-actors` | Implementar, testar em casa e publicar Actor #8 (`usaspending-federal-contracts-mcp`) na Apify Store | ⬜ |
| D1-01 | Distribuição MCP | Submeter os 7 Actors nos diretórios Onda 1 (`mcpservers.org` enviado 🔄; `PulseMCP` pausado; `MCP.so` pago/pulado) | 🔄 |
| D1-02 | Distribuição MCP | Criar repositório vitrine público `us-gov-mcp-suite` para submissão em diretórios MCP | ✅ |
| D1-03 | Distribuição MCP | Publicar `us-gov-mcp-suite` no `Glama` (aprovado ✅) e abrir PR em `awesome-remote-mcp-servers` ([PR #5684](https://github.com/punkpeye/awesome-remote-mcp-servers/pull/5684) 🔄) | 🔄 |
| F2-01 | Fase 2 (Paralelo IA) | Aprofundar pesquisa de nichos da Etsy EUA ([`ESTUDO_ETSY_PLANILHAS_EUA.md`](ESTUDO_ETSY_PLANILHAS_EUA.md) ✅) e afiliados SaaS B2B para decisão futura | 🔄 |
