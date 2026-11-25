param(
    [ValidateSet('all', 'receita', 'saude')]
    [string]$Mode = 'all',
    [string]$PortfolioPath = ''
)

$ErrorActionPreference = 'Continue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$inv = [System.Globalization.CultureInfo]::InvariantCulture

function Get-EnvSecret {
    param([string]$Name)
    foreach ($scope in @('Process', 'User', 'Machine')) {
        $val = [Environment]::GetEnvironmentVariable($Name, $scope)
        if ($val -and $val.Trim().Length -gt 0) {
            return $val.Trim()
        }
    }
    return ''
}

function Resolve-PortfolioRoot {
    param([string]$Hint)
    $candidates = @()
    if ($Hint -and $Hint.Trim().Length -gt 0) {
        $candidates += $Hint.Trim()
    }
    $cwd = (Get-Location).Path
    $candidates += (Join-Path $cwd 'portfolio-renda-usd')
    $candidates += $cwd
    $parent = Split-Path -Parent $cwd
    if ($parent) {
        $candidates += (Join-Path $parent 'portfolio-renda-usd')
    }
    $candidates += 'C:\michel_ferraz\pessoal\repositorios\portfolio-renda-usd'

    foreach ($cand in $candidates) {
        if ($cand -and (Test-Path -LiteralPath (Join-Path $cand 'data\receitas_portfolio.json'))) {
            return (Resolve-Path -LiteralPath $cand).Path
        }
    }
    return ''
}

function Get-UsdBrlRate {
    try {
        $fx = Invoke-RestMethod -Uri 'https://economia.awesomeapi.com.br/json/last/USD-BRL' -TimeoutSec 10
        if ($fx -and $fx.USDBRL -and $fx.USDBRL.bid) {
            $rate = [double]::Parse([string]$fx.USDBRL.bid, $inv)
            return [PSCustomObject]@{
                Rate   = $rate
                Source = 'AwesomeAPI'
                Date   = [string]$fx.USDBRL.create_date
            }
        }
    } catch {
    }

    try {
        $startStr = (Get-Date).AddDays(-7).ToString('MM-dd-yyyy')
        $endStr = (Get-Date).ToString('MM-dd-yyyy')
        $bcbUrl = "https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarPeriodo(dataInicial=@i,dataFinalCotacao=@f)?@i='$startStr'&@f='$endStr'&`$top=1&`$orderby=dataHoraCotacao%20desc&`$format=json"
        $bcb = Invoke-RestMethod -Uri $bcbUrl -TimeoutSec 10
        if ($bcb -and $bcb.value -and @($bcb.value).Count -gt 0) {
            $item = @($bcb.value)[0]
            $rate = [double]$item.cotacaoVenda
            return [PSCustomObject]@{
                Rate   = $rate
                Source = 'BCB_PTAX'
                Date   = [string]$item.dataHoraCotacao
            }
        }
    } catch {
    }

    return [PSCustomObject]@{
        Rate   = 5.75
        Source = 'FALLBACK'
        Date   = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    }
}

function Invoke-ApifyGet {
    param(
        [string]$Uri,
        [string]$Token
    )
    $headers = @{ 'Accept' = 'application/json' }
    if ($Token) {
        $headers['Authorization'] = "Bearer $Token"
    }
    try {
        $res = Invoke-RestMethod -Uri $Uri -Headers $headers -TimeoutSec 12
        return [PSCustomObject]@{
            Ok         = $true
            StatusCode = 200
            Data       = $res
            Error      = ''
        }
    } catch {
        $code = 0
        if ($_.Exception.Response) {
            try {
                $code = [int]$_.Exception.Response.StatusCode
            } catch {
            }
        }
        return [PSCustomObject]@{
            Ok         = $false
            StatusCode = $code
            Data       = $null
            Error      = $_.Exception.Message
        }
    }
}

