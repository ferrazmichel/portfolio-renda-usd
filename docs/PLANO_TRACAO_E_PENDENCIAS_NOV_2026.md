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
| **ShopPulse (Chrome Web Store + Polar.sh)** | 🥇 **Mais rápida** (`1 assinatura = $15–$120`) | Polar.sh configurado (`$15/mês`, `$120/ano`). 1ª submissão (`24/11`) rejeitada por *Yellow Argon / Keyword Spam* nas listas de marcas da descrição. Descrição v2 limpa já pronta em [`KIT_PUBLICACAO_SHOPPULSE.md`](KIT_PUBLICACAO_SHOPPULSE.md). | Reenviar descrição v2 no Developer Console e aguardar aprovação para disparar `AlternativeTo`, `SaaSHub`, `Product Hunt` e Reddit. |
| **Suíte MCP / 8 Actors Apify** | 🥈 **Recorrente B2B** (`$5/1k eventos`) | 8/8 públicos e online. `Glama` aprovado. `mcpservers.org` em revisão (`23/11`). **PR #5684 (`awesome-remote-mcp-servers`) passou no CI sem conflitos** e recebeu comentário do dono (`punkpeye`) pedindo mencionar o link/badge do Glama na descrição do PR para priorizar o merge. | Atualizar descrição do PR #5684 (30s) + executar Sprint de divulgação (Discord Apify, `r/mcp`, `r/ClaudeAI`, Dev.to, n8n). |
| **HomeEnergyCalcs (`homeenergycalcs.com`)** | 🥉 **Médio prazo passivo** (`Mediavine Mar/2027`) | 161 URLs no ar, GA4 + Search Console + Bing IndexNow configurados, 5/120 dias de domínio. | Conferir ritmo de indexação no Search Console/Bing e gerar 2–3 sinais/backlinks orgânicos iniciais para acelerar saída do sandbox. |

---

## 4. Plano Mestre de Ações e Checklist (`TR-01` a `TR-19`)

### Fase 0 — Conferências e Desbloqueios Imediatos (Dias 1–2)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-01** | ShopPulse | Substituir o campo `Descrição*` na Chrome Web Store pela versão v2 (sem listas de marcas, ver [`KIT_PUBLICACAO_SHOPPULSE.md`](KIT_PUBLICACAO_SHOPPULSE.md)), salvar rascunho e clicar em **Enviar para análise** | Usuário | 🔄 *(Em andamento em 25/11)* |
| **TR-02** | MCP / GitHub | **Desbloquear merge prioritário do [PR #5684](https://github.com/punkpeye/awesome-remote-mcp-servers/pull/5684):** editar a descrição do PR informando que o badge do Glama já está no `README.md` de `us-gov-mcp-suite` + incluir link do Glama (texto pronto na Seção 5 abaixo) | Usuário | ⬜ *(Pronto para fazer agora — 30s)* |
| **TR-03** | MCP / Glama | Conferir e-mail de *claim* da listagem no **Glama** (`glama.ai/mcp/connectors/com.apify.mcp/us-gov-mcp-suite`) e verificar se a página já reflete os 8 Actors | Usuário | ⬜ |
| **TR-04** | HomeEnergyCalcs | Conferir **Google Search Console** e **Bing Webmaster Tools** de `homeenergycalcs.com` (nº de páginas indexadas das 161, impressões, erros de rastreamento) | Usuário | ⬜ |
| **TR-05** | Portfólio HQ | Sincronizar `AGENTS.md`, `README.md`, `CATALOGO_ATIVOS.md`, `ROTINA_E_BACKLOG_PORTFOLIO.md` e `KIT_DISTRIBUICAO_MCP.md` com o status real dos 8 Actors e do ShopPulse | IA | ✅ *(25/11/2026)* |

### Fase 1 — Sprint de Tração dos 8 Actors MCP (Dias 2–7 — Zero Código Novo)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-06** | MCP / Apify | Redigir e publicar apresentação da suíte `us-gov-mcp-suite` (8 Actors MCP) no **Discord oficial da Apify (`#showcase`)** | IA (texto) + Usuário (post) | ⬜ |
| **TR-07** | MCP / Reddit | Redigir e publicar post técnico *"Show, Don't Sell"* em **`r/mcp`** destacando o problema resolvido (`outputMode: "mcp_summary"` ~2 KB, zero API keys, 8 fontes oficiais EUA) | IA (texto) + Usuário (post) | ⬜ |
| **TR-08** | MCP / Reddit | Redigir e publicar post prático em **`r/ClaudeAI`** mostrando casos reais prontos (SEC EDGAR XBRL, Tarifas USITC China vs Vietnã vs México, 1099-NEC 2026 e USAspending) | IA (texto) + Usuário (post) | ⬜ |
| **TR-09** | MCP / Diretórios | Submeter `us-gov-mcp-suite` em mais **2 listas/diretórios gratuitos de MCP** no GitHub (`punkpeye/awesome-mcp-servers`, `appcypher/awesome-mcp-servers` ou `wong2/awesome-mcp-servers`) e conferir revisão do `mcpservers.org` | IA (PR/texto) + Usuário | ⬜ |
| **TR-10** | MCP / SEO Dev | Escrever e publicar **1 artigo técnico evergreen no Dev.to** (em inglês) com tutorial passo a passo conectando Claude Desktop / Cursor / n8n aos Actors SEC EDGAR + USITC Tariffs + USAspending | IA (artigo) + Usuário (publicar) | ⬜ |
| **TR-11** | MCP / Automação | Montar **1 workflow template simples em n8n** (JSON pronto) usando 1 Actor de alto apelo (ex.: alerta semanal de recalls openFDA ou eventos 8-K da SEC) e compartilhar em `r/n8n` / n8n Community | IA (template + post) + Usuário | ⬜ |
| **TR-12** | Medição | Executar `/painel-usd` ao final da semana para registrar a evolução de usuários externos e runs nos 8 Actors | IA + Usuário | ⬜ |

### Fase 2 — Sprint de Lançamento do ShopPulse (Disparar Assim que Aprovar na Chrome Web Store)

| ID | Frente | Ação Prática | Responsável | Status |
| :--- | :--- | :--- | :---: | :---: |
| **TR-13** | ShopPulse | Instalar a versão publicada direto da Chrome Web Store em perfil limpo, testar em 2 lojas Shopify e confirmar abertura do checkout Polar.sh (`$15/mês` e `$120/ano`) | Usuário | ⬜ *(Aguardando aprovação TR-01)* |
| **TR-14** | ShopPulse | Cadastrar gratuitamente no **AlternativeTo** (como alternativa leve e privada ao *Koala Inspector* e *PPSPY*) e no **SaaSHub** | IA (textos) + Usuário (cadastro) | ⬜ *(Aguardando aprovação TR-01)* |
| **TR-15** | ShopPulse | Preparar copy, tagline e primeiro comentário e publicar lançamento gratuito no **Product Hunt** | IA (kit PH) + Usuário (publicar) | ⬜ *(Aguardando aprovação TR-01)* |
| **TR-16** | ShopPulse | Fazer **3 a 5 contribuições úteis** (sem spam) em **`r/shopify`, `r/ecommerce` e `r/PPC`** mirando os primeiros **50–100 usuários ativos e 5–10 avaliações 5★** | IA (textos) + Usuário (interação) | ⬜ *(Aguardando aprovação TR-01)* |

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
