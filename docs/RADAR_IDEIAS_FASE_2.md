# Radar de Ideias — Fase 2 e Pesquisa Paralela

> Este documento preserva todas as oportunidades levantadas em **19/11/2026** que **não foram escolhidas para o arranque inicial** apenas para manter foco e disciplina nos Projetos #1 e #2. A IA pode aprofundar pesquisas aqui em paralelo durante os blocos do dia útil.

---

## Regra de Ouro de Foco
**Não criar código nem contas novas para ideias deste radar** até que:
1. O Projeto #1 (`us-public-data-actors`) tenha pelo menos **2 Actors publicados e testados** na Apify Store; e
2. O Projeto #2 (`us-home-energy-calcs`) esteja **publicado em domínio `.com` próprio**, indexado no Google Search Console e com as rotas dos 50 estados + DC no ar.

---

## Ideia A — Loja de Planilhas & Sistemas Operacionais Nichados na Etsy EUA

- **Mudança chave confirmada (2026):** A Etsy passou a aceitar oficialmente vendedores do **Brasil** via **Etsy Payments + Payoneer** (payouts em dólar transferíveis para conta bancária brasileira).
- **Por que funciona:** Pequenas empresas e prestadores autônomos nos EUA buscam planilhas em Google Sheets / Excel na Etsy para fugir de assinaturas caras (QuickBooks/CRMs de US\$ 50–100/mês).
- **Sub-nichos com menor competição e maior ticket (US\$ 14 a US\$ 28):**
  - Controle de receitas, despesas, deduções e reserva de imposto trimestral **1099 / Schedule C** por profissão específica (serviços de limpeza, fotógrafos de casamento, criadores UGC / TikTok Shop, co-hosts de Airbnb, pequenas propriedades rurais/*homestead*).
  - Pacotes de SOPs (manuais de operação) e onboarding em Canva/Sheets para pequenos prestadores locais.
- **Matemática:** ~22 a 25 vendas/mês a US\$ 19 já cobrem os ~US\$ 400–450 brutos.
- **Como reduzir suporte quase a zero:** Empacotar cada planilha com manual PDF ilustrado e vídeo curto de 3 minutos sem rosto (Loom/tela) mostrando passo a passo como usar.
- **Próxima pesquisa paralela da IA:** Validar concorrência real de palavras-chave na Etsy (ex.: *cleaning business bookkeeping google sheet*, *1099 contractor tracker 2026*, *tiktok shop profit tracker*).

---

## Ideia B — Extensão Chrome *Read-Only* para Lojistas Shopify dos EUA

- **Por que evitar apps embarcados na Shopify App Store no início:** App Store exige revisão rígida de OAuth, webhooks e UI Polaris. Uma **extensão Chrome focada em operações** roda no navegador, sem tocar no checkout da loja.
- **Conceitos de suporte quase zero:**
  1. **Competitor Pixel & Catalog Inspector:** Ao navegar por qualquer loja Shopify, detecta pixels ativos (Meta, TikTok, Pinterest, GA4), lista os últimos produtos adicionados via JSON público (`collections/all.json`) e exporta catálogo/preços para CSV.
  2. **Bulk Metafield / Tag Quick-Helper:** Painel lateral dentro do Shopify Admin para agilizar edição repetitiva de metafields/tags (usando credencial do próprio lojista ou manipulação controlada).
- **Matemática:** 30 a 40 assinantes a US\$ 12–15/mês (ou ~25 agências a US\$ 19/mês).
- **Infraestrutura recomendada no Brasil:** Chrome Web Store (US\$ 5 taxa única) + **Polar.sh** ou **Paddle** ou **ExtensionPay**.
- **Próxima pesquisa paralela da IA:** Verificar quais concorrentes existem hoje na Chrome Web Store (ex.: Koala Inspector, PPSPY) e qual lacuna de preço/simplicidade para pequenos lojistas DTC foi deixada aberta.

---

## Ideia C — Diretório Hiper-Nichado B2B com SEO Programático + Afiliados SaaS

- **Por que tem excelente margem:** Você não vende nem suporta software próprio — monetiza conectando compradores B2B a softwares recorrentes.
- **Fontes de receita empilhadas:**
  1. **Afiliados recorrentes B2B** (PartnerStack, Reditus, Impact): muitos SaaS pagam **20% a 30% de comissão todo mês** enquanto o cliente permanecer assinante.
  2. **Envios pagos / Destaque na listagem:** Fundadores de micro-SaaS pagam US\$ 49–199 por publicação rápida ou destaque para ganhar backlinks e tráfego qualificado.
- **Formatos que evitam punição do Google:** Comparadores baseados em dados reais e verificáveis (preços por faixa de uso, integrações nativas, limites gratuitos, matrizes de recursos) em nichos específicos (ex.: *compliance tools for US remote teams*, *AI medical scribes*, *open-banking / fintech APIs*).
- **Próxima pesquisa paralela da IA:** Levantar 5 programas de afiliados SaaS B2B recorrentes abertos a criadores no Brasil com maior LTV e baixa concorrência de termos `X alternatives for Y`.

---

## Ideia D — Micro-Utilitários Regulatórios dos EUA (Dores Quentes de 2026)

Dois nichos detectados na pesquisa de dores de pequenas empresas americanas em 2026 que podem virar **micro-sites independentes** ou **ferramentas freemium** (gratuito no navegador + exportação/histórico pago por US\$ 15–19 via Paddle/Polar):

1. **US Tariff & Landed Cost Calculator (API USITC HTS + Capítulo 99):**
   - A USITC oferece API JSON pública sem autenticação (`https://hts.usitc.gov/reststop/api/details/htsnoJSON/{CODE}`).
   - A lacuna real é que a API base não soma de forma amigável tarifas adicionais do **Capítulo 99 (Section 301 / 232)**, taxas alfandegárias **MPF (0,3464%)** e **HMF (0,125%)** nem compara custo por país de origem (China vs. Vietnã vs. México).
   - Páginas programáticas por código HTS (`HTS Code XXXX.XX.XXXX Duty & Landed Cost`) capturam importadores e lojistas Shopify/Amazon com alta intenção comercial.

2. **US 1099-NEC \$2,000 Threshold & State Rules Tracker:**
   - Em 2026 o teto federal do 1099-NEC subiu de US\$ 600 para **US\$ 2.000**, mas diversos estados americanos mantiveram limites e prazos divergentes — criando armadilha de retenção obrigatória (*24% backup withholding*) para quem esquece de pedir o W-9 cedo.
   - Um utilitário simples + mapa estadual gratuito atrai PMEs e contadores dos EUA (podendo ser monetizado por anúncios B2B de altíssimo CPC ou exportação em lote/CSV).

---

## Ideia E — Frente Paralela Existente: `controle_orcamento` (*FinançasCloud*)

- Repositório já avançado em [`../controle_orcamento`](../controle_orcamento), com estudo próprio em [`PLANO_NEGOCIOS_FINANCASCLOUD.md`](../controle_orcamento/docs/PLANO_NEGOCIOS_FINANCASCLOUD.md).
- Diferença estratégica em relação aos Projetos #1 e #2: atua no Brasil em Reais (B2C) e requer maior volume de usuários (~110–130 assinantes) e divulgação ativa para atingir R\$ 1.650 líquidos/mês.
- Recomendação: mantê-lo como projeto independente de mercado brasileiro, sem competir por tempo com o arranque dos dois projetos em dólar nos primeiros 60–90 dias.

---

## Tabela de Atividades (Pesquisas Paralelas da IA)

| Pesquisa / Estudo | Objetivo | Status |
| :--- | :--- | :--- |
| Mapear palavras-chave e concorrência na Etsy EUA (Ideia A) | Identificar 10 sub-nichos de planilhas B2B/1099 com menor oferta e ticket ≥ US\$ 15 | ⬜ |
| Auditar concorrentes da Chrome Web Store p/ Shopify (Ideia B) | Verificar reclamações em reviews 1–3 estrelas de extensões atuais | ⬜ |
| Mapear top programas PartnerStack/Reditus abertos ao Brasil (Ideia C) | Avaliar comissão recorrente e termos de busca sem gigantes | ⬜ |
| Avaliar viabilidade de dados do Capítulo 99 na API USITC HTS (Ideia D1) | Conferir estrutura atual de tarifas adicionais 2026 para eventual Projeto #3 | ⬜ |