function Invoke-HttpProbeOnce {
    param(
        [string]$Url,
        [int[]]$ExpectedCodes,
        [int]$TimeoutMs = 10000
    )
    $req = [System.Net.HttpWebRequest]::Create($Url)
    $req.Method = 'GET'
    $req.Timeout = $TimeoutMs
    $req.ReadWriteTimeout = $TimeoutMs
    $req.UserAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) PortfolioHealthMonitor/1.0'
    $req.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    if (($ExpectedCodes -contains 301) -or ($ExpectedCodes -contains 302)) {
        $req.AllowAutoRedirect = $false
    } else {
        $req.AllowAutoRedirect = $true
    }

    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $statusCode = 0
    $errMsg = ''

    try {
        $resp = [System.Net.HttpWebResponse]$req.GetResponse()
        $statusCode = [int]$resp.StatusCode
        $resp.Close()
    } catch [System.Net.WebException] {
        $webEx = $_.Exception
        if ($webEx.Response) {
            $errResp = [System.Net.HttpWebResponse]$webEx.Response
            $statusCode = [int]$errResp.StatusCode
            $errResp.Close()
        } else {
            $errMsg = $webEx.Message
        }
    } catch {
        $errMsg = $_.Exception.Message
    }

    $sw.Stop()
    $latencyMs = [math]::Round($sw.Elapsed.TotalMilliseconds, 1)
    $healthy = ($ExpectedCodes -contains $statusCode)
    if (-not $healthy -and -not $errMsg) {
        $errMsg = "HTTP $statusCode inesperado (esperado: $($ExpectedCodes -join ','))"
    }

    return [PSCustomObject]@{
        StatusCode = $statusCode
        LatencyMs  = $latencyMs
        IsHealthy  = $healthy
        Error      = $errMsg
    }
}

function Invoke-HttpProbeWithRetry {
    param(
        [string]$Url,
        [int[]]$ExpectedCodes,
        [int]$Retries = 2,
        [int]$DelaySec = 2
    )
    $last = $null
    $attempts = 0
    for ($i = 0; $i -le $Retries; $i++) {
        $attempts = $i + 1
        $last = Invoke-HttpProbeOnce -Url $Url -ExpectedCodes $ExpectedCodes
        if ($last.IsHealthy) {
            break
        }
        if ($i -lt $Retries) {
            Start-Sleep -Seconds $DelaySec
        }
    }
    return [PSCustomObject]@{
        StatusCode = $last.StatusCode
        LatencyMs  = $last.LatencyMs
        IsHealthy  = $last.IsHealthy
        Error      = $last.Error
        Attempts   = $attempts
    }
}

function Fmt2 {
    param([double]$Value)
    return $Value.ToString('F2', $inv)
}

$portfolioRoot = Resolve-PortfolioRoot -Hint $PortfolioPath
if (-not $portfolioRoot) {
    Write-Output 'ERRO: Nao foi possivel localizar portfolio-renda-usd\data\receitas_portfolio.json'
    exit 2
}

$ledgerPath = Join-Path $portfolioRoot 'data\receitas_portfolio.json'
try {
    $ledger = Get-Content -LiteralPath $ledgerPath -Raw -Encoding UTF8 | ConvertFrom-Json
} catch {
    Write-Output "ERRO: Falha ao ler JSON financeiro em $ledgerPath : $($_.Exception.Message)"
    exit 2
}

$criticalHealthFailures = 0
Write-Output "PAINEL_USD mode=$Mode portfolio=$portfolioRoot generated_at=$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss'))"

