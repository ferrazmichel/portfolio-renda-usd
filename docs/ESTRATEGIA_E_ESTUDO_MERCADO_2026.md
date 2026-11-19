# Estratégia e Estudo de Mercado — Portfólio de Renda Online (Novembro/2026)

> Registro consolidado da pesquisa e das decisões estratégicas tomadas em **19/11/2026** para construir uma fonte constante e recorrente de renda em dólar com intervenção humana mínima.

---

## 1. Premissas e Matemática do Objetivo

| Variável | Referência (19/11/2026) |
| :--- | :--- |
| Meta líquida mensal | **R\$ 1.650,00 / mês** (1 salário mínimo) |
| Câmbio comercial de referência | **R\$ 5,88 – R\$ 5,92 / US\$ 1,00** |
| Meta líquida equivalente em dólar | **~US\$ 280 / mês** |
| Meta bruta recomendada (com folga p/ taxas, impostos e infra) | **~US\$ 400 a US\$ 450 / mês** |
| Meta diária média equivalente | **~US\$ 13 a US\$ 15 / dia** |
| Tempo disponível do operador | 1–2 h/dia útil (pesquisa/código/revisão com IA) + blocos maiores em feriados/fins de semana |

### Por que a arbitragem cambial muda o jogo
- No Brasil, um produto de R\$ 20–25/mês precisa de **100 a 130 clientes pagantes** para entregar R\$ 1.650 líquidos.
- Nos EUA, um único utilitário B2B de US\$ 29/mês precisa de **15 clientes**, ou um portfólio de 4 micro-ferramentas somando US\$ 100/mês cada já resolve a meta.
- O custo de software/serviço em dólar é culturalmente aceito por pequenas empresas e consumidores americanos com cartão de crédito na mão, enquanto o custo de vida e infraestrutura técnica do operador permanece em Real (ou em camadas gratuitas na nuvem).

---

## 2. O Que Descartamos Desde o Início (Armadilhas de 2026)

| Modelo Descartado | Motivo Baseado no Cenário de 2026 |
| :--- | :--- |
| **Canais "dark" 100% automatizados no YouTube** | O YouTube reforçou a *Inauthentic Content Policy*, bloqueando monetização de vídeos repetitivos, baseados em templates e narração genérica em massa sem direção editorial humana forte. |
| **Livros em massa no Amazon KDP** | Barreiras de envio diário, exigência de declaração obrigatória de conteúdo gerado por IA e saturação extrema de *low-content* / guias genéricos enterram livros sem tráfego pago ou audiência prévia. |
| **Blogs de artigos informacionais puros (AdSense)** | *Google AI Overviews* e buscas conversacionais absorvem respostas textuais simples (*"o que é"*, *"como funciona"*) na própria página do Google (*zero-click searches*), derrubando o CTR de blogs tradicionais. |
| **Serviços/agências disfarçados de negócio digital** | Reuniões, vendas manuais e prazos de entrega humana violam o requisito de mínima intervenção e escalabilidade assíncrona. |

---

## 3. Comparativo das 5 Trilhas Reais Avaliadas

| Trilha | Canal de Distribuição Embutido | Ticket / Monetização | Esforço de Suporte | Risco / Gargalo Principal |
| :--- | :--- | :--- | :--- | :--- |
| **1. Actors / Ferramentas MCP de Dados Públicos (Apify Store)** | Busca interna da Apify Store + catálogo MCP oficial (`mcp.apify.com`) usado por agentes de IA | Pay-Per-Event (PPE): frações de dólar por registro/chamada (80% split menos custo de plataforma) | Muito baixo (público técnico e agentes de IA) | Quebra se raspar sites com anti-bot — **mitigado** escolhendo APIs oficiais do governo dos EUA |
| **2. Hub de Calculadoras / Ferramentas Interativas EUA (SEO Programático)** | Busca orgânica do Google nos EUA (calculadoras não são substituídas por resumos de IA) | AdSense (início) → **Journey by Mediavine** (5.000 sessões Tier-1/mês) + afiliados | **Zero** (produto estático client-side) | Demora 4 a 8 meses para indexar e ganhar autoridade no Google |
| **3. Extensão Chrome *Read-Only* ou Micro-App Shopify** | Chrome Web Store / Shopify App Store | Assinatura US\$ 9–29/mês (Paddle / Polar.sh / ExtensionPay) | Baixo se *read-only* (médio se editar checkout/tema) | Revisão de loja e mudanças no DOM das plataformas |
| **4. Loja de Planilhas / Sistemas Nichados na Etsy EUA** | Busca nativa da Etsy (compradores já buscando com intenção de compra) | US\$ 14–28 por template (recebimento via Etsy Payments + Payoneer no Brasil) | Muito baixo (com manual PDF + vídeo curto) | Concorrência visual e necessidade de publicar catálogo de 15–25 itens |
| **5. Diretório Hiper-Nichado B2B + Afiliados SaaS** | SEO programático (`Alternativas a X para Y`) | 20–30% recorrente (PartnerStack/Reditus/Impact) + listagens pagas (US\$ 49–149) | Quase zero | Maturação de SEO de 4–8 meses e risco de *thin content* se não houver dados reais |

