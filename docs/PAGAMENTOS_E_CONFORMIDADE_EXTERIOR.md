# Recebimento do Exterior, Taxas e Conformidade (Brasil — Nov/2026)

> Guia de referência prática para receber pagamentos em dólar morando no Brasil. **Nota:** informações operacionais consolidadas em 19/11/2026; recomenda-se sempre conferir termos atualizados de cada plataforma e validar o enquadramento fiscal/estatutário com contador antes de escalar receitas.

---

## 1. Canais de Recebimento dos Projetos Ativos

### Projeto #1 (`us-public-data-actors` — Apify Store)
- **Modelo de repasse:** Pay-Per-Event (PPE) / Pay-Per-Result.
- **Comissão da Apify:** **20%** sobre a receita bruta do Actor.
- **Dedução de infraestrutura:** custos de plataforma (computação, proxies se houver, armazenamento) são descontados da parcela do criador:
  - Fórmula de referência: `Repasse = (0,80 × Receita Bruta) − Custos de Plataforma`
  - Para Actors que consomem APIs públicas governamentais leves (sem navegador headless pesado), o custo de plataforma costuma ser uma fração pequena da receita.
- **Calendário de pagamento:** faturas mensais geradas por volta do dia 11 de cada mês.
- **Como sacar para o Brasil:** **Wise** (mínimo de saque **US\$ 20**) ou PayPal (mínimo US\$ 20) ou transferência bancária (mínimo US\$ 100). **Wise** costuma entregar o melhor câmbio líquido para conta brasileira.

### Projeto #2 (`us-home-energy-calcs` — Publicidade e Afiliados)
1. **Fase Inicial — Google AdSense:**
   - Suporta editores residentes no Brasil normalmente, com pagamento em dólar via remessa internacional (SWIFT/bancos ou plataformas cambiais compatíveis com AdSense Brasil).
   - Mínimo de pagamento padrão: **US\$ 100**.
2. **Fase de Escala — Journey by Mediavine (foco em tráfego dos EUA):**
   - **Requisitos verificados em 2026:** mínimo de **5.000 sessões/mês** vindas de países qualificados Tier-1 (**EUA, Reino Unido, Canadá, Austrália, Alemanha, França ou Países Baixos**) + **domínio com pelo menos 4 meses de idade** + conta conectada no **Google Analytics 4 (GA4)** (`mediavine.com/apply`).
   - O antigo requisito obrigatório de rodar o script *Grow* por 30 dias passou a ser opcional (embora recomendado).
   - **Repasse:** **70%** da receita de anúncios (*revenue share*).
   - **Evolução:** ao atingir cerca de **US\$ 5.000/ano** em receita de anúncios, o site se qualifica para graduar para o programa principal da Mediavine (RPM e repasse maiores).
3. **Camada Extra — Afiliados:**
   - **Amazon Associates (EUA):** comissões em carregadores EV Level 2 e monitores de energia residencial; exige atenção às regras de linkagem e pagamento internacional (Payoneer/Wise com conta bancária americana virtual, conforme suporte do programa).

---

## 2. Plataformas para Projetos Futuros (Fase 2)

| Caso de Uso | Plataforma Recomendada (2026) | Observações para Residentes no Brasil |
| :--- | :--- | :--- |
| **SaaS, Web Apps e Extensões Chrome (Global ou BR)** | **Paddle** ou **Polar.sh** | Ambos atuam como *Merchant of Record* (cuidam de VAT/Sales Tax nos EUA/Europa). **Paddle** suporta **Pix e Pix Automático** para clientes no BR e saca por wire/Payoneer. **Polar.sh** usa **Stripe Connect Express**, cobra 5% + US\$ 0,50 no plano inicial e saca sob demanda (janela de 7 dias). |
| **Templates digitais / Planilhas na Etsy EUA** | **Etsy Payments + Payoneer** | Liberado oficialmente para o Brasil. Repasses semanais em US\$ para a conta Payoneer, com saque para banco brasileiro. |
| **O QUE EVITAR em 2026** | **Lemon Squeezy** | Após aquisição pela Stripe, entrou em processo de encerramento (*wind-down*), e a alternativa *Stripe Managed Payments* não atende entidades locais no Brasil. Não iniciar projetos novos nela. |

---

## 3. Pontos de Atenção Tributária e Estatutária (Servidor Público)

1. **Imposto de Renda sobre rendimentos do exterior (Pessoa Física):**
   - Recebimentos do exterior em CPF estão sujeitos à tributação mensal obrigatória (**Carnê-Leão Web** na Receita Federal) conforme tabela progressiva vigente, ou regras específicas se estruturados em PJ. Não deixar acumular meses sem apuração.
2. **Estatuto do Servidor Público Estadual (SEFAZ-ES):**
   - Regimes estatutários em geral **permitem** receitas de direitos autorais, software/conteúdo digital próprio ou participação como sócio **cotista não administrador**, mas **vedam** exercer gerência/administração de sociedade privada (inclusive MEI costuma ser vedado ou incompatível com estatutos estaduais por caracterizar empresário individual/administração).
   - **Recomendação prática:** confirmar no estatuto dos servidores do ES (LC 46/1994 e normas internas da SEFAZ-ES) antes de abrir qualquer CNPJ; no início, operando em PF, manter todos os temas dos projetos **100% fora de tributação estadual / operações de fiscalização do ES** (ex.: dados ambientais/trabalhistas dos EUA e calculadoras de energia residencial dos EUA não possuem qualquer interseção com o cargo).
3. **Separação total de infraestrutura:**
   - Nunca guardar tokens pessoais, chaves de API de projetos pessoais ou repositórios de negócio em máquinas ou contas da instituição. Usar a máquina do trabalho apenas no tempo livre permitido e para leitura/pesquisa/edição em conta pessoal segregada, realizando testes de produção e transações financeiras em equipamento pessoal.