if ($Mode -eq 'all' -or $Mode -eq 'receita') {
    $fx = Get-UsdBrlRate
    $rate = [double]$fx.Rate

    Write-Output '=== CAMBIO ==='
    Write-Output "usd_brl=$(Fmt2 $rate) | fonte=$($fx.Source) | ref=$($fx.Date)"

    $totApifyBruto = 0.0
    $totApifyLiq = 0.0
    $totAds = 0.0
    $totShop = 0.0
    $totAfil = 0.0
    $totCustos = 0.0
    $totWiseBrl = 0.0
    $mesCount = 0

    foreach ($m in @($ledger.meses)) {
        $mesCount++
        $totApifyBruto += [double]$m.apify_bruto_usd
        $totApifyLiq += [double]$m.apify_liquido_usd
        $totAds += [double]$m.ads_web_usd
        $totShop += [double]$m.shoppulse_usd
        $totAfil += [double]$m.afiliados_usd
        $totCustos += [double]$m.custos_infra_usd
        $totWiseBrl += [double]$m.resgate_wise_brl
    }

    $brutoTotalUsd = $totApifyBruto + $totAds + $totShop + $totAfil
    $liqTotalUsd = $totApifyLiq + $totAds + $totShop + $totAfil
    $lucroLiqUsd = $liqTotalUsd - $totCustos

    $wiseMin = [double]$ledger.metas.wise_min_payout_usd
    $faltaWise = [math]::Max(0.0, $wiseMin - $totApifyLiq)
    $metaMensalLiq = [double]$ledger.metas.marco2_liq_usd
    $pctMeta2 = if ($metaMensalLiq -gt 0) { [math]::Min(100.0, ([math]::Max(0.0, $lucroLiqUsd) / $metaMensalLiq) * 100.0) } else { 0.0 }

    Write-Output '=== RECEITAS_ACUMULADAS (LEDGER) ==='
    Write-Output "meses_registrados=$mesCount | apify_bruto_usd=$(Fmt2 $totApifyBruto) | apify_liquido_usd=$(Fmt2 $totApifyLiq) | ads_web_usd=$(Fmt2 $totAds) | shoppulse_usd=$(Fmt2 $totShop) | afiliados_usd=$(Fmt2 $totAfil)"
    Write-Output "receita_bruta_total_usd=$(Fmt2 $brutoTotalUsd) (BRL $(Fmt2 ($brutoTotalUsd * $rate)))"
    Write-Output "receita_liquida_total_usd=$(Fmt2 $liqTotalUsd) (BRL $(Fmt2 ($liqTotalUsd * $rate)))"
    Write-Output "custos_infra_usd=$(Fmt2 $totCustos) (BRL $(Fmt2 ($totCustos * $rate)))"
    Write-Output "lucro_liquido_usd=$(Fmt2 $lucroLiqUsd) (BRL $(Fmt2 ($lucroLiqUsd * $rate)))"
    Write-Output "resgate_wise_brl=$(Fmt2 $totWiseBrl)"
    Write-Output "saque_minimo_wise_usd=$(Fmt2 $wiseMin) | falta_para_saque_apify_usd=$(Fmt2 $faltaWise)"
    Write-Output "meta_mensal_marco2_liq_usd=$(Fmt2 $metaMensalLiq) | progresso_acumulado_pct=$(Fmt2 $pctMeta2)%"

    $ultimoMes = if ($mesCount -gt 0) { @($ledger.meses)[-1] } else { $null }
    if ($ultimoMes) {
        $mLucro = ([double]$ultimoMes.apify_liquido_usd + [double]$ultimoMes.ads_web_usd + [double]$ultimoMes.shoppulse_usd + [double]$ultimoMes.afiliados_usd) - [double]$ultimoMes.custos_infra_usd
        Write-Output "ultimo_mes=$($ultimoMes.mes) | lucro_mes_usd=$(Fmt2 $mLucro) | obs=$($ultimoMes.observacao)"
    }

    Write-Output '=== DOMINIOS_MATURACAO ==='
    $today = (Get-Date).Date
    foreach ($dom in @($ledger.dominios)) {
        $regDate = [datetime]::ParseExact([string]$dom.registrado_em, 'yyyy-MM-dd', $inv)
        $diasAtivos = [int](($today - $regDate).TotalDays)
        $metaDias = [int]$dom.meta_dias_mediavine
        $restantes = [math]::Max(0, $metaDias - $diasAtivos)
        $qualifDate = $regDate.AddDays($metaDias).ToString('yyyy-MM-dd')
        Write-Output "dominio=$($dom.nome) | registrado_em=$($dom.registrado_em) | dias_ativos=$diasAtivos/$metaDias | faltam_dias=$restantes | qualificacao_prevista=$qualifDate"
    }

    Write-Output '=== APIFY_STORE_AO_VIVO ==='
    $apifyToken = Get-EnvSecret -Name 'APIFY_TOKEN'
    $polarToken = Get-EnvSecret -Name 'POLAR_ACCESS_TOKEN'
    $lemonToken = Get-EnvSecret -Name 'LEMONSQUEEZY_API_KEY'
    $authMode = if ($apifyToken) { 'AUTENTICADO' } else { 'PUBLICO' }
    Write-Output "apify_auth_mode=$authMode | polar_token=$(if ($polarToken) { 'configurado' } else { 'nao_configurado' }) | lemonsqueezy_token=$(if ($lemonToken) { 'configurado' } else { 'nao_configurado' })"

    if ($apifyToken) {
        $usageRes = Invoke-ApifyGet -Uri 'https://api.apify.com/v2/users/me/usage/monthly' -Token $apifyToken
        $limitsRes = Invoke-ApifyGet -Uri 'https://api.apify.com/v2/users/me/limits' -Token $apifyToken
        if ($usageRes.Ok -and $usageRes.Data -and $usageRes.Data.data) {
            $uData = $usageRes.Data.data
            $usdUsed = if ($null -ne $uData.totalUsageCreditsUsdAfterVolumeDiscount) { [double]$uData.totalUsageCreditsUsdAfterVolumeDiscount } elseif ($null -ne $uData.totalUsageCreditsUsdBeforeVolumeDiscount) { [double]$uData.totalUsageCreditsUsdBeforeVolumeDiscount } else { 0.0 }
            $maxUsd = if ($limitsRes.Ok -and $limitsRes.Data -and $limitsRes.Data.data -and $limitsRes.Data.data.limits -and $null -ne $limitsRes.Data.data.limits.maxMonthlyUsageUsd) { [double]$limitsRes.Data.data.limits.maxMonthlyUsageUsd } else { 0.0 }
            Write-Output "conta_apify_uso_mensal_usd=$(Fmt2 $usdUsed) | limite_mensal_usd=$(Fmt2 $maxUsd)"
        }
    }

    $actorIds = @()
    if ($apifyToken) {
        $listRes = Invoke-ApifyGet -Uri 'https://api.apify.com/v2/acts?my=true&limit=100' -Token $apifyToken
        if ($listRes.Ok -and $listRes.Data -and $listRes.Data.data -and $listRes.Data.data.items) {
            foreach ($it in @($listRes.Data.data.items)) {
                $actorIds += [PSCustomObject]@{ Label = $it.name; QueryId = $it.id }
            }
        }
    }

    if ($actorIds.Count -eq 0) {
        $apifyUser = [string]$ledger.apify_username
        foreach ($slug in @($ledger.apify_actors_fallback)) {
            $actorIds += [PSCustomObject]@{ Label = $slug; QueryId = "$apifyUser~$slug" }
        }
    }

    $sumUsersTotal = 0
    $sumUsers30d = 0
    $sumRunsTotal = 0
    $sumRuns30d = 0
    $sumSucceeded30d = 0
    $publicActors = 0
    $privateOrUnpub = 0

    foreach ($target in $actorIds) {
        $actRes = Invoke-ApifyGet -Uri "https://api.apify.com/v2/acts/$($target.QueryId)" -Token $apifyToken
        if (-not $actRes.Ok) {
            if ($actRes.StatusCode -eq 404) {
                $privateOrUnpub++
                Write-Output "actor=$($target.Label) | status=PRIVADO_OU_NAO_PUBLICADO (HTTP 404 sem APIFY_TOKEN)"
            } else {
                Write-Output "actor=$($target.Label) | status=ERRO_API (HTTP $($actRes.StatusCode): $($actRes.Error))"
            }
            continue
        }

        $d = $actRes.Data.data
        $isPub = [bool]$d.isPublic
        if ($isPub) { $publicActors++ } else { $privateOrUnpub++ }

        $pricingModel = 'FREE'
        $pricingList = @($d.pricingInfos)
        if ($pricingList.Count -gt 0) {
            $latestP = $pricingList[$pricingList.Count - 1]
            if ($latestP.pricingModel) { $pricingModel = [string]$latestP.pricingModel }
        }

        $st = $d.stats
        $uTot = if ($st -and $null -ne $st.totalUsers) { [int]$st.totalUsers } else { 0 }
        $u30 = if ($st -and $null -ne $st.totalUsers30Days) { [int]$st.totalUsers30Days } else { 0 }
        $rTot = if ($st -and $null -ne $st.totalRuns) { [int]$st.totalRuns } else { 0 }
        $r30Tot = if ($st -and $st.publicActorRunStats30Days -and $null -ne $st.publicActorRunStats30Days.TOTAL) { [int]$st.publicActorRunStats30Days.TOTAL } else { 0 }
        $r30Ok = if ($st -and $st.publicActorRunStats30Days -and $null -ne $st.publicActorRunStats30Days.SUCCEEDED) { [int]$st.publicActorRunStats30Days.SUCCEEDED } else { 0 }
        $bkm = if ($st -and $null -ne $st.bookmarkCount) { [int]$st.bookmarkCount } else { 0 }
        $lastRun = if ($st -and $st.lastRunStartedAt) { [string]$st.lastRunStartedAt } else { '-' }

        $sumUsersTotal += $uTot
        $sumUsers30d += $u30
        $sumRunsTotal += $rTot
        $sumRuns30d += $r30Tot
        $sumSucceeded30d += $r30Ok

        Write-Output "actor=$($d.name) | publico=$isPub | pricing=$pricingModel | users_total=$uTot | users_30d=$u30 | runs_total=$rTot | runs_30d=$r30Ok/$r30Tot | bookmarks=$bkm | last_run=$lastRun"
    }

    Write-Output "apify_totais: actors_publicos=$publicActors priv_ou_nao_pub=$privateOrUnpub users_total=$sumUsersTotal users_30d=$sumUsers30d runs_total=$sumRunsTotal runs_30d_ok=$sumSucceeded30d/$sumRuns30d"
    Write-Output 'nota_apify_payouts: API v2 nao expoe extrato fechado de Creator Payouts em USD; confira Apify Console > Development > Insights > Payouts e registre em data/receitas_portfolio.json'
}

