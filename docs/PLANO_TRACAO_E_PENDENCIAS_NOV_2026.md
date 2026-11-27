# Plano Mestre de Tração, Conferências e Pendências (Nov–Dez/2026)

> **Guia Vivo de Execução — Ciclo de 21 Dias (25/11/2026 → 16/12/2026)**  
> **Regra Central deste Ciclo:** **CONGELAR a criação de novos Actors e novos produtos** pelos próximos 14–21 dias. Todo o foco agora é **fechar pendências de aprovação/listagem e executar distribuição orgânica de alta intenção** para gerar os primeiros usuários externos reais e o primeiro dólar na conta.

> [!IMPORTANT]
> **Instrução Permanente para a IA (como conduzir as próximas sessões):**
> 1. Sempre que o usuário pedir *"qual o próximo passo?"* ou *"vamos avançar no portfólio"*, leia a **Seção 4 (Checklist Mestre `TR-01` a `TR-19`)** abaixo e sugira **1 a 2 tarefas pendentes (`⬜` ou `🔄`) por vez**, respeitando a ordem das Fases (`0 → 1 → 2 → 3 → 4`).
> 2. Antes de pedir qualquer ação externa ao usuário (post, comentário, cadastro em diretório, artigo), entregue o **texto completo pronto em inglês** (copiar e colar) com instruções exatas de onde clicar.
> 3. Ao concluir cada tarefa com o usuário, atualize o status (`⬜` → `🔄` → `✅`) e a data na tabela deste documento.

---

## 1. Diagnóstico Estratégico (Foto Real em 25/11/2026)

- **Tempo real de operação:** **6 dias corridos** desde o início do portfólio (`19/11/2026`).
- **Ativos já construídos e operacionais (10 ativos reais):**
  - **8 Actors MCP públicos** na Apify Store (`us-public-data-actors`), todos com precificação PPE (`$5 / 1k`), 100% em APIs governamentais oficiais dos EUA, custo fixo `US$ 0/mês` e **18/18 endpoints saudáveis** no `/painel-usd`.
  - **1 Portal Web Programático** (`homeenergycalcs.com`): 161 páginas estáticas (EV Charging, Heat Pump, Solar Payback), tarifas EIA 2026, GA4, Google Search Console e Bing IndexNow — **5 dias de domínio** (faltam 115 dias para o requisito de 120 dias do Journey by Mediavine).
  - **1 Extensão Chrome MV3** (`ShopPulse`): checkout real da **Polar.sh** configurado (`$15/mês` e `$120/ano`), política de privacidade publicada no GitHub Pages e submetida na Chrome Web Store (ID `nbmgmembajfhfnebbedfddjdoeimknad`).
- **Receita acumulada atual:** **`US$ 0,00`** | **Custos acumulados:** **`US$ 15,44`** (`$10,44` domínio + `$5,00` taxa única Chrome Web Store).
- **Por que `US$ 0,00` com 6 dias é esperado (e qual é o gargalo real):**
  - Os `users_total=2 / runs=4–8` vistos hoje na Apify são testes próprios + validações automáticas da plataforma.
  - Até agora a alocação de esforço foi **~95% construção / ~5% distribuição**.
  - Criar o Actor #9 ou #10 agora não resolve o gargalo: **o gargalo é visibilidade e primeiros usuários reais nos produtos que já existem.**

---

## 2. Política de Canais de Divulgação (O Que Fazer vs. Evitar)

### ❌ O que NÃO fazer neste ciclo
1. **Anúncios pagos (Google Ads / Meta Ads):**
   - Cliques B2B nos EUA custam `US$ 2–8` cada. Na Apify o retorno é `US$ 5` por **1.000 eventos**; em display ads (`homeenergycalcs.com`) o retorno é `~US$ 0,03/visita`; no `ShopPulse` ainda não existe taxa validada de conversão Free → Pro. Pagar por tráfego antes de validar conversão orgânica gera prejuízo certo.
2. **Criar perfis do zero no Instagram / TikTok / YouTube:**
   - Alto consumo semanal de energia criativa, baixa aderência ao público técnico/B2B americano e conflito com a rotina enxuta de 1–2h/dia.

