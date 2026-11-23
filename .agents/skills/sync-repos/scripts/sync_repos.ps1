param(
    [ValidateSet('pull', 'check')]
    [string]$Mode = 'pull',
    [string]$RootPath = (Get-Location).Path
)

$ErrorActionPreference = 'Continue'

function Invoke-Git {
    param(
        [string]$RepoPath,
        [string[]]$GitArgs
    )
    $raw = & git -C $RepoPath @GitArgs 2>&1
    $code = $LASTEXITCODE
    $lines = @()
    foreach ($item in $raw) {
        $text = "$item"
        if ($null -ne $text) {
            $lines += $text
        }
    }
    return [PSCustomObject]@{
        ExitCode = $code
        Output   = $lines
    }
}

function Get-RepoStatusCounts {
    param(
        [string]$RepoPath,
        [string]$Upstream
    )
    $ahead = 0
    $behind = 0
    if ($Upstream) {
        $countsRes = Invoke-Git -RepoPath $RepoPath -GitArgs @('rev-list', '--left-right', '--count', "HEAD...$Upstream")
        if ($countsRes.ExitCode -eq 0 -and $countsRes.Output.Count -gt 0) {
            $parts = ($countsRes.Output[0].Trim() -split '\s+')
            if ($parts.Count -ge 2) {
                $ahead = [int]$parts[0]
                $behind = [int]$parts[1]
            }
        }
    }
    return [PSCustomObject]@{
        Ahead  = $ahead
        Behind = $behind
    }
}

try {
    $resolvedRoot = (Resolve-Path -LiteralPath $RootPath -ErrorAction Stop).Path
} catch {
    Write-Output "ERRO: Caminho raiz nao encontrado: $RootPath"
    exit 1
}

$repos = @()
$subdirs = Get-ChildItem -LiteralPath $resolvedRoot -Directory -ErrorAction SilentlyContinue | Sort-Object Name
foreach ($dir in $subdirs) {
    if (Test-Path -LiteralPath (Join-Path $dir.FullName '.git')) {
        $repos += $dir.FullName
    }
}

if ($repos.Count -eq 0 -and (Test-Path -LiteralPath (Join-Path $resolvedRoot '.git'))) {
    $repos += $resolvedRoot
}

if ($repos.Count -eq 0) {
    Write-Output "AVISO: Nenhum repositorio Git encontrado em: $resolvedRoot"
    exit 1
}

$total = $repos.Count
$okOrUpdated = 0
$skippedOrPending = 0
$errorCount = 0

Write-Output "MODE=$Mode ROOT=$resolvedRoot REPOS=$total"

