param(
    [string]$NodeModulesPath = "node_modules",
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

function Remove-IfExists {
    param(
        [string]$Path,
        [System.Collections.Generic.List[string]]$Removed,
        [switch]$DryRun
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        return
    }

    if ($DryRun) {
        $Removed.Add("[dry-run] " + $Path) > $null
        return
    }

    Remove-Item -LiteralPath $Path -Recurse -Force
    $Removed.Add($Path) > $null
}

$removed = New-Object System.Collections.Generic.List[string]

$unstorageDrivers = Join-Path $NodeModulesPath "unstorage/drivers"
$crosswsAdapters = Join-Path $NodeModulesPath "crossws/adapters"

# Remove Azure and Cloudflare runtime drivers from unstorage.
# Keep declaration files to avoid breaking package type surface.
if (Test-Path -LiteralPath $unstorageDrivers) {
    Get-ChildItem -Path $unstorageDrivers -File -ErrorAction SilentlyContinue | Where-Object {
        ($_.Name -like "azure-*.mjs") -or
        ($_.Name -like "azure-*.cjs") -or
        ($_.Name -like "cloudflare-*.mjs") -or
        ($_.Name -like "cloudflare-*.cjs")
    } | ForEach-Object {
        Remove-IfExists -Path $_.FullName -Removed $removed -DryRun:$DryRun
    }

    Get-ChildItem -Path (Join-Path $unstorageDrivers "utils") -File -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like "cloudflare.cjs" -or $_.Name -like "cloudflare.mjs"
    } | ForEach-Object {
        Remove-IfExists -Path $_.FullName -Removed $removed -DryRun:$DryRun
    }
}

# Remove Cloudflare adapter typings from crossws.
if (Test-Path -LiteralPath $crosswsAdapters) {
    Get-ChildItem -Path $crosswsAdapters -File -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like "cloudflare*.d.ts"
    } | ForEach-Object {
        Remove-IfExists -Path $_.FullName -Removed $removed -DryRun:$DryRun
    }
}

Write-Output ("removed_count=" + $removed.Count)
$removed | Sort-Object
