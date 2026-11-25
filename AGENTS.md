# AGENTS.md — Contexto Permanente do Portfólio de Renda Online em Dólar

> **Leia este arquivo antes de propor qualquer nova ação, pesquisa ou projeto neste portfólio.**  
> Última atualização: 25/11/2026.  
> **Guia ativo do ciclo atual (Tração & Distribuição — 21 dias):** [`docs/PLANO_TRACAO_E_PENDENCIAS_NOV_2026.md`](docs/PLANO_TRACAO_E_PENDENCIAS_NOV_2026.md)

---

## 1. Missão, Propósito e Meta Financeira

- **Propósito central:** transformar positivamente a vida do usuário e de sua família e destinar **parte das receitas geradas para doações à caridade**, ajudando quem mais precisa.
- **Objetivo inicial do portfólio:** gerar pelo menos **R\$ 1.650 líquidos/mês** (referência de 1 salário mínimo nacional) trabalhando exclusivamente no computador, com **mínima intervenção humana recorrente** após a construção.
- **Referência cambial (19/11/2026):** dólar comercial ~R\$ 5,90.
  - Meta líquida em dólar: **~US\$ 280/mês**.
  - Meta bruta estimada (cobrindo taxas de plataforma/gateway, remessa cambial, domínio e impostos): **~US\$ 400 a US\$ 450/mês**.
- **Critério prioritário:** **previsibilidade, recorrência/constância e probabilidade real de evolução no longo prazo**, acima da velocidade de receber o primeiro pagamento.

---

## 2. Perfil Operacional e Restrições do Usuário

- **Tempo disponível:**
  - **Dias úteis (trabalho na SEFAZ-ES):** 1 a 2 horas livres por dia (ambiente corporativo com restrições de instalação local — esta máquina Windows corporativa não possui Python, Node.js ou `npm` instalados, e o `gh` CLI está autenticado na conta corporativa `michel-ferraz_sefazes`).
  - **Finais de semana e feriados (casa):** blocos maiores para executar código localmente, testar em runtime, registrar domínios/contas pessoais e fazer `git push` / deploy na conta pessoal **`ferrazmichel`**.
- **Regra rígida de Git/GitHub no trabalho:**
  - **Nunca** usar o `gh` CLI ou tokens corporativos (`michel-ferraz_sefazes`) para criar ou publicar repositórios deste portfólio.
  - Todos os repositórios pessoais devem ter `user.name = ferrazmichel`, `user.email = ferrazmichel@gmail.com` e remote apontando para `https://ferrazmichel@github.com/ferrazmichel/<repo>.git` com `credential.https://github.com.helper` local configurado para `--user ferrazmichel` (mantendo `michel-ferraz_sefazes` como conta ativa global).
  - Skills globais operacionais no Antigravity (Windows PowerShell e macOS/Linux Bash): `/sync-repos` (sincronização multi-PC) e `/painel-usd` (receitas em `data/receitas_portfolio.json`, câmbio, Apify ao vivo e uptime dos 18 alvos).
- **Estilo do negócio desejado:**
  - Produtos digitais 100% *self-service* (sem reuniões de venda, sem atendimento manual em WhatsApp, sem operação artesanal recorrente).
  - Distribuição embutida (marketplaces com busca própria ou SEO programático de cauda longa em inglês), evitando depender de presença em câmera ou tráfego pago desde o dia 1.
- **Conformidade funcional e legal:**
  - Manter todos os projetos 100% desvinculados de temas da administração tributária estadual do ES ou de qualquer recurso/dado interno do trabalho.
  - Antes de escalar faturamento ou abrir estrutura jurídica específica, o usuário deve validar o enquadramento tributário/estatutário compatível com seu cargo público (ex.: recebimento em PF via Carnê-Leão vs. estrutura sem vedação estatutária de gerência societária).

---

## 3. Mapa de Repositórios do Portfólio