foreach ($repoPath in $repos) {
    $name = Split-Path -Leaf $repoPath

    $branchRes = Invoke-Git -RepoPath $repoPath -GitArgs @('rev-parse', '--abbrev-ref', 'HEAD')
    $branch = if ($branchRes.ExitCode -eq 0 -and $branchRes.Output.Count -gt 0) { $branchRes.Output[0].Trim() } else { '(desconhecida)' }

    $upRes = Invoke-Git -RepoPath $repoPath -GitArgs @('rev-parse', '--abbrev-ref', '--symbolic-full-name', '@{u}')
    $upstream = if ($upRes.ExitCode -eq 0 -and $upRes.Output.Count -gt 0) { $upRes.Output[0].Trim() } else { '' }

    $porcelainRes = Invoke-Git -RepoPath $repoPath -GitArgs @('status', '--porcelain')
    $dirtyLines = @($porcelainRes.Output | Where-Object { $_.Trim().Length -gt 0 })
    $dirtyCount = $dirtyLines.Count

    $stashRes = Invoke-Git -RepoPath $repoPath -GitArgs @('stash', 'list')
    $stashLines = @($stashRes.Output | Where-Object { $_.Trim().Length -gt 0 })
    $stashCount = $stashLines.Count

    $beforeRes = Invoke-Git -RepoPath $repoPath -GitArgs @('rev-parse', '--short', 'HEAD')
    $beforeHash = if ($beforeRes.ExitCode -eq 0 -and $beforeRes.Output.Count -gt 0) { $beforeRes.Output[0].Trim() } else { '' }

    $statusText = ''
    $details = @()

    if ($Mode -eq 'pull') {
        if ($dirtyCount -gt 0) {
            $fetchRes = Invoke-Git -RepoPath $repoPath -GitArgs @('fetch', '--prune')
            $statusText = "PULADO (alteracoes locais: $dirtyCount)"
            $skippedOrPending++
            foreach ($line in $dirtyLines) {
                $details += "  dirty: $line"
            }
            if ($fetchRes.ExitCode -ne 0) {
                $statusText = "$statusText | erro_fetch"
                $errorCount++
                foreach ($line in $fetchRes.Output) {
                    $details += "  fetch_err: $line"
                }
            }
        } else {
            $pullRes = Invoke-Git -RepoPath $repoPath -GitArgs @('pull', '--ff-only')
            if ($pullRes.ExitCode -ne 0) {
                $statusText = 'ERRO_PULL'
                $errorCount++
                foreach ($line in $pullRes.Output) {
                    $details += "  pull_err: $line"
                }
            } else {
                $afterRes = Invoke-Git -RepoPath $repoPath -GitArgs @('rev-parse', '--short', 'HEAD')
                $afterHash = if ($afterRes.ExitCode -eq 0 -and $afterRes.Output.Count -gt 0) { $afterRes.Output[0].Trim() } else { '' }
                if ($beforeHash -and $afterHash -and ($afterHash -ne $beforeHash)) {
                    $statusText = "ATUALIZADO ($beforeHash..$afterHash)"
                } else {
                    $statusText = 'JA_ATUALIZADO'
                }
                $okOrUpdated++
            }
        }
    } else {
        $fetchFailed = $false
        $fetchRes = Invoke-Git -RepoPath $repoPath -GitArgs @('fetch', '--prune')
        if ($fetchRes.ExitCode -ne 0) {
            $fetchFailed = $true
            $errorCount++
            foreach ($line in $fetchRes.Output) {
                $details += "  fetch_err: $line"
            }
        }

        $countsPre = Get-RepoStatusCounts -RepoPath $repoPath -Upstream $upstream
        $pendencias = @()
        if ($dirtyCount -gt 0) {
            $pendencias += "alteracoes_nao_commitadas=$dirtyCount"
            foreach ($line in $dirtyLines) {
                $details += "  dirty: $line"
            }
        }
        if ($countsPre.Ahead -gt 0) {
            $pendencias += "commits_sem_push=$($countsPre.Ahead)"
        }
        if ($countsPre.Behind -gt 0) {
            $pendencias += "commits_para_pull=$($countsPre.Behind)"
        }
        if ($stashCount -gt 0) {
            $pendencias += "stashes=$stashCount"
        }
        if (-not $upstream) {
            $pendencias += 'sem_upstream'
        }
        if ($fetchFailed) {
            $pendencias += 'erro_fetch'
        }

        if ($pendencias.Count -eq 0) {
            $statusText = 'OK'
            $okOrUpdated++
        } else {
            $statusText = "PENDENTE ($($pendencias -join ', '))"
            $skippedOrPending++
        }
    }

    $countsPost = Get-RepoStatusCounts -RepoPath $repoPath -Upstream $upstream
    $logRes = Invoke-Git -RepoPath $repoPath -GitArgs @('log', '-1', '--oneline')
    $lastCommit = if ($logRes.ExitCode -eq 0 -and $logRes.Output.Count -gt 0) { $logRes.Output[0].Trim() } else { '(sem commits)' }

    Write-Output "=== $name ==="
    Write-Output "branch: $branch | upstream: $(if ($upstream) { $upstream } else { '(nenhum)' })"
    Write-Output "status: $statusText"
    Write-Output "ahead: $($countsPost.Ahead) | behind: $($countsPost.Behind) | stashes: $stashCount"
    Write-Output "commit: $lastCommit"
    foreach ($d in $details) {
        Write-Output $d
    }
}

Write-Output "=== RESUMO ==="
if ($Mode -eq 'pull') {
    Write-Output "total=$total atualizados_ou_em_dia=$okOrUpdated pulados=$skippedOrPending erros=$errorCount"
} else {
    Write-Output "total=$total ok=$okOrUpdated pendentes=$skippedOrPending erros=$errorCount"
}

if ($errorCount -gt 0) {
    exit 2
}
exit 0
