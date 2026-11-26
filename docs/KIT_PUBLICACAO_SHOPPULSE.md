# Kit de Publicação — ShopPulse (Projeto #4 / Chrome Web Store + Polar.sh)

> Material completo pronto para copiar e colar em casa (~25–30 minutos) para publicar a extensão **ShopPulse — Shopify Pixel, App & Catalog Inspector** na Chrome Web Store e ativar a monetização **Pro (`US$ 15/mês`)**.

---

## 1. Checklist de Execução em Casa (~25–30 min)

1. **Sincronizar workspace:** abrir o Antigravity em casa e rodar `/sync-repos` (para puxar este guia em `portfolio-renda-usd` e as atualizações de `shopify-pixel-catalog-inspector`).
2. **Rodar testes locais em `shopify-pixel-catalog-inspector`:**
   ```bash
   npm test
   ```
3. **Testar localmente no Chrome (~5 min):**
   - Abrir `chrome://extensions` → ativar **Modo do desenvolvedor** (*Developer mode*) → **Carregar sem compactação** (*Load unpacked*) apontando para a pasta `shopify-pixel-catalog-inspector`.
   - Testar em 2–3 lojas Shopify públicas dos EUA (ex.: `https://www.allbirds.com`, `https://www.gymshark.com`, `https://www.brooklinen.com`).
   - Confirmar que detecta tema, pixels/IDs, apps, catálogo `/products.json` e exporta CSV.
4. **Capturar 3 screenshots (`1280×800 px` ou `640×400 px`)** durante esse teste (ver Seção 5).
5. **Configurar o checkout Pro na Polar.sh (~10 min)** (ver Seção 6) e colar os 3 campos gerados (`checkoutMonthlyUrl`, `checkoutAnnualUrl`, `polarOrganizationId`) em `src/billingConfig.mjs` dentro de `shopify-pixel-catalog-inspector`.
6. **Gerar o `.zip` final atualizado:**
   - Windows PowerShell: `powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\build_extension.ps1"`
   - macOS / Linux: `python3 scripts/build_extension.py`
7. **Criar conta Developer na Chrome Web Store (`US$ 5` taxa única):**
   - Acessar: https://chrome.google.com/webstore/devconsole
   - Subir `dist/shopify-pixel-catalog-inspector-v1.0.0.zip`, colar os textos das Seções 2 e 3, informar a URL da Política de Privacidade já publicada (`https://ferrazmichel.github.io/shoppulse-docs/privacy.html`), anexar os screenshots e enviar para revisão.

---

## 2. Textos Prontos da Loja — Chrome Web Store (`Store Listing`)

- **Name** *(50 / 75 caracteres)*:
  ```text
  ShopPulse — Shopify Pixel, App & Catalog Inspector
  ```

- **Short Summary** *(128 / 132 caracteres)*:
  ```text
  Inspect any Shopify store in one click: see its theme, marketing pixels, installed apps, and catalog stats, then export to CSV.
  ```

- **Category:** `Workflow & Planning` *(alternativa: `Developer Tools`)*
- **Language:** `English (United States)`

- **Detailed Description** *(copiar e colar inteiro — versão v2 corrigida após rejeição "Yellow Argon / Keyword Spam" de 25/11/2026)*:

  > [!WARNING]
  > **Não listar nomes de marcas em sequência** (pixels, apps). A 1ª submissão foi rejeitada por *keyword stuffing* exatamente pelas listas de 12 pixels e 11 apps. Descreva **categorias**, não marcas.

  ```text
  ShopPulse is a lightweight, read-only Chrome extension that helps e-commerce founders, marketers, and agencies understand how any Shopify storefront is set up — in one click.

  WHAT YOU GET
  • Store overview: see the store's permanent Shopify domain, active theme, currency, country, and whether it shows signs of running on Shopify Plus.
  • Marketing pixel check: see which advertising and analytics pixels are active on the page, along with their public tracking IDs.
  • Installed app detection: see which categories of apps the store uses, such as product reviews, subscriptions, upsells, loyalty programs, SMS marketing, and customer support.
  • Catalog and pricing summary: get the product count, price range, top vendors, and product types from the store's public product feed.
  • Export: download the public product catalog as a CSV or JSON file for your own research.

  PRIVACY FIRST
  • Runs only when you click the extension icon, and only on the tab you are viewing.
  • Uses minimal permissions and does not request access to all websites.
  • No background tracking, no analytics, and no remote code. All processing happens in your browser.

  FREE AND PRO
  • Free: unlimited store inspections and CSV export of up to 25 products.
  • Pro ($15/month or $120/year): unlimited CSV exports and full JSON exports, activated with a license key.
  ```

---

## 3. Aba `Privacy Practices` (Crítico para Aprovar na 1ª Tentativa)