---

## 4. Por Que Escolhemos os 2 Projetos Pioneiros

O critério definido pelo usuário foi claro: **não priorizar velocidade imediata do 1º dólar, e sim probabilidade de evoluir bem e virar receita constante/recorrente em dólar com baixa intervenção**.

A combinação escolhida equilibra **dois motores independentes** que não dependem do mesmo algoritmo nem da mesma fonte de receita:

### Projeto #1: `us-public-data-actors` (Motor B2B + Economia de Agentes de IA)
1. **Distribuição já resolvida:** A Apify distribui entre **US\$ 1,6M e US\$ 2M/mês** para desenvolvedores e possui infraestrutura nativa de cobrança por evento e exposição MCP para agentes (Claude, Cursor, n8n, LangGraph, CrewAI).
2. **Efeito composto de portfólio:** Um único Actor pode render US\$ 30–150/mês; um portfólio disciplinado de 4 a 6 Actors nichados em dados regulatórios/governamentais dos EUA soma receita contínua sem depender de um único "acerto".
3. **Baixa fragilidade:** Ao usar **APIs oficiais do governo dos EUA** (DOL/OSHA, EPA ECHO, USDOT/FMCSA, openFDA, SEC EDGAR) em vez de raspar redes sociais protegidas por Cloudflare, evita bloqueios constantes e manutenção pesada.
4. **Brecha competitiva verificada (19/11/2026):** Enquanto SAM.gov e NPPES já têm 4–5+ concorrentes consolidados, **OSHA** tinha apenas ~2 Actors visíveis (com 1 marcado como depreciado/em manutenção) e **EPA ECHO** exige orquestração em 2 etapas que poucos empacotam bem para agentes MCP.

### Projeto #2: `us-home-energy-calcs` (Motor Passivo + Ativo Web Próprio nos EUA)
1. **Imune ao *zero-click* da IA:** Ninguém consegue calcular o custo exato de carregar um carro elétrico em casa na Califórnia vs. no Texas, com a própria tarifa em ¢/kWh e quilometragem anual, dentro de um resumo estático do Google.
2. **Público de alto RPM sem necessidade de vender assinatura:** Proprietários de imóveis e compradores de EV/bomba de calor/solar nos EUA atraem anunciantes de alto ticket e geram RPM muito superior ao tráfego geral.
3. **Caminho claro para monetização premium:** O **Journey by Mediavine** (atualizado até 2026) reduziu a barreira de entrada para **5.000 sessões mensais de países Tier-1** e **4 meses de idade do domínio** (com 70% de repasse ao publisher), antes mesmo de precisar atingir o programa principal.
4. **Custo fixo irrisório e manutenção mínima:** Site estático Next.js hospedado gratuitamente na Cloudflare Pages ou Vercel (~US\$ 10–12/ano apenas pelo domínio `.com`), com atualização periódica simples das tarifas oficiais via API da EIA.

---

## 5. Resumo Executivo da Estratégia Conjunta

- **Curto prazo (Meses 1–2):** Colocar o 1º Actor OSHA no ar na Apify Store e colocar o site de calculadoras energéticas no ar com domínio próprio (começando o relógio de 4 meses de maturação de domínio/indexação do Google!).
- **Médio prazo (Meses 3–6):** Expandir `us-public-data-actors` para 3–4 Actors estáveis (OSHA + EPA ECHO + FMCSA/USDOT) e adicionar as calculadoras de **Heat Pump vs. Gas** e **Solar Payback** ao `us-home-energy-calcs` (~150+ páginas estáticas úteis por estado).
- **Médio-longo prazo (Meses 6–10):** Combinar receita recorrente de uso na Apify + anúncios (AdSense → Journey by Mediavine) + afiliados relevantes no site, avaliando então se vale abrir uma das ideias da Fase 2 ([`docs/RADAR_IDEIAS_FASE_2.md`](RADAR_IDEIAS_FASE_2.md)) ou aprofundar os dois vencedores.
