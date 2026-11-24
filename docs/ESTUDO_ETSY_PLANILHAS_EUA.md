# Estudo de Viabilidade & Plano de Lançamento — Loja de Planilhas B2B/1099 na Etsy EUA

> Análise estratégica da **Ideia A (Fase 2)** para vendedores no Brasil via **Etsy Payments + Payoneer**: sub-nichos de menor concorrência e maior ticket médio (`US$ 24–$39`), estrutura real de taxas e arquitetura de entrega com suporte quase zero.

---

## 1. Por Que Esta Janela (Nov/2026 → Abr/2027) É Ouro

1. **Pico sazonal máximo nos EUA:** entre o fim de novembro e 15 de abril (prazo federal do IRS), ocorre a maior demanda anual na Etsy por termos como *"2026 Schedule C bookkeeping"*, *"1099-NEC tracker"*, *"2027 small business spreadsheet"* e *"quarterly tax estimator"*.
2. **Diferencial regulatório que já dominamos:** em 2026 o teto federal do Form 1099-NEC subiu de `US$ 600` para **`US$ 2.000`**, enquanto estados-chave mantiveram tetos menores (`US$ 600–$1.200`). Como já implementamos essa matriz de 51 jurisdições no Actor #5 (`us-1099-nec-state-compliance-mcp`), nossas planilhas saem **atualizadas para 2026/2027**, deixando para trás templates antigos da concorrência.
3. **Vantagem técnica no Antigravity:** temos o plugin oficial **`gsheets`** conectado — conseguimos gerar, formatar, inserir fórmulas e montar dashboards profissionais **diretamente no seu Google Sheets** em uma fração do tempo manual.

---

## 2. Regras, Taxas e Margem Real (Brasil → EUA via Payoneer)

- **Recebimento obrigatório:** vendedores no Brasil utilizam **Etsy Payments + conta Payoneer** conectada (saque em USD convertido para conta bancária brasileira).
- **Custos da plataforma:**
  - Taxa única de abertura de loja (aplicada no onboarding conforme avaliação regional, tipicamente `US$ 15–$29`).
  - **Listing fee:** `US$ 0.20` por publicação (4 meses) e por renovação automática após cada venda.
  - **Transaction fee:** `6,5%` sobre o valor total da venda.
  - **Processamento Etsy Payments + câmbio Payoneer:** ~`4%–6%` + ~`2,5%` na conversão USD → BRL.
- **Por que fugir de planilhas genéricas de `US$ 3–$8`:** taxas fixas comem margem e atraem compradores que exigem muito suporte. Em **nichos B2B de `US$ 24–$39`**:
  - Venda de **`US$ 24.00`**: após `$0.20` + `6,5%` (`$1.56`) + processamento/Payoneer (~`7,7%`, `$1.86`) → sobram **~`US$ 20.38` líquidos (~85% de margem)**.
  - **Matemática prática:** **15 a 20 vendas/mês** a `US$ 24–$29` já geram **~`US$ 300 a US$ 450` líquidos/mês** com estoque infinito e custo marginal zero.

---

## 3. Top 5 Sub-Nichos B2B (Menor Concorrência × Maior Ticket)