O Google Chrome Web Store revisa rigorosamente extensões Manifest V3. Use exatamente estas respostas:

- **Single Purpose Description:**
  ```text
  Inspects the active browser tab on demand to detect public Shopify storefront metadata (theme, installed apps, marketing pixel IDs, and public /products.json catalog items) and export results to CSV or JSON locally.
  ```

- **Permission Justifications:**
  - **`activeTab`:**
    ```text
    Required so the extension only accesses the current active tab at the exact moment the user clicks the ShopPulse icon to inspect whether the visited site is a Shopify storefront. Avoids requesting broad host permissions across all websites.
    ```
  - **`scripting`:**
    ```text
    Required to inject a short, self-contained read-only inspection script into the active tab when triggered by the user, in order to read public DOM scripts, window.Shopify metadata, and public /products.json data directly inside the browser.
    ```
  - **`storage`:**
    ```text
    Required exclusively to persist user preferences and an optional ShopPulse Pro license key locally using chrome.storage.local.
    ```

- **Remote Code:**
  - Marcar: **`No, I am not using Remote code`** *(todo o JavaScript/HTML/CSS está empacotado dentro do `.zip`, conforme Manifest V3).*

- **Data Usage Disclosures:**
  - Marcar a certificação de que **não coleta, vende nem transfere** dados pessoais, histórico de navegação ou dados financeiros dos usuários para terceiros.

---

## 4. Política de Privacidade Pública (Já Hospedada no GitHub Pages)

- **URL oficial para colar na Chrome Web Store:** `https://ferrazmichel.github.io/shoppulse-docs/privacy.html`
- **Mini landing page / página de suporte:** `https://ferrazmichel.github.io/shoppulse-docs/`
- **Repositório público de origem:** `https://github.com/ferrazmichel/shoppulse-docs`

*(O texto completo abaixo já está publicado em `privacy.html` para consulta rápida.)*

```markdown
# Privacy Policy — ShopPulse (Shopify Pixel, App & Catalog Inspector)

**Last updated:** November 23, 2026  
**Contact:** ferrazmichel@gmail.com

## 1. Overview
ShopPulse is a read-only Chrome Extension designed to inspect publicly available storefront metadata on Shopify websites (such as theme information, marketing pixel IDs, installed app scripts, and public `/products.json` catalog feeds) strictly when initiated by the user.

## 2. Data Collection and Processing
- **No Personal Data Collected:** ShopPulse does not collect, store, sell, or transmit personally identifiable information (PII), browsing history, authentication credentials, or payment details.
- **100% Local Processing:** All storefront inspection, pixel detection, and CSV/JSON export generation happen locally inside your browser when you click the extension icon.
- **Local Storage Only:** User preferences and optional ShopPulse Pro license keys are stored locally in your browser via `chrome.storage.local` and are never shared with third-party analytics or ad networks.

## 3. Permissions Used
- `activeTab`: Grants temporary access only to the currently active tab when you explicitly click the extension.
- `scripting`: Executes a local read-only DOM/metadata inspection script inside the active tab on demand.
- `storage`: Saves local extension settings and optional license state on your device.

## 4. Third-Party Services
ShopPulse does not include third-party analytics trackers or remote code. If you choose to purchase a ShopPulse Pro license via our payment provider (Polar.sh / Merchant of Record), payment processing is governed by that provider's privacy policy.

## 5. Contact
For privacy questions or support, contact: **ferrazmichel@gmail.com**.
```

---

## 5. Guia Rápido de Imagens da Loja

- **Screenshots obrigatórios (mínimo 1, recomendado 3 — `1280×800 px` PNG/JPEG sem transparência):**
  1. **Print 1 (Visão Geral + Pixels):** Popup do ShopPulse aberto sobre uma loja Shopify famosa (ex.: `allbirds.com`) mostrando o domínio `.myshopify.com`, tema e os IDs de Pixels detectados (Meta, GA4, GTM, Klaviyo).
  2. **Print 2 (Apps Detectados):** Aba/seção de apps instalados detectados com badges limpos.
  3. **Print 3 (Analisador de Catálogo + Exportação CSV):** Resumo do `/products.json` (total de produtos, faixa de preços e botão de exportar CSV).
- **Small Promo Tile (opcional, mas recomendado para destaque na busca):** `440×280 px` (pode gerar usando o ícone do ShopPulse + título curto *"1-Click Shopify Pixel, App & Catalog Inspector"*).

---

## 6. Guia Rápido Polar.sh (Checkout **ShopPulse Pro — `US$ 15/mês`**)

A **Polar.sh** atua como *Merchant of Record* (cuida de impostos/VAT globais automaticamente e faz payout em USD para conta no Brasil / Wise).