| Repositório | Papel | Status | Mercado / Moeda |
| :--- | :--- | :--- | :--- |
| [`portfolio-renda-usd`](../portfolio-renda-usd) | HQ central, tese, plano de tração, pagamentos, radar Fase 2 e rotina | Ativo (Documentação & Monitor) | Global / Estratégia |
| [`us-public-data-actors`](../us-public-data-actors) | **Projeto #1:** Portfólio de Apify Actors + ferramentas MCP com dados públicos oficiais dos EUA | **8 Actors publicados** na Apify Store (PPE `$5/1k`) | B2B Global + Agentes IA (US\$) |
| [`us-gov-mcp-suite`](../us-gov-mcp-suite) | Vitrine pública no GitHub da suíte MCP (8 Actors) para diretórios (`Glama`, `mcpservers.org`, `awesome-remote-mcp-servers`) | **Público** (Glama aprovado ✅) | B2B Global / MCP |
| [`us-home-energy-calcs`](../us-home-energy-calcs) | **Projeto #2:** Hub de calculadoras de energia residencial dos EUA (SEO programático + AdSense/Journey) | **Online** (`homeenergycalcs.com`, 161 URLs, GA4/GSC/Bing) | EUA Residencial (US\$) |
| [`shopify-pixel-catalog-inspector`](../shopify-pixel-catalog-inspector) | **Projeto #4 (`ShopPulse`):** Extensão Chrome MV3 inspetora de lojas Shopify + checkout Polar.sh (`$15/mês`, `$120/ano`) | **Submetida** na Chrome Web Store (reenvio descrição v2 🔄) | Lojistas DTC / Agências EUA (US\$) |
| [`controle_orcamento`](../controle_orcamento) | **Frente paralela pré-existente:** SaaS *FinançasCloud* (orçamento + investimentos) | Paralelo / Avaliar separadamente | Brasil (R\$) |

---

## 4. Divisão de Trabalho (IA vs. Usuário)

- **Postura Consultiva e Propositiva da IA (Diretriz Permanente):**
  - Atuar de forma ativa como sócio estratégico focado em acelerar a geração real de receita em USD.
  - Analisar continuamente os produtos em produção e sugerir proativamente melhorias de distribuição, conversão, SEO, precificação e retenção.
  - Propor novas oportunidades de produto sempre que identificar assimetria clara de retorno em dólar vs. esforço de manutenção.
- **Responsabilidade da IA:**
  - Pesquisa de mercado, lacunas competitivas e fontes de dados oficiais (APIs gratuitas dos EUA).
  - Arquitetura, escrita de código, testes, SEO programático, copywriting em inglês nativo e manutenção de documentação.
  - Evolução contínua do radar de novas ideias ([`docs/RADAR_IDEIAS_FASE_2.md`](docs/RADAR_IDEIAS_FASE_2.md)) sem comprometer o foco nos Projetos #1 e #2.
- **Responsabilidade do Usuário:**
  - Definir prioridades e dar o OK antes de publicar ou gastar dinheiro (domínio, taxas).
  - Abrir contas pessoais (GitHub pessoal, Apify, DOL API Key, EIA API Key, Cloudflare/Vercel, AdSense/Wise/Payoneer).
  - Rodar os testes de ponta a ponta no computador de casa (seguindo os `GUIA_INICIO_FERIADO.md` de cada repo) e reportar o output real para a IA iterar.

---

## 5. Princípios Técnicos para Novos Projetos do Portfólio

1. **Não abrir um 3º projeto ativo** enquanto os Projetos #1 e #2 não tiverem passado pela primeira publicação real e pelo primeiro ciclo de validação em produção.
2. **Validar sempre ponta a ponta** com dados e chamadas reais antes de considerar qualquer rotina autônoma pronta.
3. **Preferir APIs oficiais e arquiteturas estáticas** (baixo custo fixo próximo de zero, baixa quebra, zero servidor 24/7 para administrar manualmente).
4. **Atualizar a tabela de atividades** do `README.md` e de `docs/ROTINA_E_BACKLOG_PORTFOLIO.md` ao concluir marcos importantes.