### ✅ O que REALMENTE funciona agora (Custo US\$ 0 e Alta Intenção)
1. **Diretórios e listas curadas de alta intenção** (onde o comprador já está pesquisando a ferramenta):
   - *MCP / Apify:* `Glama`, `awesome-remote-mcp-servers` (PR #5684), `mcpservers.org`, outras listas `awesome-mcp-servers` no GitHub, **Discord oficial da Apify (`#showcase`)**.
   - *ShopPulse:* `Chrome Web Store` (reviews iniciais), `AlternativeTo` (alternativa a *Koala Inspector* / *PPSPY*), `SaaSHub`, `Product Hunt`.
2. **Comunidades nichadas no Reddit (formato *"Show, Don't Sell"*, sem spam):**
   - *MCP:* `r/mcp`, `r/ClaudeAI`, `r/n8n` (mostrar o problema resolvido: 8 APIs governamentais EUA sem API key em 2 KB de contexto).
   - *ShopPulse:* `r/shopify`, `r/ecommerce`, `r/PPC` (inspeção ilimitada grátis, privacidade sem `<all_urls>`).
   - *HomeEnergyCalcs:* `r/electricvehicles`, `r/heatpumps`, `r/solar` (compartilhar dado curioso real da EIA 2026 com link discreto para a calculadora).
3. **Conteúdo técnico evergreen + templates reutilizáveis:**
   - **1 artigo técnico curto no Dev.to** (em inglês) + **1 workflow template gratuito no n8n** — ficam indexados no Google e puxam chamadas recorrentes na Apify no piloto automático.

---

## 3. Raio-X Atual das Frentes (25/11/2026)

| Frente | Chance de 1º Dólar | Status Real Verificado | Gargalo Imediato |
| :--- | :---: | :--- | :--- |
| **ShopPulse (Chrome Web Store + Polar.sh)** | 🥇 **Mais rápida** (`1 assinatura = $15–$120`) | **Publicada na Chrome Web Store (`25/11/2026`)**: [`chromewebstore.google.com/.../nbmgmembajfhfnebbedfddjdoeimknad`](https://chromewebstore.google.com/detail/shoppulse-shopify-pixel-a/nbmgmembajfhfnebbedfddjdoeimknad). Polar.sh configurado (`$15/mês`, `$120/ano`) e política publicada no GitHub Pages. | Executar Fase 2: `TR-13` (teste limpo da loja + checkout Polar.sh), `TR-14` (`AlternativeTo` + `SaaSHub`), `TR-15` (`Product Hunt`) e `TR-16` (Reddit). |
| **Suíte MCP / 8 Actors Apify** | 🥈 **Recorrente B2B** (`$5/1k eventos`) | 8/8 públicos e online. `Glama` aprovado. `mcpservers.org` em revisão (`23/11`). **PR #5684 (`awesome-remote-mcp-servers`) passou no CI sem conflitos** e recebeu comentário do dono (`punkpeye`) pedindo mencionar o link/badge do Glama na descrição do PR para priorizar o merge. | Atualizar descrição do PR #5684 (30s) + executar Sprint de divulgação (Discord Apify, `r/mcp`, `r/ClaudeAI`, Dev.to, n8n). |
| **HomeEnergyCalcs (`homeenergycalcs.com`)** | 🥉 **Médio prazo passivo** (`Mediavine Mar/2027`) | 161 URLs no ar, GA4 + Search Console + Bing IndexNow configurados, 5/120 dias de domínio. | Conferir ritmo de indexação no Search Console/Bing e gerar 2–3 sinais/backlinks orgânicos iniciais para acelerar saída do sandbox. |

---

## 4. Plano Mestre de Ações e Checklist (`TR-01` a `TR-19`)

### Fase 0 — Conferências e Desbloqueios Imediatos (Dias 1–2)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-01** | ShopPulse | Substituir o campo `Descrição*` na Chrome Web Store pela versão v2 (sem listas de marcas, ver [`KIT_PUBLICACAO_SHOPPULSE.md`](KIT_PUBLICACAO_SHOPPULSE.md)), salvar rascunho e clicar em **Enviar para análise** | Usuário | ✅ *(Aprovada e publicada na Chrome Web Store em 25/11/2026 — [link público](https://chromewebstore.google.com/detail/shoppulse-shopify-pixel-a/nbmgmembajfhfnebbedfddjdoeimknad))* |
| **TR-02** | MCP / GitHub | **Desbloquear merge prioritário do [PR #5684](https://github.com/punkpeye/awesome-remote-mcp-servers/pull/5684):** editar a descrição do PR informando que o badge do Glama já está no `README.md` de `us-gov-mcp-suite` + incluir link do Glama (texto pronto na Seção 5 abaixo) | Usuário | ✅ *(25/11 — descrição do PR #5684 atualizada com link/badge Glama + resposta ao punkpeye; aguardando merge)* |
| **TR-03** | MCP / Glama | Conferir e-mail de *claim* da listagem no **Glama** (`glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite`) e verificar se a página já reflete os 8 Actors | Usuário | ✅ *(Verificado em 25/11 — ticket #159789607 aberto no Glama; aguardando claim para liberar OAuth/Test Profile e atualizar de 7 para 8 Actors)* |
| **TR-04** | HomeEnergyCalcs | Conferir **Google Search Console** e **Bing Webmaster Tools** de `homeenergycalcs.com` (nº de páginas indexadas das 161, impressões, erros de rastreamento) | Usuário | ✅ *(Verificado em 25/11 — GSC excelente p/ domínio de 5 dias: 161 URLs processadas no sitemap, 56 HTTPS válidas / 0 erros, 39 breadcrumbs válidos, 98 impressões em 3 dias em curva crescente 0→3→18→77/dia, 90% EUA em 55 páginas das 3 verticais)* |
| **TR-05** | Portfólio HQ | Sincronizar `AGENTS.md`, `README.md`, `CATALOGO_ATIVOS.md`, `ROTINA_E_BACKLOG_PORTFOLIO.md` e `KIT_DISTRIBUICAO_MCP.md` com o status real dos 8 Actors e do ShopPulse | IA | ✅ *(25/11/2026)* |

### Fase 1 — Sprint de Tração dos 8 Actors MCP (Dias 2–7 — Zero Código Novo)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-06** | MCP / Apify | Redigir e publicar apresentação da suíte `us-gov-mcp-suite` (8 Actors MCP) no **Discord oficial da Apify (`#showcase`)** | IA (texto) + Usuário (post) | ✅ *(25/11 — postado em `#actor-promotion` no Discord Apify; versão complementar p/ `#ai-and-mcp` pronta)* |
| **TR-07** | MCP / Reddit | Redigir e publicar post técnico *"Show, Don't Sell"* em **`r/mcp`** destacando o problema resolvido (`outputMode: "mcp_summary"` ~2 KB, zero API keys, 8 fontes oficiais EUA) | IA (texto) + Usuário (post) | ✅ *(25/11 — publicado em `r/mcp` com flair `showcase` por `u/ai-and-mcp-developer`)* |
| **TR-08** | MCP / Reddit | Redigir e publicar post prático em **`r/ClaudeAI`** mostrando casos reais prontos (SEC EDGAR XBRL, Tarifas USITC China vs Vietnã vs México, 1099-NEC 2026 e USAspending) | IA (texto) + Usuário (post) | ✅ *(26/11 — publicado em `r/ClaudeMCP`; `r/ClaudeAI` bloqueado pelo AutoModerator por conta nova — repetir em `r/ClaudeAI` e `r/BuildWithClaude` após ~03/12)* |
| **TR-09** | MCP / Diretórios | Submeter `us-gov-mcp-suite` em mais **2 listas/diretórios gratuitos de MCP** no GitHub (`punkpeye/awesome-mcp-servers`, `jaw9c/awesome-remote-mcp-servers`) e conferir revisão do `mcpservers.org` | IA (PR/texto) + Usuário | ✅ *(25/11 — abertos [PR #20727](https://github.com/punkpeye/awesome-mcp-servers/pull/20727) e [PR #2813](https://github.com/jaw9c/awesome-remote-mcp-servers/pull/2813); `appcypher` arquivado e `wong2` redireciona ao `mcpservers.org`)* |
| **TR-10** | MCP / SEO Dev | Escrever e publicar **1 artigo técnico evergreen no Dev.to** (em inglês) com tutorial passo a passo conectando Claude Desktop / Cursor / n8n aos Actors SEC EDGAR + USITC Tariffs + USAspending | IA (artigo) + Usuário (publicar) | ✅ *(25/11 — [publicado no Dev.to](https://dev.to/ferrazmichel/how-to-connect-claude-cursor-n8n-to-8-official-us-government-apis-via-mcp-without-blowing-up-1dd2) com tags `#mcp`, `#ai`, `#apify`, `#programming`)* |
| **TR-11** | MCP / Automação | Montar **1 workflow template simples em n8n** (JSON pronto) usando 1 Actor de alto apelo (ex.: alerta semanal de recalls openFDA ou eventos 8-K da SEC) e compartilhar em `r/n8n` / n8n Community | IA (template + post) + Usuário | 🔄 *(25/11 — JSON pronto em `us-gov-mcp-suite/examples/n8n-openfda-class1-recall-alert.json`; ⏰ **Lembrete 26/11:** verificar desbloqueio da conta no `community.n8n.io`, postar texto enxuto no modo `M↓` + postar em `r/n8n` após `TR-08`)* |
| **TR-12** | Medição | Executar `/painel-usd` ao final da semana para registrar a evolução de usuários externos e runs nos 8 Actors | IA + Usuário | ✅ *(27/11 — `/painel-usd`: 8/8 Actors públicos, 17/17 saudáveis, `users_total=16`, `runs_total=49` (`32/33` OK em 30d), receita `US$ 0,00`, custos `US$ 15,44`, `homeenergycalcs.com` `7/120` dias; repetir medição semanal em ~04/12)* |

### Fase 2 — Sprint de Lançamento do ShopPulse (Disparar Assim que Aprovar na Chrome Web Store)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-13** | ShopPulse | Instalar a versão publicada direto da Chrome Web Store em perfil limpo, testar em 2 lojas Shopify e confirmar abertura do checkout Polar.sh (`$15/mês` e `$120/ano`) | Usuário | 🔄 *(26/11 — Polar.sh descartada por não suportar payout Brasil; conta PF na **Dodo Payments** criada com KYC **Aprovado** ✅ e produto + conta bancária BR Local **Em análise** (até 72h); assim que liberar, criar os 2 planos com License Keys, atualizar `analyzer.mjs`/`billingConfig.mjs` para `live.dodopayments.com/licenses/validate` (v1.0.1) e liberar Product Hunt `TR-15`)* |
| **TR-14** | ShopPulse | Cadastrar gratuitamente no **AlternativeTo** (como alternativa leve e privada ao *Koala Inspector* e *PPSPY*) e no **SaaSHub** | IA (textos) + Usuário (cadastro) | ✅ *(26/11 — submetido no AlternativeTo como `ShopPulse` com 4 alternativas + no SaaSHub como `ShopPulse Inspector` vinculado a 7 concorrentes e 5 categorias; ambos em fila gratuita)* |
| **TR-15** | ShopPulse | Preparar copy, tagline e primeiro comentário e publicar lançamento gratuito no **Product Hunt** | IA (kit PH) + Usuário (publicar) | ⬜ |
| **TR-16** | ShopPulse | Fazer **3 a 5 contribuições úteis** (sem spam) em **`r/shopify`, `r/ecommerce` e `r/PPC`** mirando os primeiros **50–100 usuários ativos e 5–10 avaliações 5★** | IA (textos) + Usuário (interação) | ⬜ |

### Fase 3 — Sinais Iniciais Orgânicos para `HomeEnergyCalcs` (Dias 8–14)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-17** | HomeEnergyCalcs | Preparar e publicar **1 post de dados reais (EIA 2026)** em **`r/electricvehicles`**: os 5 estados mais baratos vs. mais caros para carregar EV em casa nos EUA, com link discreto para a calculadora | IA (análise + texto) + Usuário (post) | ⬜ |
| **TR-18** | HomeEnergyCalcs | Preparar e publicar **1 post de dados reais** em **`r/heatpumps`** ou **`r/solar`** (comparativo de payback/custo estadual) para gerar sinais iniciais de engajamento no GA4 e backlinks naturais | IA (análise + texto) + Usuário (post) | ⬜ |

### Fase 4 — Checkpoint Dia 21 (Por volta de 16/12/2026 — Decisão Baseada em Dados)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-19** | Estratégia | Revisar resultados reais dos 21 dias: (a) novos usuários/runs e receita na Apify, (b) instalações e cliques/assinaturas Polar.sh no ShopPulse, (c) indexação/impressões no GSC de `homeenergycalcs.com`. Decidir entre dobrar a aposta no canal vencedor **e/ou** abrir o **Produto #1 da Etsy EUA** ([`ESTUDO_ETSY_PLANILHAS_EUA.md`](ESTUDO_ETSY_PLANILHAS_EUA.md) — *2026–2027 US 1099-NEC & Schedule C Suite* a `$24`) aproveitando o pico fiscal de Jan–Abr/2027 | IA + Usuário | ⬜ |

---

## 5. Material Pronto para Ação Imediata (`TR-02` — PR #5684)

O mantenedor `punkpeye` comentou no [PR #5684](https://github.com/punkpeye/awesome-remote-mcp-servers/pull/5684) que prioriza PRs que tenham o badge/link da listagem no Glama no README e mencionem isso na **descrição do PR**. O badge **já está publicado** na linha 5 do `README.md` de `ferrazmichel/us-gov-mcp-suite`.

- **O que fazer (30 segundos):**
  1. Abrir [PR #5684](https://github.com/punkpeye/awesome-remote-mcp-servers/pull/5684), clicar em `...` → **Edit** na descrição inicial do PR e adicionar ao final:
     ```markdown
     Glama listing badge is already linked in our repository README (`https://github.com/ferrazmichel/us-gov-mcp-suite`):
     https://glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite
     ```
  2. Responder ao comentário do `punkpeye` (opcional, ajuda a notificar):
     ```markdown
     Thanks! The Glama badge is already live in our README (`https://github.com/ferrazmichel/us-gov-mcp-suite`) and I've added the Glama listing link to the PR description as well: https://glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite
     ```

---

## 6. Material Pronto — Fase 1 (`TR-06`, `TR-07`, `TR-08` e `TR-10`)

### `TR-06` — Discord Oficial da Apify (`#showcase` ou `#actors-showcase`)

```markdown
Hey builders! I just shipped a suite of **8 hosted, MCP-ready Actors** wrapping official U.S. government public datasets — all running on lightweight REST/JSON calls (512 MB, no headless browser, zero external API keys required for users):

1. **SEC EDGAR Filings, 8-K & XBRL Financials** (`sec-edgar-filings-mcp`) — `10-K`/`10-Q`/`8-K` decoding + audited US-GAAP XBRL snapshots compressed into ~2 KB `mcp_summary` digests
2. **USITC HTS Tariff & Landed Cost Calculator** (`usitc-hts-tariff-mcp`) — 10-digit tariff inheritance, Section 301/232, CBP MPF/HMF & `CN` vs `VN` vs `MX` vs `KR` landed cost comparison
3. **US 1099-NEC 2026 Threshold & State Compliance** (`us-1099-nec-state-compliance-mcp`) — 2026 `$2,000` federal vs `$600–$1,200` state filing rules across all 51 US jurisdictions + 24% backup withholding audit
4. **openFDA Recall Radar** (`openfda-recall-device-radar`) — unified Class I/II/III recall monitoring across drugs, devices, and food with risk scoring
5. **OSHA Safety & Compliance** (`osha-safety-compliance-mcp`) — DOL workplace inspections, violations & penalty totals
6. **EPA ECHO Environmental** (`epa-echo-environmental-mcp`) — CAA/CWA/RCRA compliance & automated facility risk scoring
7. **FMCSA & USDOT Carrier Safety** (`fmcsa-carrier-safety-mcp`) — carrier vetting (`PASS` to `DO_NOT_USE`), MC/USDOT authority & BIPD insurance
8. **USAspending Federal Contracts & Re-Compete Radar** (`usaspending-federal-contracts-mcp`) — prime contracts, incumbent NAICS intelligence & expiring contract re-compete alerts

All 8 can be connected in a single Streamable HTTP MCP config via `https://mcp.apify.com`.

- **GitHub Showcase & MCP Config:** https://github.com/ferrazmichel/us-gov-mcp-suite
- **Apify Store Profile:** https://apify.com/ferraz_michel

Would love feedback on the `mcp_summary` output format and any other US regulatory datasets you'd find useful in AI workflows!
```

### `TR-07` — Reddit `r/mcp`

- **Title:**
  ```text
  I wrapped 8 messy US Government APIs (SEC XBRL, USITC Tariffs, 2026 1099-NEC, openFDA, USAspending, OSHA/EPA/FMCSA) into ~2 KB MCP tools — zero API keys needed
  ```

- **Body:**
  ```markdown
  Government datasets are goldmines for financial, legal, supply-chain, and compliance agents — but raw endpoints are brutal on LLM context windows and brittle in practice:

  - **SEC EDGAR `companyfacts` XBRL** files routinely exceed **4 MB+** per company.
  - **USITC HTS** 10-digit statistical codes omit duty rates stored on 8-digit parent headings (plus Chapter 99 Section 301/232 + CBP MPF/HMF fees).
  - **EPA ECHO** requires two-step `QueryID` session orchestration.
  - **DOL OSHA** endpoints cap at 200 rows without joining violation details.
  - **Form 1099-NEC (2026)** changed the federal threshold to `$2,000`, while multiple US states kept `$600–$1,200` rules.

  To solve this for Claude Desktop, Cursor, n8n, and LangGraph workflows, I built **US Government Public Data MCP Suite** — 8 hosted Streamable HTTP MCP servers with an `"outputMode": "mcp_summary"` mode that compresses multi-megabyte responses into **~2 KB structured JSON digests** with pre-computed verdicts and metrics.

  **Included tools (zero user API keys required):**
  1. **SEC EDGAR (`sec-edgar-filings-mcp`)** — 10-K/10-Q/8-K material events + audited US-GAAP snapshots
  2. **USITC HTS (`usitc-hts-tariff-mcp`)** — 10-digit tariff lookup, USMCA exemptions & CN/VN/MX/KR landed cost comparison
  3. **US 1099-NEC 2026 (`us-1099-nec-state-compliance-mcp`)** — 50 states + DC compliance & 24% backup withholding check
  4. **openFDA (`openfda-recall-device-radar`)** — parallel drug, medical device & food recall monitor with severity scoring
  5. **USAspending (`usaspending-federal-contracts-mcp`)** — federal prime awards & expiring contract re-compete radar
  6. **DOL OSHA (`osha-safety-compliance-mcp`)** — workplace inspections, violations & penalty totals
  7. **EPA ECHO (`epa-echo-environmental-mcp`)** — CAA/CWA/RCRA facility environmental risk scores
  8. **USDOT FMCSA (`fmcsa-carrier-safety-mcp`)** — carrier safety vetting, operating authority & BIPD insurance

  **Transparency note:** The hosted endpoints run on Apify's official MCP gateway (`https://mcp.apify.com`, OAuth + Pay-Per-Event at `$5 / 1k` records, covered by Apify's free monthly tier for testing). All MCP configs (`mcp.json`, Claude Desktop examples, and prompts) are documented in the public showcase repo:

  👉 **GitHub (configs & prompts):** https://github.com/ferrazmichel/us-gov-mcp-suite

  I'd genuinely appreciate technical feedback from people building compliance, finance, or GovCon agents — especially on whether the ~2 KB summary schema leaves out any fields you'd want in the first pass.
  ```

### `TR-08` — Reddit `r/ClaudeAI` *(aguardar ~12–24h após `TR-07` e ativar **Markdown Editor**)*

- **Title:**
  ```text
  4 real-world prompts I run in Claude Desktop using official US Gov datasets (SEC XBRL, Tariffs, 2026 1099-NEC, Federal Contracts) via MCP
  ```

- **Body:**
  ```markdown
  I got tired of copy-pasting giant PDFs and broken government portals into Claude whenever I needed official US regulatory or financial data, so I connected 8 public US Government datasets to Claude Desktop via MCP (`mcp.apify.com` — no external API keys needed on the user side, with a `~2 KB` `mcp_summary` mode so it doesn't eat your context limit).

  Here are 4 prompts that actually work reliably in one turn:

  1. **Equity / 10-K & 8-K Check (SEC EDGAR XBRL):**
     > *"Fetch the latest 10-K and 8-K filings for AAPL and NVDA using `sec-edgar-filings-mcp` in `mcp_summary` mode and compare Revenue, Net Income, Net Margin %, and Cash."*

  2. **Sourcing & Section 301 Tariff Comparison (USITC HTS):**
     > *"Use `usitc-hts-tariff-mcp` to compare the total US landed cost (duty rate, Chapter 99 Section 301/232, MPF/HMF, and FTA exemptions) for HTS `8507.60` on a $25,000 ocean shipment from China vs. Vietnam vs. Mexico."*

  3. **2026 1099-NEC State Threshold Trap (`$2,000` Federal vs State Rules):**
     > *"Check with `us-1099-nec-state-compliance-mcp` whether a $1,250 contractor payment in California, New York, Texas, and Massachusetts triggers 2026 1099-NEC state filing or 24% backup withholding."*

  4. **Federal Contract Re-Compete Radar (USAspending):**
     > *"Find expiring DoD cybersecurity prime contracts over $500k in the next 180 days using `usaspending-federal-contracts-mcp` and summarize the incumbent contractors."*

  Full `claude_desktop_config.json` and Streamable HTTP config (one URL connects all 8 tools, plus OSHA, EPA ECHO, FMCSA, and openFDA):
  https://github.com/ferrazmichel/us-gov-mcp-suite

  *(Transparency: I built the 8 hosted MCP tools on Apify's Pay-Per-Event tier at `$5 / 1k` records, and Apify gives `$5/mo` free usage to test them out.)*
  ```

### `TR-10` — Artigo Técnico Evergreen no Dev.to (`dev.to`)

- **Title:** `How to Connect Claude, Cursor & n8n to 8 Official US Government APIs via MCP (Without Blowing Up Your Context Window)`
- **Tags:** `mcp`, `ai`, `apify`, `programming`
- **Body:**
  ````markdown
  If you have ever tried hooking an LLM agent directly up to US government APIs, you already know why most workflows break in practice:

  - **SEC EDGAR `companyfacts` XBRL** files routinely exceed **4 MB+** of raw JSON per ticker.
  - **USITC HTS** 10-digit statistical codes often omit base duty rates inherited from 8-digit parent headings (before even adding Chapter 99 Section 301/232 duties and CBP MPF/HMF fees).
  - **EPA ECHO** forces a two-step `QueryID` session flow just to paginate facilities.
  - **DOL OSHA** caps inspections at 200 rows without joining violations or penalty sums.
  - **2026 Form 1099-NEC** raised the federal threshold to **$2,000**, while key states kept **$600–$1,200** filing rules.

  Instead of burning tokens parsing raw endpoints inside agent loops, I packaged **8 official US government datasets** into hosted **Model Context Protocol (MCP)** tools on Apify — all sharing a compact `"outputMode": "mcp_summary"` mode that compresses multi-megabyte responses into **~2 KB structured JSON digests**.

  ## The 8 Tools Included (Zero External API Keys Needed)

  1. **SEC EDGAR (`ferraz_michel/sec-edgar-filings-mcp`)** — `10-K`, `10-Q`, `8-K` material events + audited US-GAAP XBRL snapshots (`Revenue`, `Net Income`, `Net Margin %`, `Assets`, `Equity`, `Cash`).
  2. **USITC HTS Tariff & Landed Cost (`ferraz_michel/usitc-hts-tariff-mcp`)** — 10-digit rate inheritance, USMCA/FTA exemptions, Section 301/232, MPF/HMF & `CN` vs `VN` vs `MX` vs `KR` comparisons.
  3. **US 1099-NEC 2026 Compliance (`ferraz_michel/us-1099-nec-state-compliance-mcp`)** — all 50 states + DC rules, IRS CF/SF checks, and 24% backup withholding audits.
  4. **openFDA Recall Radar (`ferraz_michel/openfda-recall-device-radar`)** — parallel drug, medical device, and food enforcement recalls with severity scoring.
  5. **USAspending Federal Contracts (`ferraz_michel/usaspending-federal-contracts-mcp`)** — prime awards, NAICS incumbent intelligence, and expiring re-compete alerts.
  6. **DOL OSHA (`ferraz_michel/osha-safety-compliance-mcp`)** — workplace inspections, citations, and penalty totals.
  7. **EPA ECHO (`ferraz_michel/epa-echo-environmental-mcp`)** — CAA/CWA/RCRA compliance and facility environmental risk scoring.
  8. **USDOT FMCSA (`ferraz_michel/fmcsa-carrier-safety-mcp`)** — carrier vetting (`PASS` to `DO_NOT_USE`), MC/USDOT authority, and BIPD insurance.

  ## Quick Setup: Connect All 8 Tools in One Config

  ### Option A — Remote Streamable HTTP (Recommended for Cursor / HTTP MCP clients)

  ```json
  {
    "mcpServers": {
      "us-gov-data-suite": {
        "transport": "http",
        "url": "https://mcp.apify.com/?actors=ferraz_michel/sec-edgar-filings-mcp,ferraz_michel/usitc-hts-tariff-mcp,ferraz_michel/us-1099-nec-state-compliance-mcp,ferraz_michel/openfda-recall-device-radar,ferraz_michel/osha-safety-compliance-mcp,ferraz_michel/epa-echo-environmental-mcp,ferraz_michel/fmcsa-carrier-safety-mcp,ferraz_michel/usaspending-federal-contracts-mcp"
      }
    }
  }
  ```

  ### Option B — Claude Desktop (`claude_desktop_config.json`)

  ```json
  {
    "mcpServers": {
      "us-gov-data-suite": {
        "command": "npx",
        "args": [
          "-y",
          "@apify/actors-mcp-server",
          "--actors",
          "ferraz_michel/sec-edgar-filings-mcp,ferraz_michel/usitc-hts-tariff-mcp,ferraz_michel/us-1099-nec-state-compliance-mcp,ferraz_michel/openfda-recall-device-radar,ferraz_michel/osha-safety-compliance-mcp,ferraz_michel/epa-echo-environmental-mcp,ferraz_michel/fmcsa-carrier-safety-mcp,ferraz_michel/usaspending-federal-contracts-mcp"
        ],
        "env": {
          "APIFY_TOKEN": "YOUR_APIFY_TOKEN"
        }
      }
    }
  }
  ```

  ### Option C — Direct REST API (for n8n, Make, or Python scripts)

  ```bash
  curl -X POST "https://api.apify.com/v2/acts/ferraz_michel~sec-edgar-filings-mcp/run-sync-get-dataset-items?token=YOUR_APIFY_TOKEN" \
    -H "Content-Type: application/json" \
    -d '{
      "tickersOrCiks": ["AAPL", "NVDA"],
      "forms": ["10-K", "8-K"],
      "includeFinancialSnapshot": true,
      "maxFilingsPerCompany": 3,
      "outputMode": "mcp_summary"
    }'
  ```

  ## 3 Prompts You Can Test Right Away

  1. **Equity Research:** *"Fetch AAPL and NVDA latest 10-K and 8-K filings along with audited US-GAAP Revenue, Net Income, and Cash in `mcp_summary` mode."*
  2. **Import Landed Cost:** *"Compare total US landed cost for HTS `8507.60` lithium-ion batteries on a $25,000 ocean shipment from China vs. Vietnam vs. Mexico."*
  3. **GovCon Re-Compete Radar:** *"Find US federal DoD cybersecurity prime contracts expiring in the next 180 days with award value above $500,000."*

  ## Pricing & Links

  All 8 tools run on Apify's Pay-Per-Event model (`$5.00 / 1,000` records, and Apify includes `$5/month` of free platform credits to test).

  - **GitHub Showcase (`mcp.json` & prompts):** https://github.com/ferrazmichel/us-gov-mcp-suite
  - **Apify Store Profile:** https://apify.com/ferraz_michel
  - **Glama Connector:** https://glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite

  If you are building agents for finance, compliance, supply chain, or GovCon, let me know in the comments which US public dataset or summary metric you'd like added next!
  ````

---

## 7. Material Pronto — `TR-09` (2 PRs em Listas Curadas MCP) e `TR-11` (n8n Template + Posts)

### `TR-09` — Submeter `us-gov-mcp-suite` em 2 diretórios gratuitos no GitHub

*(Obs.: `wong2/awesome-mcp-servers` não aceita PRs e redireciona exclusivamente para `https://mcpservers.org/submit`, onde já enviamos em 23/11. Os 2 repositórios abaixo aceitam PR direto pela web do GitHub com sua conta `ferrazmichel`.)*

#### PR #1 — `punkpeye/awesome-mcp-servers`
1. Acesse logado como `ferrazmichel`: https://github.com/punkpeye/awesome-mcp-servers/edit/main/README.md
2. Localize a seção `### 💰 <a name="finance--fintech"></a>Finance & Fintech` (`Ctrl + F`: `finance--fintech`) e adicione esta linha em ordem ou ao final do bloco:
   ```markdown
   - [ferrazmichel/us-gov-mcp-suite](https://github.com/ferrazmichel/us-gov-mcp-suite) [![ferrazmichel/us-gov-mcp-suite MCP connector](https://glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite/badges/score.svg)](https://glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite) 🐍 ☁️ - Suite of 8 hosted Streamable HTTP MCP tools wrapping official US government datasets (SEC EDGAR 10-K/8-K/XBRL, USITC HTS tariffs & landed cost, 2026 Form 1099-NEC state rules, USAspending federal contracts, openFDA recalls, DOL OSHA, EPA ECHO, and USDOT FMCSA) with ~2 KB `mcp_summary` digests and zero external API keys required.
   ```
3. **Commit / PR Title:**
   ```text
   Add US Government Public Data MCP Suite (8 hosted US regulatory & financial tools)
   ```
4. **PR Description:**
   ```markdown
   Adds **US Government Public Data MCP Suite** (`https://github.com/ferrazmichel/us-gov-mcp-suite`) under **Finance & Fintech**.

   - **Glama listing (with badge linked in README):** https://glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite
   - **8 hosted Streamable HTTP tools on Apify (`mcp.apify.com`):** SEC EDGAR XBRL, USITC HTS Tariffs, 2026 Form 1099-NEC, USAspending Federal Contracts, openFDA Recalls, DOL OSHA, EPA ECHO, and USDOT FMCSA.
   - Zero external API keys required from users + token-efficient `~2 KB` `mcp_summary` output mode.
   ```

#### PR #2 — `jaw9c/awesome-remote-mcp-servers` *(substituiu `appcypher`, arquivado em Ago/2026 — [PR #2813 aberto em 25/11](https://github.com/jaw9c/awesome-remote-mcp-servers/pull/2813))*
1. Acesse logado como `ferrazmichel`: https://github.com/jaw9c/awesome-remote-mcp-servers/edit/main/README.md
2. Na tabela **`## Remote MCP Server List`**, em ordem alfabética (letra `U`), adicione:
   ```markdown
   | US Gov Public Data Suite | Government & Finance Data | `https://mcp.apify.com/?actors=ferraz_michel/sec-edgar-filings-mcp,ferraz_michel/usitc-hts-tariff-mcp,ferraz_michel/us-1099-nec-state-compliance-mcp,ferraz_michel/openfda-recall-device-radar,ferraz_michel/osha-safety-compliance-mcp,ferraz_michel/epa-echo-environmental-mcp,ferraz_michel/fmcsa-carrier-safety-mcp,ferraz_michel/usaspending-federal-contracts-mcp` | OAuth2.1 & API Key | [Michel Ferraz](https://github.com/ferrazmichel/us-gov-mcp-suite) |
   ```
3. **Commit / PR Title:**
   ```text
   Add US Gov Public Data Suite (8 hosted US regulatory & finance MCP tools)
   ```
4. **PR Description:**
   ```markdown
   Adds **US Gov Public Data Suite** (`https://github.com/ferrazmichel/us-gov-mcp-suite`), a hosted Streamable HTTP MCP suite on Apify (`mcp.apify.com`) providing token-efficient (`~2 KB`) access to 8 official US government datasets (SEC EDGAR XBRL, USITC HTS Tariffs, 2026 Form 1099-NEC, USAspending Federal Contracts, openFDA Recalls, DOL OSHA, EPA ECHO, and USDOT FMCSA) with zero external API keys required.
   ```

---

### `TR-11` — Template n8n + Post pronto para `community.n8n.io` (hoje) e `r/n8n` (respeitando janela do Reddit)

- **Arquivo importável no n8n:** `https://github.com/ferrazmichel/us-gov-mcp-suite/blob/main/examples/n8n-openfda-class1-recall-alert.json`
- **Onde postar:**
  - **26/11 (após desbloqueio):** [n8n Community (`Built with n8n`)](https://community.n8n.io/c/built-with-n8n/15) *(checar liberação da conta nova e colar apenas o texto enxuto no modo Markdown `M↓`)*
  - **Depois de `TR-08` (ou alternando dias):** `https://www.reddit.com/r/n8n/` *(ativar **Markdown Editor**)*
- **Title:**
  ```text
  Free importable n8n workflow: Weekly FDA Class I Recall Radar (with zero FDA API config + Slack/Email digest)
  ```
- **Body:**
  ```markdown
  I put together a lightweight 5-node n8n workflow that runs every Monday at 08:00, pulls active **FDA Class I recalls** (drugs, medical devices & food) via a single HTTPS call, and builds a clean executive digest ready to route into Slack, Gmail, or Microsoft Teams.

  **Importable workflow JSON (built 100% with native nodes — Schedule Trigger, HTTP Request, Code, IF):**  
  https://github.com/ferrazmichel/us-gov-mcp-suite/blob/main/examples/n8n-openfda-class1-recall-alert.json

  ### How to set it up in 60 seconds
  1. Import the JSON into n8n.
  2. Set `APIFY_TOKEN` in your n8n environment variables (or replace `{{ $env.APIFY_TOKEN }}` in the HTTP Request node with an HTTP Bearer credential).
  3. Connect Slack / Gmail / Teams to the final node.

  ### Swap the endpoint for 7 other official US datasets
  The exact same HTTP Request node pattern also works for 7 other US regulatory & financial datasets in the repo (`sec-edgar-filings-mcp`, `usitc-hts-tariff-mcp`, `us-1099-nec-state-compliance-mcp`, `usaspending-federal-contracts-mcp`, `osha-safety-compliance-mcp`, `epa-echo-environmental-mcp`, `fmcsa-carrier-safety-mcp`).

  *(Transparency note: the workflow calls our hosted Apify Actor at `$5 / 1,000` recall records; Apify includes `$5/mo` in free credits, so a weekly 15-recall monitor costs pennies and stays well inside the free tier.)*

  Full repo with MCP configs and examples: https://github.com/ferrazmichel/us-gov-mcp-suite
  ```



---

## 8. Material Pronto — Fase 2 (`TR-15` — Lançamento do ShopPulse no Product Hunt)

> [!IMPORTANT]
> **Pré-requisito antes de publicar:** aguardar o almoço (`26/11`) para concluir o KYC + `Payout Account` na **Polar.sh** e tirar o checkout do *Test Mode*, garantindo que visitantes vindos do Product Hunt consigam assinar o plano Pro imediatamente.

- **Onde lançar:** https://www.producthunt.com/posts/new
- **Name:** `ShopPulse`
- **Tagline** *(58 / 60 caracteres)*:
  ```text
  Inspect Shopify themes, pixels, apps & catalogs in 1 click
  ```
- **Links:**
  - **Product Link (Chrome Web Store):** `https://chromewebstore.google.com/detail/shoppulse-shopify-pixel-a/nbmgmembajfhfnebbedfddjdoeimknad`
  - **Website / Support:** `https://ferrazmichel.github.io/shoppulse-docs/`
- **Description** *(244 / 260 caracteres)*:
  ```text
  ShopPulse is a privacy-first Chrome extension for Shopify operators, agencies & media buyers. Inspect any store's theme, Meta/TikTok/GA4 pixels, apps & pricing stats, and export catalogs to CSV/JSON — 100% locally in Chrome with zero sign-up.
  ```
- **Topics (3):** `Chrome Extensions`, `E-Commerce`, `Marketing` *(alternativa caso falte algum: `Analytics`)*
- **Pricing:** `Freemium` *(Free + Pro `$15/mo` ou `$120/yr`)*
- **Assets locais para upload:**
  - **Thumbnail (240×240 / ícone):** `shopify-pixel-catalog-inspector/icons/icon128.png`
  - **Gallery (3 screenshots 1280×800):** `shopify-pixel-catalog-inspector/store-assets/screenshot-1-overview-1280x800.png`, `screenshot-2-pixels-apps-1280x800.png`, `screenshot-3-catalog-csv-1280x800.png`

- **First Maker Comment** *(colar imediatamente após publicar o post)*:
  ```markdown
  Hey Product Hunt! 👋

  I built **ShopPulse** because most Shopify spy/inspector extensions either ask for broad `<all_urls>` permissions across every site you visit, require mandatory account sign-up, or charge `$19–$49/mo` just to inspect a storefront's tech stack and export a catalog.

  **What ShopPulse does in 1 click (100% locally in your browser):**
  - **Store & Theme Overview:** Detects the permanent `.myshopify.com` domain, active theme name, currency, and Shopify Plus signals.
  - **Pixels & Ad Tracking Audit:** Finds Meta, TikTok, GA4, GTM, Pinterest, and Snapchat tags along with their public tracking IDs.
  - **Installed Apps:** Spots review, loyalty, subscription, upsell, SMS, and support apps running on the storefront.
  - **Catalog & Pricing Stats + Export:** Inspects product/variant counts, price range, average/median prices, discounts, and exports to CSV or JSON.

  **Privacy-first by design (Manifest V3):**
  - Uses `activeTab` + on-demand `scripting` only when you click the icon — never `<all_urls>`.
  - Zero account creation, zero remote tracking, and zero data leaves your browser.

  **Free vs. Pro:**
  - **Free:** Unlimited store inspections + 25-row CSV catalog preview forever.
  - **Pro (`$15/mo` or `$120/yr`):** Unlimited CSV & JSON catalog exports + full Markdown competitor audit briefs.

  Try it on any Shopify store and let me know which pixel, app signature, or export column you'd like added next!
  ```

---

## 9. Material Pronto — Fase 3 (`TR-17` e `TR-18` — `HomeEnergyCalcs` / Dados Reais EIA 2026)

> [!TIP]
> **Janela recomendada no Reddit:** publicar `TR-17` e `TR-18` a partir da **Semana 2** (com espaçamento mínimo de **2–3 dias** entre posts na mesma conta e ativando o **Markdown Editor** antes de colar as tabelas).

### `TR-17` — Reddit `r/electricvehicles` (5 estados mais baratos vs. mais caros para carregar EV em casa)

- **Onde postar:** `https://www.reddit.com/r/electricvehicles/` *(de casa, após o período de carência / espaçamento entre posts; marcar **Markdown Editor**)*
- **Title:**
  ```text
  I ran the 2026 EIA electricity & gas numbers across all 50 US states + DC: the 5 cheapest vs. 5 most expensive states for home EV charging (and the California paradox)
  ```
- **Body:**
  ```markdown
  Everyone quotes the national average (~18¢/kWh), which hides how wildly EV economics swing depending on your state utility rate vs. local gas prices.

  I compiled the **August 2026 U.S. EIA residential electricity rates** and regional gasoline benchmarks across all **50 states + DC** using a consistent baseline (**13,500 miles/year**, **3.4 mi/kWh EV**, **90% wall-to-battery efficiency**, **85% home / 15% public fast charging** vs. a **28 MPG** gas car).

  ### 5 Cheapest States for Home EV Charging (`¢/kWh`)

  | State | Residential Rate | 75 kWh Full Home Charge | Cost / 100 mi (Home) | Pure Home Annual Cost | Annual Savings vs. Gas (85/15) |
  | :--- | :---: | :---: | :---: | :---: | :---: |
  | **Nevada** | `12.72¢` | `$10.60` | `$4.16` | `$561/yr` | **`$1,151/yr`** |
  | **Louisiana** | `12.87¢` | `$10.72` | `$4.21` | `$568/yr` | `$629/yr` |
  | **North Dakota** | `13.31¢` | `$11.09` | `$4.35` | `$587/yr` | `$728/yr` |
  | **Utah** | `13.31¢` | `$11.09` | `$4.35` | `$587/yr` | `$953/yr` |
  | **Idaho** | `13.37¢` | `$11.14` | `$4.37` | `$590/yr` | `$918/yr` |

  ### 5 Most Expensive States for Home EV Charging (`¢/kWh`)

  | State | Residential Rate | 75 kWh Full Home Charge | Cost / 100 mi (Home) | Pure Home Annual Cost | Annual Savings vs. Gas (85/15) |
  | :--- | :---: | :---: | :---: | :---: | :---: |
  | **Hawaii** | `47.18¢` | `$39.32` | `$15.42` | `$2,081/yr` | `$77/yr` |
  | **Maine** | `32.11¢` | `$26.76` | `$10.49` | `$1,417/yr` | `$60/yr` |
  | **Massachusetts** | `30.48¢` | `$25.40` | `$9.96` | `$1,345/yr` | `$91/yr` |
  | **California** | `29.75¢` | `$24.79` | `$9.72` | `$1,313/yr` | **`$804/yr`** |
  | **Alaska** | `29.41¢` | `$24.51` | `$9.61` | `$1,298/yr` | `$443/yr` |

  ### 3 Takeaways From the Data
  1. **Cheapest kWh ≠ biggest net savings:** **Washington (`14.63¢/kWh` + `$4.22/gal` gas)** actually leads the entire country in annual fuel savings (**`$1,201/yr`** or **`$6,007` over 5 years**), slightly ahead of Nevada (`$1,151/yr`) and Oregon (`$994/yr`).
  2. **The California paradox:** Even at a steep `29.75¢/kWh` standard residential average, `$4.75/gal` gasoline means California drivers *still* save **`$804/yr`** on blended charging — before factoring in off-peak EV TOU plans.
  3. **New England is the tightest spread:** **Maine (`$60/yr`)** and **Massachusetts (`$91/yr`)** sit near break-even at standard residential tariffs because `30¢+` power meets `~$3.26–$3.28/gal` gas, making off-peak TOU plans and high-efficiency EVs critical there.

  If you want to plug in your exact utility kWh rate, MPG, annual mileage, and home-vs-DCFC split for your state, I put the full state-by-state calculator online (free, no sign-up): https://homeenergycalcs.com/ev-charging-cost

  Curious how your actual off-peak TOU tariff compares to your state's EIA average.
  ```

---

### `TR-18` — Reddit `r/heatpumps` *(principal)* + Bloco Opcional `r/solar`

#### Opção Principal — `r/heatpumps` (Break-even COP nos 50 estados + DC)

- **Onde postar:** `https://www.reddit.com/r/heatpumps/` *(ativar **Markdown Editor**)*
- **Title:**
  ```text
  I calculated the exact Heat Pump vs. Gas Furnace break-even COP across all 50 US states + DC using 2026 EIA rates — heat pumps win on operating cost in 17/51 jurisdictions
  ```
- **Body:**
  ```markdown
  "Will a heat pump actually lower my winter heating bill compared to my gas furnace?" almost always comes down to one ratio: your local **electricity (`¢/kWh`) vs. natural gas (`$/therm`)** spread, which defines your **break-even COP**.

  Using **August 2026 U.S. EIA residential electricity & natural gas benchmarks**, I modeled a **9.5 HSPF2 cold-climate heat pump (seasonal COP `2.78`)** against an **85% AFUE gas furnace** across climate-adjusted annual heating loads (**60 MMBtu** cold, **38 MMBtu** mixed, **18 MMBtu** hot) in all **50 states + DC**.

  ### Result: Heat pumps beat gas on pure volumetric operating cost in **17 of 51** jurisdictions

  **Top 5 States Where Heat Pumps Save the Most vs. Gas (Pure Volumetric Fuel Cost):**

  | State (Zone) | Elec (`¢/kWh`) | Gas (`$/therm`) | Break-Even COP | Annual Heat Pump Cost | Annual Gas Cost | Net Savings |
  | :--- | :---: | :---: | :---: | :---: | :---: | :---: |
  | **Florida** (Hot) | `14.99¢` | `$2.15` | **`1.74`** | `$284/yr` | `$455/yr` | **`+$171/yr`** |
  | **North Carolina** (Mixed) | `14.95¢` | `$1.64` | **`2.27`** | `$598/yr` | `$733/yr` | **`+$135/yr`** |
  | **Arkansas** (Mixed) | `14.37¢` | `$1.54` | **`2.32`** | `$575/yr` | `$688/yr` | **`+$114/yr`** |
  | **Georgia** (Hot) | `15.90¢` | `$1.85` | **`2.14`** | `$301/yr` | `$392/yr` | **`+$91/yr`** |
  | **Nevada** (Hot) | `12.72¢` | `$1.56` | **`2.03`** | `$241/yr` | `$330/yr` | **`+$89/yr`** |

  **5 States With the Steepest Gas Advantage (Without Solar or Off-Peak TOU):**

  | State (Zone) | Elec (`¢/kWh`) | Gas (`$/therm`) | Break-Even COP | Annual Heat Pump Cost | Annual Gas Cost | Gas Advantage |
  | :--- | :---: | :---: | :---: | :---: | :---: | :---: |
  | **Alaska** (Cold) | `29.41¢` | `$1.38` | **`5.31`** | `$1,857/yr` | `$974/yr` | `$883/yr` |
  | **Maine** (Cold) | `32.11¢` | `$1.98` | **`4.04`** | `$2,028/yr` | `$1,398/yr` | `$630/yr` |
  | **Michigan** (Cold) | `22.99¢` | `$1.22` | **`4.69`** | `$1,452/yr` | `$861/yr` | `$591/yr` |
  | **New York** (Cold) | `28.65¢` | `$1.76` | **`4.06`** | `$1,809/yr` | `$1,242/yr` | `$567/yr` |
  | **Massachusetts** (Cold) | `30.48¢` | `$2.04` | **`3.72`** | `$1,925/yr` | `$1,440/yr` | `$485/yr` |

  ### Two Caveats That Often Flip the Math in Real Life
  1. **Fixed gas meter customer charges (`$15–$35/mo`):** In mild/hot states or high-efficiency homes, disconnecting gas altogether saves **`$180–$420/yr`** in fixed meter fees that aren't in the volumetric rate.
  2. **Electric resistance / oil / propane:** Compared to baseboard/resistance heat (`COP 1.0`), a `9.5 HSPF2` heat pump cuts heating bills by ~64% in **every single state** (hundreds to `$1,300+/yr` saved).

  If you want to adjust HSPF2 (`8.5` to `11.0`), AFUE (`80%` to `95%`), and your actual utility tariff per state, here is the free calculator: https://homeenergycalcs.com/heat-pump-vs-gas

  In high-rate states like MI, NY, and MA, are any of you using dual-fuel switchover temperatures (e.g. running the heat pump down to `35–40°F` and switching to gas below that)?
  ```

#### Bloco Opcional — `r/solar` *(se preferir postar em `r/solar` ou fazer em outra semana separada)*

- **Onde postar:** `https://www.reddit.com/r/solar/` *(ativar **Markdown Editor**)*
- **Title:**
  ```text
  Unsubsidized residential solar payback in 2026 across all 50 states + DC (8 kW @ $2.85/W, 0% tax credit): 3.5 years in Hawaii to 17.1 years in Washington
  ```
- **Body:**
  ```markdown
  With federal tax credit uncertainty top of mind in 2026, I modeled **completely unsubsidized** residential solar economics (**`8 kW` system @ `$2.85/W` = `$22,800` gross**, **`0%` incentive**, `0.80` performance ratio, `0.5%/yr` degradation, `2.5%/yr` utility escalation) across all **50 US states + DC** using 2026 EIA retail electricity rates and NREL peak sun-hours.

  - **5 Fastest Unsubsidized Paybacks:**
    - **Hawaii** (`47.18¢/kWh`, `5.9` sun hrs): **`3.5 years`** (`$6,503` Year-1 savings | `$185,146` 25-yr net profit)
    - **California** (`29.75¢/kWh`, `5.8` sun hrs): **`5.7 years`** (`$4,031` Year-1 savings | `$106,101` 25-yr net profit)
    - **Maine** (`32.11¢/kWh`, `4.1` sun hrs): **`7.4 years`** (`$3,075` Year-1 savings | `$75,548` 25-yr net profit)
    - **Massachusetts** (`30.48¢/kWh`, `4.2` sun hrs): **`7.6 years`** (`$2,990` Year-1 savings | `$72,832` 25-yr net profit)
    - **Rhode Island** (`28.18¢/kWh`, `4.3` sun hrs): **`8.1 years`** (`$2,831` Year-1 savings | `$67,721` 25-yr net profit)
  - **5 Slowest Unsubsidized Paybacks:** **Washington (`17.1 yrs`)**, **Kentucky (`16.1 yrs`)**, **North Dakota (`15.9 yrs`)**, **Louisiana (`15.5 yrs`)**, and **Tennessee (`15.5 yrs`)** — driven by cheap `12.8¢–14.6¢/kWh` retail power rather than lack of sun.

  Notice how **New England** (`ME`, `MA`, `RI`) beats sunnier Sunbelt states on payback purely because retail electric rates (`28¢–32¢/kWh`) dominate solar ROI far more than peak sun-hours (assuming 1:1 or favorable net metering).

  Interactive calculator with custom `$/W`, system size, and state/utility rebates (`0%`, `15%`, `30%`): https://homeenergycalcs.com/solar-payback
  ```