if ($Mode -eq 'all' -or $Mode -eq 'saude') {
    Write-Output '=== SAUDE_UPTIME ==='
    $targets = @(
        @{ Category = 'Portal Web'; Name = 'HomeEnergyCalcs Root /'; Url = 'https://homeenergycalcs.com/'; Expected = @(200); Critical = $true },
        @{ Category = 'Portal Web'; Name = 'EV Charging (Texas)'; Url = 'https://homeenergycalcs.com/ev-charging-cost/texas'; Expected = @(200); Critical = $true },
        @{ Category = 'Portal Web'; Name = 'Heat Pump (Ohio)'; Url = 'https://homeenergycalcs.com/heat-pump-vs-gas/ohio'; Expected = @(200); Critical = $true },
        @{ Category = 'Portal Web'; Name = 'Solar Payback (Arizona)'; Url = 'https://homeenergycalcs.com/solar-payback/arizona'; Expected = @(200); Critical = $true },
        @{ Category = 'Portal Web'; Name = 'Sitemap XML'; Url = 'https://homeenergycalcs.com/sitemap.xml'; Expected = @(200); Critical = $true },
        @{ Category = 'Portal Web'; Name = 'Redirect WWW (301)'; Url = 'https://www.homeenergycalcs.com/'; Expected = @(301); Critical = $false },
        @{ Category = 'Apify Store'; Name = 'Actor #1 OSHA'; Url = 'https://apify.com/ferraz_michel/osha-safety-compliance-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #2 EPA ECHO'; Url = 'https://apify.com/ferraz_michel/epa-echo-environmental-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #3 FMCSA'; Url = 'https://apify.com/ferraz_michel/fmcsa-carrier-safety-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #4 USITC HTS'; Url = 'https://apify.com/ferraz_michel/usitc-hts-tariff-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #5 US 1099-NEC'; Url = 'https://apify.com/ferraz_michel/us-1099-nec-state-compliance-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #6 openFDA'; Url = 'https://apify.com/ferraz_michel/openfda-recall-device-radar'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #7 SEC EDGAR'; Url = 'https://apify.com/ferraz_michel/sec-edgar-filings-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'Apify Store'; Name = 'Actor #8 USAspending'; Url = 'https://apify.com/ferraz_michel/usaspending-federal-contracts-mcp'; Expected = @(200); Critical = $true },
        @{ Category = 'APIs Gov EUA'; Name = 'US EPA ECHO REST'; Url = 'https://echodata.epa.gov/echo/echo_rest_services.get_facilities?output=JSON&p_st=TX'; Expected = @(200); Critical = $false },
        @{ Category = 'APIs Gov EUA'; Name = 'US FDA openFDA'; Url = 'https://api.fda.gov/device/enforcement.json?limit=1'; Expected = @(200); Critical = $false },
        @{ Category = 'APIs Gov EUA'; Name = 'USITC HTS REST'; Url = 'https://hts.usitc.gov/reststop/search?keyword=8507.60'; Expected = @(200); Critical = $false },
        @{ Category = 'APIs Gov EUA'; Name = 'US DOL API Gateway'; Url = 'https://apiprod.dol.gov/v4/get/OSHA/inspection/json?limit=1'; Expected = @(200, 401); Critical = $false }
    )

    $healthyCount = 0
    $totalTargets = $targets.Count

    foreach ($t in $targets) {
        $probe = Invoke-HttpProbeWithRetry -Url $t.Url -ExpectedCodes $t.Expected
        if ($probe.IsHealthy) {
            $healthyCount++
            $badge = if ($probe.LatencyMs -ge 1000) { 'LENTO' } else { 'ONLINE' }
            $retryInfo = if ($probe.Attempts -gt 1) { " (tentativas=$($probe.Attempts))" } else { '' }
            Write-Output "[$badge] $($t.Category) | $($t.Name) | HTTP $($probe.StatusCode) | $($probe.LatencyMs) ms$retryInfo"
        } else {
            if ($t.Critical) { $criticalHealthFailures++ }
            Write-Output "[FALHA] $($t.Category) | $($t.Name) | HTTP $($probe.StatusCode) | $($probe.LatencyMs) ms | critical=$($t.Critical) | err=$($probe.Error)"
        }
    }

    Write-Output "saude_resumo: saudaveis=$healthyCount/$totalTargets falhas_criticas=$criticalHealthFailures"
}

if ($criticalHealthFailures -gt 0) {
    exit 2
}
exit 0