1. Criar conta em https://polar.sh com `ferrazmichel@gmail.com` e conectar conta de recebimento (Stripe Express / Wise conforme disponibilidade da conta BR).
2. Criar organização/produto: **`ShopPulse Pro`**.
3. Criar 2 planos (preços):
   - **Mensal:** **`$15 / month`**
   - **Anual (ancoragem):** **`$120 / year`** *(equivalente a `$10/mês` — aumenta o caixa imediato)*
4. Ativar o benefício **License Keys** no produto com prefixo **`SPPRO-`**.
5. Copiar os **Checkout Links** (mensal e anual) e o **Organization ID** da Polar.sh e colar em `shopify-pixel-catalog-inspector/src/billingConfig.mjs` (`checkoutMonthlyUrl`, `checkoutAnnualUrl`, `polarOrganizationId`) antes de gerar o `.zip` final.

---

## 7. Plano de Tração e Divulgação Pós-Aprovação (Primeiros 100 Usuários → Assinantes Pro)

> [!IMPORTANT]
> **Lembrete para a IA:** assim que o usuário confirmar a aprovação na Chrome Web Store, lembrar proativamente destas 4 ações e já entregar os textos prontos em inglês para cada canal.

1. **Ação 1 — AlternativeTo & SaaSHub (capturar quem busca concorrentes caros no Google):**
   - Cadastrar o **ShopPulse** gratuitamente no **AlternativeTo** e **SaaSHub** posicionando-o como alternativa mais leve, privada (sem `<all_urls>`) e mais barata ao **Koala Inspector** e **PPSPY** (`US$ 19–49/mês`).
2. **Ação 2 — Lançamento no Product Hunt (pico inicial + backlink):**
   - Submissão simples com foco em privacidade Manifest V3 + *1-click pixel, app & CSV inspector* — gera instalações iniciais e ajuda a página da Chrome Web Store a ranquear no Google.
3. **Ação 3 — Comunidades Reddit / Shopify (`r/shopify`, `r/ecommerce`, `r/dropship`, `r/PPC` — sem spam):**
   - Responder dúvidas reais de lojistas/media buyers sobre detecção de temas, apps e pixels, oferecendo a versão gratuita (sem login nem cartão) para conquistar os **primeiros 50–100 usuários ativos e 5–10 avaliações 5 estrelas** (principal gatilho de ranqueamento orgânico na busca da Chrome Web Store).
4. **Ação 4 — Otimização contínua de conversão Free → Pro:**
   - Acompanhar a conversão do limite de 25 linhas no CSV para o plano Pro (`US$ 15/mês` / `US$ 120/ano`) na Polar.sh (meta inicial: 2%–5% dos ativos) e iterar copy e recursos conforme feedback real.

---

## 8. Tabela de Atividades (`ShopPulse`)

| ID | Etapa | Ação | Status |
| :--- | :--- | :--- | :--- |
| SP-01 | Código & Build | Extensão MV3 + build `.zip` v1.0.0 prontos no PC de casa | ✅ |
| SP-02 | Kit de Lançamento | Textos Chrome Web Store, justificativas MV3, Política de Privacidade e guia Polar.sh | ✅ |
| SP-03 | GitHub (Casa) | Subir `shopify-pixel-catalog-inspector` para repo privado `ferrazmichel` | ✅ |
| SP-04 | Teste Local & Prints | Testar em `chrome://extensions` e capturar 3 screenshots `1280×800` | ✅ |
| SP-05 | Pagamentos | Criar produto `ShopPulse Pro` (`$15/mês`, chave `SPPRO-`) na Polar.sh e linkar na extensão | ✅ |
| SP-06 | Publicação | Pagar taxa única de `$5`, publicar Política de Privacidade e enviar `.zip` na Chrome Web Store | ✅ *(Publicada em 25/11/2026: [Chrome Web Store](https://chromewebstore.google.com/detail/shoppulse-shopify-pixel-a/nbmgmembajfhfnebbedfddjdoeimknad))* |
| SP-07 | Divulgação Pós-Aprovação | Cadastrar ShopPulse no `AlternativeTo` (alternativa a Koala Inspector / PPSPY) e `SaaSHub` | ✅ *(26/11/2026 — submetido no AlternativeTo e no SaaSHub)* |
| SP-08 | Divulgação Pós-Aprovação | Preparar textos e publicar lançamento gratuito no `Product Hunt` | ⬜ |
| SP-09 | Divulgação Pós-Aprovação | Fazer 3–5 contribuições úteis (sem spam) em `r/shopify`, `r/ecommerce`, `r/PPC` para primeiros 50–100 usuários e 5–10 reviews | ⬜ |
| SP-10 | Otimização ASO/Pro | Revisar ranking na Chrome Web Store e taxa de conversão Free → Pro após 30 dias | ⬜ |