*(Prioridade de lançamento: **#1 → #2 → #3**.)*

| Rank | Produto / Sub-Nicho | Ticket Alvo (Ancorado) | Público Comprador (EUA) | Por Que Converte Sem Briga de Preço |
| :--- | :--- | :--- | :--- | :--- |
| **#1** | **2026–2027 US 1099-NEC & Schedule C Contractor Tax Suite** | **`US$ 24`** *(de `US$ 39`)* | Autônomos, freelancers, consultores LLC single-member | Mapeia categorias exatas das linhas do **IRS Schedule C**, calcula imposto trimestral **1040-ES**, controla W-9 / retenção de 24%, milhagem IRS e regra 2026 dos 51 estados (`$2,000` vs estadual). |
| **#2** | **Cleaning Business Command Center (Quotes, Schedule & Crew)** | **`US$ 29`** *(de `US$ 49`)* | Donos de empresas de limpeza residencial/comercial nos EUA | Em vez de planilha genérica, une **precificação por nº de quartos/banheiros**, agenda recorrente de clientes, repasse da equipe 1099 e P&L pronto para Schedule C. |
| **#3** | **HVAC / Electrical / Handyman Job Costing & Estimate Suite** | **`US$ 34–$39`** *(de `US$ 59`)* | Eletricistas, HVAC, encanadores, empreiteiros | Um orçamento errado faz o prestador perder `US$ 2.000+` numa obra. Inclui markup de materiais, horas de equipe + overhead, *Estimated vs. Actual* e log de *Change Orders*. |
| **#4** | **Shopify & TikTok Shop Profit, ROAS & Landed Cost Tracker** | **`US$ 24–$29`** *(de `US$ 45`)* | Lojistas DTC / dropshippers EUA | Sinergia direta com **ShopPulse** e **Actor #4 (HTS)**: controla COGS, frete, tarifas alfandegárias, taxas Shopify/TikTok/Stripe, ad spend e lucro líquido real por SKU. |
| **#5** | **Airbnb / Short-Term Rental Co-Host & Schedule E Tracker** | **`US$ 24–$34`** *(de `US$ 49`)* | Anfitriões e co-hosts nos EUA | Separa receita por imóvel, comissão de co-host, taxa de limpeza, manutenção e consolida categorias do **IRS Schedule E**. |

> **Tática de conversão comprovada na Etsy:** cadastrar o preço cheio ancorado (`$39` / `$49` / `$59`) e rodar promoção contínua de 35%–40% (`$24` / `$29` / `$35`) — estimula senso de oportunidade mantendo ticket líquido alto.

---

## 4. Arquitetura de Entrega com Suporte Quase Zero

1. **Google Sheets mestre protegido:**
   - Aba 1: **`START HERE`** com passo a passo ilustrado, vídeo curto sem rosto (60–90s no Loom/YouTube não-listado) e aviso de células com fórmulas travadas (*Protected ranges* com alerta).
   - Aba 2: **`Settings / Tax & Categories`** centralizando ano, alíquotas e listas suspensas.
   - Dados de exemplo pré-preenchidos para o dashboard já abrir bonito no primeiro segundo (e botão/instrução clara de onde apagar apenas os dados de entrada).
2. **Link *Force Copy* (`/copy`):**
   - Compartilhar a planilha mestre como *"Anyone with the link can **view**"*.
   - Trocar `/edit?...` por **`/copy`** no final da URL (`https://docs.google.com/spreadsheets/d/<ID>/copy`) — garante que cada comprador crie sua própria cópia isolada sem nunca pedir permissão nem estragar o original.
3. **PDF de Entrega Automático (upload na Etsy):**
   - 1 página limpa em PDF (gerada via Canva/Docs/HTML→PDF) com botão de destaque *"CLICK HERE TO MAKE YOUR COPY"* apontando para o link `/copy`, instruções de 3 passos e e-mail de suporte (`ferrazmichel@gmail.com`).
4. **Mockups & SEO Etsy (fator decisivo de clique):**
   - **Thumbnails `2000×2000` / `4:3`:** foto/render de laptop + tablet mostrando gráficos do dashboard real, selo *"Google Sheets • Instant Download • 2026/2027 Ready"* e 3 callouts curtos (*"IRS Schedule C Mapped"*, *"1099-NEC $2k Rule"*, *"Auto P&L Dashboard"*).
   - **13 tags completas por anúncio** com cauda longa de intenção de compra (ex.: `schedule c spreadsheet`, `1099 tracker 2026`, `small business bookkeeping`, `contractor tax sheet`, `google sheets template`, `self employed tracker`, `profit and loss sheet`, `quarterly tax calc`, etc.).
   - **Upsell opcional no PDF:** *"Want this customized with your logo & state tax rates? Email ferrazmichel@gmail.com"* (abre porta para serviços de `US$ 100–$200` sem depender de marketing).

---

## 5. Tabela de Atividades (`Etsy Planilhas EUA`)

| ID | Etapa | Ação | Status |
| :--- | :--- | :--- | :--- |
| ET-01 | Pesquisa & Estratégia | Mapear taxas Brasil/Payoneer, top 5 sub-nichos B2B e arquitetura `/copy` | ✅ |
| ET-02 | Conta & Pagamentos (Casa) | Abrir/validar conta **Payoneer** + loja Etsy (conectar Etsy Payments e avaliar taxa de abertura) | ⬜ |
| ET-03 | Produto #1 (via `gsheets`) | Construir e testar no Google Sheets o **2026–2027 US 1099-NEC & Schedule C Suite** | ⬜ |
| ET-04 | Empacotamento | Gerar link `/copy` (teste anônimo), PDF de entrega, 5–7 mockups e vídeo walkthrough 60–90s | ⬜ |
| ET-05 | Publicação #1 | Publicar Produto #1 na Etsy (`$24` em promo de `$39`, 13 tags SEO completas) | ⬜ |
| ET-06 | Produto #2 | Construir e publicar **Cleaning Business Command Center** (`$29`) | ⬜ |
| ET-07 | Produto #3 | Construir e publicar **HVAC / Electrical / Handyman Job Costing Suite** (`$34–$39`) | ⬜ |
