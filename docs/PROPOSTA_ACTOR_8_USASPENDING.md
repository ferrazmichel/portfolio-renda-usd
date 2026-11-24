# Proposta & Especificação — Actor #8: USAspending Federal Contracts & Re-Compete Radar (MCP-Ready)

> Estudo comparativo ao vivo em **24/11/2026** (APIs governamentais reais + concorrência real na Apify Store) e especificação técnica pronta para implementação em `us-public-data-actors/actors/usaspending-federal-contracts-mcp/`.

---

## 1. Matriz Comparativa de Candidatos (Validada Ao Vivo)

| Candidato / Fonte | Teste Ao Vivo da API | Exige API Key? | Concorrência na Apify Store | Líder Atual (Usuários) | Veredito |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **USAspending.gov** (`api.usaspending.gov/api/v2`) | **`200 OK`** | **Não** ✅ | `448` resultados | `41` usuários | **🏆 VENCEDOR #1 (Actor #8)** |
| **Federal Register** (`federalregister.gov/api/v1`) | `200 OK` | Não ✅ | `834` resultados | `17` usuários | Candidato futuro (#9 — alertas regulatórios) |
| **NHTSA Recalls** (`api.nhtsa.gov`) | `200 OK` | Não ✅ | `288` resultados | `27` usuários | Candidato futuro (automotivo/seguros) |
| **SAM.gov / USPTO** | — | SAM exige key c/ expiração | `482` / `206` | `179` / `114` | Alta demanda GovCon, mas SAM trava sem key pessoal |
| **CFPB Complaints** | **`HTTP 403`** ❌ | — | — | — | **Descartado** (WAF bloqueando chamadas diretas) |

### Por Que `USAspending` É Assimetria Clara de Receita
- O mercado **GovCon (Government Contracting)** nos EUA movimenta **US\$ 700B+/ano**. Softwares tradicionais de inteligência de contratos federais (GovWin, Bloomberg Government) custam **US\$ 10.000+/ano**.
- Na Apify Store, o concorrente mais usado para `usaspending` tem apenas **41 usuários** e atua como scraper genérico sem foco em **MCP** nem em **Re-Compete Radar**.
- A API oficial `POST https://api.usaspending.gov/api/v2/search/spending_by_award/` funciona **sem API Key**, sem browser headless e retorna campos ricos (`Award ID`, `Recipient Name`, `Start Date`, `End Date`, `Award Amount`, `Awarding Agency`, `Awarding Sub Agency`, `Description`, `Place of Performance State Code`, `generated_internal_id`).

---

## 2. Diferencial Competitivo ("Re-Compete Radar" + MCP)

Empresas de B2B, consultorias GovCon e times comerciais usam esses dados para responder a 3 perguntas valiosas:
1. **Quais contratos federais no meu nicho/estado estão prestes a vencer (re-compete) nos próximos 6 a 12 meses?**
2. **Quem é o incumbente atual (`Recipient Name`) e quanto o governo está pagando (`Award Amount`)?**
3. **Qual sub-agência específica assinou o contrato?**

O Actor #8 enriquece automaticamente cada registro retornado pela API com:
- `daysUntilExpiration`: dias restantes até `End Date`;
- `recompetePriority`:
  - `URGENT_RECOMPETE` (`0` a `180` dias para vencer)
  - `UPCOMING_RECOMPETE` (`181` a `365` dias)
  - `ACTIVE_LONG_TERM` (`> 365` dias)
  - `EXPIRED` (`< 0` dias)
- `awardUrl`: link oficial direto `https://www.usaspending.gov/award/<generated_internal_id>`
- **Resumo MCP (`OUTPUT` em `outputMode: "mcp_summary"`, < 2 KB):**
  - Total de contratos analisados, soma em USD, ticket médio, top incumbentes, top agências e lista enxuta dos contratos `URGENT_RECOMPETE`.

---

## 3. Especificação Técnica (`actors/usaspending-federal-contracts-mcp/`)

- **Stack:** Python 3.12, Apify SDK (`Actor.push_data` + `Actor.set_value("OUTPUT", ...)`), `httpx`, `pydantic`, `certifi` (idêntica aos Actors #1–#7).
- **Memória padrão:** **`512 MB`** (margem > 90%).
- **Precificação (`PAY_PER_EVENT`):**
  - Evento primário (`contract-award-record`): **`US$ 0,005`** por contrato retornado (`US$ 5,00 / 1.000`).
  - Arranque (`Actor start`): **`US$ 0,001`**.
- **Categorias Apify Store:** `["AI", "AGENTS", "LEAD_GENERATION"]` (e inclusão na vitrine pública `ferrazmichel/us-gov-mcp-suite` → suíte com 8 ferramentas oficiais).
- **Parâmetros de entrada (`input_schema.json`):**
  - `keywords` (`array[string]`): palavras-chave (ex.: `["cybersecurity", "zero trust"]`)
  - `recipientNames` (`array[string]`): filtrar por empresa/incumbente (ex.: `["LOCKHEED MARTIN"]`)
  - `naicsCodes` (`array[string]`): códigos NAICS (ex.: `["541512"]`)
  - `awardingAgency` (`string`): agência contratante (ex.: `"Department of Defense"`)
  - `placeOfPerformanceState` (`string`): estado EUA (ex.: `"VA"`, `"TX"`)
  - `awardType` (`string`): `"contracts"` (A/B/C/D), `"grants"` (02–05) ou `"all"`
  - `minAwardAmountUsd` (`number`): valor mínimo do contrato
  - `startDateFrom` / `endDateTo` (`string`): janela `YYYY-MM-DD`
  - `expiringWithinDays` (`integer | null`): opcional — filtra e ordena contratos prestes a vencer dentro da janela para re-compete
  - `maxRecords` (`integer`, 1–200, padrão `25`)
  - `outputMode` (`string`, `"detailed"` ou `"mcp_summary"`)

---

## 4. Tabela de Atividades (`Actor #8 — USAspending`)

| ID | Etapa | Ação | Status |
| :--- | :--- | :--- | :--- |
| A8-01 | Pesquisa & API | Validar concorrência na Store (`448` / líder `41`) e testar endpoint `api.usaspending.gov/api/v2` ao vivo | ✅ |
| A8-02 | Scaffold & Código | Criar `actors/usaspending-federal-contracts-mcp/` (`src/`, `tests/`, `.actor/`, `Dockerfile`, `README.md` c/ MCP) | ⬜ |
| A8-03 | Testes em Casa | Rodar `pytest` + build na Apify CLI (`512 MB`, `PAY_PER_EVENT`) | ⬜ |
| A8-04 | Publicação | Publicar na Apify Store com categorias + `seoTitle`/`seoDescription` | ⬜ |
| A8-05 | Catálogo & Vitrine | Atualizar `CATALOGO_ATIVOS.md`, `painel-usd`, `monitor_health.py` e `us-gov-mcp-suite` (8 ferramentas) | ⬜ |
