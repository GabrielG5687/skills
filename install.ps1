[CmdletBinding()]
param(
    [ValidateSet('opencode', 'cursor', 'both')]
    [string]$Client = 'both',

    [string]$Destination,

    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot
$skills = @(Get-ChildItem -LiteralPath $repoRoot -Directory |
    Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') })

if ($skills.Count -eq 0) {
    throw "Nenhuma skill encontrada em $repoRoot"
}

function Resolve-Targets {
    param([string]$Client)

    $targets = @()
    $opencodeRoot = Join-Path $HOME '.config\opencode'
    $cursorRoot = Join-Path $HOME '.cursor'

    if ($Client -eq 'opencode' -or $Client -eq 'both') {
        if (Test-Path -LiteralPath $opencodeRoot) {
            $targets += Join-Path $opencodeRoot 'skills'
        }
    }
    if ($Client -eq 'cursor' -or $Client -eq 'both') {
        if (Test-Path -LiteralPath $cursorRoot) {
            $targets += Join-Path $cursorRoot 'skills'
        }
    }
    return $targets
}

if ($Destination) {
    $targets = @($Destination)
}
else {
    $targets = Resolve-Targets -Client $Client
    if ($targets.Count -eq 0) {
        throw "Nenhum cliente encontrado para '$Client'. Use -Destination <pasta> para escolher o destino."
    }
}

foreach ($target in $targets) {
    New-Item -ItemType Directory -Path $target -Force | Out-Null

    foreach ($skill in $skills) {
        $dest = Join-Path $target $skill.Name

        if ((Test-Path -LiteralPath $dest) -and -not $Force) {
            Write-Host "skip    $($skill.Name) -> $target (ja existe, use -Force para sobrescrever)"
            continue
        }
        if (Test-Path -LiteralPath $dest) {
            Remove-Item -LiteralPath $dest -Recurse -Force
        }

        Copy-Item -LiteralPath $skill.FullName -Destination $dest -Recurse -Force
        Get-ChildItem -LiteralPath $dest -Recurse -File -Filter '*.log' |
            Remove-Item -Force -ErrorAction SilentlyContinue

        Write-Host "install $($skill.Name) -> $target"
    }
}

Write-Host ""
Write-Host "Pronto. Destinos:"
$targets | ForEach-Object { Write-Host " - $_" }
