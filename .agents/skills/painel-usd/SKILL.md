---
name: painel-usd
description: >-
  Fetch live portfolio metrics, USD/BRL revenue summary, domain maturation timer, and HTTP uptime
  health checks for portfolio-renda-usd without Python or Node.js. Use when the user invokes
  /painel-usd or asks for portfolio revenue, accumulated earnings, Apify Actor metrics, or system health.
---

# Painel USD (Receitas, Métricas e Saúde do Portfólio)

Consolida em uma única chamada (via PowerShell puro, sem Python ou Node.js):
1. **Receitas acumuladas e P&L** a partir de `portfolio-renda-usd/data/receitas_portfolio.json`, com cotação USD/BRL ao vivo (AwesomeAPI + fallback BCB PTAX) e progresso para saque mínimo Wise / metas.
2. **Métricas ao vivo da Apify Store** (usuários, runs totais e 30d, modelo de cobrança), usando `APIFY_TOKEN` quando configurado em variável de ambiente ou a API pública dos Actors.
3. **Cronômetro de maturação de domínio** (`homeenergycalcs.com` → 120 dias para Journey by Mediavine).
4. **Checagem de saúde e uptime HTTP** dos 17 ativos/APIs (equivalente ao `scripts/monitor_health.py`).

## Modos de Execução

- **`all` (padrão):** executa financeiro + câmbio + domínio + Apify + saúde/uptime completo.
- **`receita`:** apenas financeiro + câmbio + domínio + Apify (mais rápido).
- **`saude`:** apenas checagem HTTP de uptime/latência dos 17 alvos.

Comando:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "$env:USERPROFILE\.gemini\config\skills\painel-usd\scripts\painel_usd.ps1" -Mode <all|receita|saude> -PortfolioPath "<CAMINHO_PORTFOLIO_RENDA_USD>"
```

*(Se `-PortfolioPath` for omitido, o script tenta localizar `portfolio-renda-usd` automaticamente a partir do diretório atual ou de `C:\michel_ferraz\pessoal\repositorios\portfolio-renda-usd`.)*

## Atualização de Receitas Fechadas

A API v2 da Apify expõe métricas de uso/runs e uso de conta, mas o extrato oficial de *Creator Payouts* em USD fica no **Apify Console → Development → Insights → Payouts**. Quando o usuário informar um novo fechamento mensal (Apify, Ads/Mediavine, ShopPulse ou custos), atualize `data/receitas_portfolio.json` (e, se o usuário pedir, reflita em `docs/PAINEL_FINANCEIRO_USD.md`).

## Regras de Segurança

- **Nunca** salve `APIFY_TOKEN`, `POLAR_ACCESS_TOKEN` ou `LEMONSQUEEZY_API_KEY` em arquivos do repositório, logs ou respostas no chat.
- Use exclusivamente variáveis de ambiente do usuário Windows:
  ```powershell
  [Environment]::SetEnvironmentVariable("APIFY_TOKEN", "<SEU_TOKEN>", "User")
  ```

## Formato da Resposta

Responda em **português**, de forma objetiva, resumindo:
- Faturamento bruto/líquido acumulado, custos, lucro líquido (USD e BRL na cotação atual) e quanto falta para o saque mínimo da Wise;
- Maturação do domínio (`homeenergycalcs.com`);
- Métricas ao vivo dos Actors na Apify Store;
- Status geral de saúde/uptime (quando `-Mode all` ou `saude`).

## Instalação no PC de Casa

Após fazer `git pull` em `portfolio-renda-usd`, instale esta skill globalmente executando:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\.agents\skills\painel-usd\scripts\install_global.ps1"
```
