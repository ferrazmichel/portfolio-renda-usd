# Kit de Publicação — ShopPulse (Projeto #4 / Chrome Web Store + Polar.sh)

> Material completo pronto para copiar e colar em casa (~25–30 minutos) para publicar a extensão **ShopPulse — Shopify Pixel, App & Catalog Inspector** na Chrome Web Store e ativar a monetização **Pro (`US$ 15/mês`)**.

---

## 1. Checklist de Execução em Casa (~25–30 min)

1. **Sincronizar workspace:** abrir o Antigravity em casa e rodar `/sync-repos` (para puxar este guia em `portfolio-renda-usd`).
2. **Versionar o repositório da extensão (recomendado):**
   - Na pasta `shopify-pixel-catalog-inspector`, conferir o `git status` e subir para um repositório **privado** na sua conta pessoal **`ferrazmichel`** no GitHub (assim o `/sync-repos` passa a sincronizar o Projeto #4 entre casa e trabalho também).
3. **Testar localmente no Chrome (~5 min):**
   - Abrir `chrome://extensions` → ativar **Modo do desenvolvedor** (*Developer mode*) → **Carregar sem compactação** (*Load unpacked*) apontando para a pasta da extensão.
   - Testar em 2–3 lojas Shopify públicas dos EUA (ex.: `https://www.allbirds.com`, `https://www.gymshark.com`, `https://www.brooklinen.com`).
   - Confirmar que detecta tema, pixels/IDs, apps, catálogo `/products.json` e exporta CSV.
4. **Capturar 3 screenshots (`1280×800 px` ou `640×400 px`)** durante esse teste (ver Seção 5).
5. **Configurar o checkout Pro na Polar.sh (~10 min)** (ver Seção 6) para já ter o link de compra e as chaves `SPPRO-` funcionando antes da publicação.
6. **Criar conta Developer na Chrome Web Store (`US$ 5` taxa única):**
   - Acessar: https://chrome.google.com/webstore/devconsole
   - Subir `dist/shopify-pixel-catalog-inspector-v1.0.0.zip`, colar os textos das Seções 2, 3 e 4, anexar os screenshots e enviar para revisão.

---

## 2. Textos Prontos da Loja — Chrome Web Store (`Store Listing`)

- **Name** *(50 / 75 caracteres)*:
  ```text
  ShopPulse — Shopify Pixel, App & Catalog Inspector
  ```

- **Short Summary** *(128 / 132 caracteres)*:
  ```text
  Inspect any Shopify store in 1 click: detect 12 ad pixels & IDs, 20+ apps, theme, Shopify Plus signals & export products to CSV.
  ```

- **Category:** `Workflow & Planning` *(alternativa: `Developer Tools`)*
- **Language:** `English (United States)`

- **Detailed Description** *(copiar e colar inteiro)*:
  ```text
  ShopPulse is a lightweight, read-only Chrome Extension (Manifest V3) built for e-commerce founders, DTC marketers, media buyers, and Shopify agencies to audit any Shopify storefront in one click.

  WHAT SHOPPULSE INSPECTS INSTANTLY:
  • Store & Platform Identity: Detects permanent *.myshopify.com domain, active Shopify theme name & ID, currency, country, and Shopify Plus signals.
  • 12 Ad Pixels & Attribution IDs: Extracts active tracking IDs for Meta (Facebook) Pixel, TikTok Pixel, Google Analytics 4 (GA4), Google Tag Manager (GTM), Pinterest Tag, Snapchat Pixel, Microsoft Clarity, Klaviyo, Triple Whale, Northbeam, Elevar, and Postscript.
  • 20+ Installed Shopify Apps: Identifies popular review, subscription, upsell, loyalty, SMS, helpdesk, and search apps (Judge.me, Loox, Yotpo, Recharge, Klaviyo, Gorgias, Attentive, Privy, Smile.io, Shogun, Rebuy, and more).
  • Live Catalog & Pricing Analyzer: Reads the storefront's public /products.json feed to summarize product count, price range (min/avg/max), top vendors, and product types.
  • 1-Click CSV & JSON Export: Export clean product catalog data (title, handle, vendor, product type, SKU, price, compare-at price, availability, tags, URL) directly to CSV or JSON.

  BUILT FOR SPEED & PRIVACY:
  • 100% client-side execution — runs only when you click the extension icon on the active tab.
  • Minimal permissions (activeTab, scripting, storage) with zero broad <all_urls> host access.
  • Zero background tracking, zero external telemetry, and zero remote code execution.

  FREE vs. PRO:
  • Free Plan: Unlimited store inspections (theme, pixels, IDs, apps, catalog summary) + CSV catalog export up to 25 product rows.
  • ShopPulse Pro ($15/month): Unlocks unlimited product catalog CSV exports and full structured JSON exports via license key (SPPRO-XXXX-XXXX-XXXX).
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

## 4. Política de Privacidade Pronta (`PRIVACY_POLICY.md`)

A Chrome Web Store exige uma URL pública de Política de Privacidade.

### Opção rápida e gratuita para hospedar em 2 minutos
1. Criar uma página `/shoppulse-privacy` em um site seu já publicado (ou habilitar GitHub Pages em um repo público mínimo de docs, ex.: `ferrazmichel/shoppulse-docs`, apontando para o arquivo abaixo).
2. Usar o texto completo abaixo em inglês:

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
4. Ativar o benefício **License Keys** no produto com prefixo **`SPPRO-`** (compatível com o formato `SPPRO-XXXX-XXXX-XXXX` esperado na extensão).
5. Copiar o **Checkout Link** da Polar.sh e conferir se o botão *"Upgrade to Pro"* da extensão aponta para esse link antes de gerar o `.zip` final para a Chrome Web Store.

---

## 7. Tabela de Atividades (`ShopPulse`)

| ID | Etapa | Ação | Status |
| :--- | :--- | :--- | :--- |
| SP-01 | Código & Build | Extensão MV3 + build `.zip` v1.0.0 prontos no PC de casa | ✅ |
| SP-02 | Kit de Lançamento | Textos Chrome Web Store, justificativas MV3, Política de Privacidade e guia Polar.sh | ✅ |
| SP-03 | GitHub (Casa) | Subir `shopify-pixel-catalog-inspector` para repo privado `ferrazmichel` | ⬜ |
| SP-04 | Teste Local & Prints | Testar em `chrome://extensions` e capturar 3 screenshots `1280×800` | ⬜ |
| SP-05 | Pagamentos | Criar produto `ShopPulse Pro` (`$15/mês`, chave `SPPRO-`) na Polar.sh e linkar na extensão | ⬜ |
| SP-06 | Publicação | Pagar taxa única de `$5`, publicar Política de Privacidade e enviar `.zip` na Chrome Web Store | ⬜ |
