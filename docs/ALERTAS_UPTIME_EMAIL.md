# Alertas Gratuitos de Uptime por E-mail

> Sistema automatizado 24/7 para avisar imediatamente por e-mail caso o portal `homeenergycalcs.com` ou os Actors na Apify Store fiquem indisponíveis.

---

## Camada 1 (Já Ativa) — GitHub Actions 24/7 na Nuvem

O workflow [`.github/workflows/uptime-monitor.yml`](../.github/workflows/uptime-monitor.yml) executa o script [`scripts/monitor_health.py`](../scripts/monitor_health.py) diretamente nos servidores gratuitos do GitHub, sem depender do seu Mac ligado.

- **Frequência:** A cada **6 horas** (`00:00`, `06:00`, `12:00`, `18:00 UTC`) + botão manual de disparo imediato.
- **Custo:** **US$ 0,00** (consome ~15 minutos/mês da cota gratuita mensal de 2.000 minutos do GitHub Actions).
- **Proteção contra falsos positivos:** Cada endpoint crítico passa por até **3 tentativas** (1 inicial + 2 retentativas com intervalo de 2 segundos) antes de ser considerado fora do ar.
- **Serviços Críticos Monitorados:**
  1. `https://homeenergycalcs.com/` (`HTTP 200`)
  2. `https://homeenergycalcs.com/ev-charging-cost/texas` (`HTTP 200`)
  3. `https://homeenergycalcs.com/heat-pump-vs-gas/ohio` (`HTTP 200`)
  4. `https://homeenergycalcs.com/sitemap.xml` (`HTTP 200`)
  5. `https://apify.com/ferraz_michel/osha-safety-compliance-mcp` (`HTTP 200`)
  6. `https://apify.com/ferraz_michel/epa-echo-environmental-mcp` (`HTTP 200`)
  7. `https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp` (`HTTP 200`)
- **Como funciona o alerta no seu e-mail:**
  - Sempre que qualquer serviço crítico falhar após as retentativas, o workflow termina com status `Failed`.
  - O GitHub envia automaticamente um **e-mail de alerta para `ferrazmichel@gmail.com`** com o link direto da execução e a tabela de diagnóstico apontando exatamente qual URL falhou.

### Como testar manualmente agora no GitHub:
1. Acesse [`github.com/ferrazmichel/portfolio-renda-usd/actions`](https://github.com/ferrazmichel/portfolio-renda-usd/actions).
2. No menu esquerdo, clique em **Uptime & Health Monitor**.
3. Clique em **Run workflow → Run workflow** e acompanhe o selo verde aparecer em ~15 segundos.

*(Certifique-se em **GitHub → Settings → Notifications → Actions** de que a opção **"Send notifications for failed workflows only"** esteja marcada — já é o padrão da maioria das contas).*

---

## Camada 2 (Opcional) — Checagem a cada 5 minutos com UptimeRobot Free

Se no futuro você quiser um intervalo ainda menor (a cada 5 minutos em vez de 6 horas), basta criar uma conta gratuita em **[uptimerobot.com](https://uptimerobot.com)** (plano Free permite até 50 monitores gratuitos de 5 em 5 minutos) e cadastrar os 3 endpoints principais:

| Nome do Monitor | Tipo | URL | Intervalo |
| :--- | :--- | :--- | :--- |
| `HomeEnergyCalcs - Home` | HTTPS | `https://homeenergycalcs.com/` | 5 minutos |
| `Apify Actor #1 - OSHA` | HTTPS | `https://apify.com/ferraz_michel/osha-safety-compliance-mcp` | 5 minutos |
| `Apify Actor #2 - EPA` | HTTPS | `https://apify.com/ferraz_michel/epa-echo-environmental-mcp` | 5 minutos |
| `Apify Actor #3 - FMCSA` | HTTPS | `https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp` | 5 minutos |

Em **Alert Contacts**, mantenha o e-mail `ferrazmichel@gmail.com` marcado.

