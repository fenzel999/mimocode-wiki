# uninstall.ps1 - mimocode-wiki uninstaller

$ErrorActionPreference = "Stop"
$mimocodeSkills = Join-Path $env:USERPROFILE ".mimocode\skills"

Write-Host ""
Write-Host "  mimocode-wiki uninstaller" -ForegroundColor Cyan
Write-Host "  =========================" -ForegroundColor Cyan
Write-Host ""

# ── Remove skills ──────────────────────────────────────────────────────
Write-Host "Removing skills ..." -ForegroundColor Yellow

$skillDirs = @(
    "wiki", "wiki-ingest", "wiki-query", "wiki-lint",
    "wiki-save", "wiki-autoresearch", "wiki-canvas", "wiki-think"
)

foreach ($dir in $skillDirs) {
    $skillPath = Join-Path $mimocodeSkills $dir
    if (Test-Path $skillPath) {
        Remove-Item -Recurse -Force $skillPath
        Write-Host "  - Removed $dir/" -ForegroundColor Green
    }
}

Write-Host ""

# ── Ask about wiki vault ──────────────────────────────────────────────
Write-Host "The wiki vault files (.raw/, wiki/, AGENTS.md, etc.) are in the current directory." -ForegroundColor Yellow
Write-Host "These are NOT removed automatically to prevent data loss." -ForegroundColor Yellow
Write-Host ""
Write-Host "To manually remove them, delete:" -ForegroundColor White
Write-Host "  .raw/  wiki/  .archive/  _templates/  _attachments/  AGENTS.md  .gitignore" -ForegroundColor DarkGray
Write-Host ""
Write-Host "Uninstall complete." -ForegroundColor Green
Write-Host ""
