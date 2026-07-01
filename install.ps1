# install.ps1 - mimocode-wiki installer
# Installs MiMoCode skills + creates Obsidian vault skeleton

$ErrorActionPreference = "Stop"
$repoRoot = $PSScriptRoot
$skillsSource = Join-Path $repoRoot "skills"
$mimocodeSkills = Join-Path $env:USERPROFILE ".mimocode\skills"
$wikiVault = Get-Location  # Install wiki vault in current directory

Write-Host ""
Write-Host "  mimocode-wiki installer" -ForegroundColor Cyan
Write-Host "  ======================" -ForegroundColor Cyan
Write-Host ""

# ── Step 1: Install skills ──────────────────────────────────────────────
Write-Host "[1/6] Installing skills to $mimocodeSkills ..." -ForegroundColor Yellow

$skillDirs = Get-ChildItem -Path $skillsSource -Directory
foreach ($dir in $skillDirs) {
    $dest = Join-Path $mimocodeSkills $dir.Name
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    Copy-Item -Path (Join-Path $dir.FullName "*") -Destination $dest -Recurse -Force
    Write-Host "  + $($dir.Name)/SKILL.md" -ForegroundColor Green
}

Write-Host ""

# ── Step 2: Create wiki vault skeleton ──────────────────────────────────
Write-Host "[2/6] Creating wiki vault structure ..." -ForegroundColor Yellow

$dirs = @(
    ".raw\articles",
    ".raw\images",
    ".archive",
    "wiki\sources",
    "wiki\entities",
    "wiki\concepts",
    "wiki\domains",
    "wiki\comparisons",
    "wiki\questions",
    "wiki\meta",
    "wiki\canvases",
    "wiki\templates",
    "_attachments\images",
    "_templates"
)

foreach ($dir in $dirs) {
    $fullPath = Join-Path $wikiVault $dir
    New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
}

# Create index files for entity/concept/domain folders
$indexDirs = @("wiki\entities", "wiki\concepts", "wiki\domains")
foreach ($dir in $indexDirs) {
    $indexPath = Join-Path $wikiVault "$dir\_index.md"
    if (-not (Test-Path $indexPath)) {
        $folderName = Split-Path $dir -Leaf
        Set-Content -Path $indexPath -Value "---`ntype: meta`ntitle: `"$folderName Index`"`nupdated: $(Get-Date -Format 'yyyy-MM-dd')`n---`n`n#$folderName`n"
    }
}

# Create wiki/index.md
$indexPath = Join-Path $wikiVault "wiki\index.md"
if (-not (Test-Path $indexPath)) {
    Set-Content -Path $indexPath -Value "---`ntype: meta`ntitle: `"Wiki Index`"`nupdated: $(Get-Date -Format 'yyyy-MM-dd')`n---`n`n# Wiki Index`n`n## Sources`n`n## Entities`n`n## Concepts`n`n## Domains`n`n## Questions`n"
}

# Create wiki/log.md
$logPath = Join-Path $wikiVault "wiki\log.md"
if (-not (Test-Path $logPath)) {
    Set-Content -Path $logPath -Value "---`ntype: meta`ntitle: `"Wiki Log`"`nupdated: $(Get-Date -Format 'yyyy-MM-dd')`n---`n`n# Wiki Log`n`n## $(Get-Date -Format 'yyyy-MM-dd') setup | Wiki initialized`n- Created vault structure`n- Skills installed`n"
}

# Create wiki/hot.md
$hotPath = Join-Path $wikiVault "wiki\hot.md"
if (-not (Test-Path $hotPath)) {
    Set-Content -Path $hotPath -Value "---`ntype: meta`ntitle: `"Hot Cache`"`nupdated: $(Get-Date -Format 'yyyy-MM-ddTHH:mm:ss')`n---`n`n# Recent Context`n`n## Last Updated`n$(Get-Date -Format 'yyyy-MM-DD'). Wiki initialized.`n`n## Key Recent Facts`n- Wiki created on $(Get-Date -Format 'yyyy-MM-dd')`n"
}

# Create wiki/overview.md
$overviewPath = Join-Path $wikiVault "wiki\overview.md"
if (-not (Test-Path $overviewPath)) {
    Set-Content -Path $overviewPath -Value "---`ntype: meta`ntitle: `"Wiki Overview`"`nupdated: $(Get-Date -Format 'yyyy-MM-dd')`n---`n`n# Wiki Overview`n`nThis wiki was initialized on $(Get-Date -Format 'yyyy-MM-dd').`n`nDescribe what this wiki is about here.`n"
}

Write-Host "  Created wiki/, .raw/, _templates/, _attachments/" -ForegroundColor Green
Write-Host ""

# ── Step 3: Create AGENTS.md ────────────────────────────────────────────
Write-Host "[3/6] Creating AGENTS.md ..." -ForegroundColor Yellow

$agentsPath = Join-Path $wikiVault "AGENTS.md"
if (-not (Test-Path $agentsPath)) {
    $agentsContent = @"
# Wiki Knowledge Base

Mode: D (Personal / Second Brain)
Purpose: Persistent knowledge wiki managed by MiMoCode
Created: $(Get-Date -Format 'yyyy-MM-dd)

## Structure

```
.wiki/
├── .raw/           # Immutable source documents
├── wiki/           # LLM-generated knowledge base
│   ├── index.md    # Master catalog
│   ├── log.md      # Chronological log
│   ├── hot.md      # Hot cache (recent context)
│   ├── overview.md # Executive summary
│   ├── sources/    # Source summaries
│   ├── entities/   # People, orgs, products
│   ├── concepts/   # Ideas, patterns, frameworks
│   ├── domains/    # Topic areas
│   ├── comparisons/ # Side-by-side analyses
│   ├── questions/  # Filed answers
│   ├── meta/       # Dashboards, lint reports
│   └── canvases/   # Visual reference boards
├── _templates/     # Note templates
├── _attachments/   # Images and files
└── AGENTS.md       # This file
```

## Conventions

- All notes use YAML frontmatter: type, status, created, updated, tags (minimum)
- Wikilinks use [[Note Name]] format: filenames are unique, no paths needed
- .raw/ contains source documents: never modify them
- wiki/index.md is the master catalog: update on every ingest
- wiki/log.md is append-only: never edit past entries
- New log entries go at the TOP of the file

## Operations

- Ingest: drop source in .raw/, say "ingest [filename]"
- Query: ask any question: AI reads index first, then drills in
- Lint: say "lint the wiki" to run a health check
- Save: say "save this" or "/save" to file conversation
- Research: say "/autoresearch [topic]" for deep research
- Canvas: say "/canvas" for visual reference boards
- Think: say "/think [problem]" for structured thinking
- Archive: move cold sources to .archive/ to keep .raw/ clean

## Wiki Knowledge Base Reference

When you need context from this wiki in other projects:
1. Read wiki/hot.md first (recent context, ~500 words)
2. If not enough, read wiki/index.md (full catalog)
3. If you need domain specifics, read wiki/<domain>/_index.md
4. Only then read individual wiki pages
"@
    Set-Content -Path $agentsPath -Value $agentsContent
    Write-Host "  Created AGENTS.md" -ForegroundColor Green
} else {
    Write-Host "  AGENTS.md already exists, skipping" -ForegroundColor DarkGray
}

Write-Host ""

# ── Step 4: Check Obsidian ──────────────────────────────────────────────
Write-Host "[4/6] Checking Obsidian installation ..." -ForegroundColor Yellow

$obsidianPaths = @(
    "$env:LOCALAPPDATA\Obsidian\Obsidian.exe",
    "$env:LOCALAPPDATA\Programs\Obsidian\Obsidian.exe",
    "$env:ProgramFiles\Obsidian\Obsidian.exe"
)

$obsidianFound = $false
foreach ($p in $obsidianPaths) {
    if (Test-Path $p) {
        $obsidianFound = $true
        Write-Host "  Found Obsidian at: $p" -ForegroundColor Green
        break
    }
}

if (-not $obsidianFound) {
    Write-Host "  Obsidian not found!" -ForegroundColor Red
    Write-Host "  Download from: https://obsidian.md" -ForegroundColor White
}

Write-Host ""

# ── Step 5: Check plugins ───────────────────────────────────────────────
Write-Host "[5/6] Checking Obsidian plugins ..." -ForegroundColor Yellow

$obsidianVaultPath = $wikiVault.Path
$pluginsDir = Join-Path $obsidianVaultPath ".obsidian\plugins"

$requiredPlugins = @(
    @{ Name = "obsidian-local-rest-api"; Desc = "Local REST API (for MCP integration)" },
    @{ Name = "templater-obsidian"; Desc = "Templater" },
    @{ Name = "dataview"; Desc = "Dataview" }
)

$missingPlugins = @()
foreach ($plugin in $requiredPlugins) {
    $pluginPath = Join-Path $pluginsDir $plugin.Name
    if (Test-Path $pluginPath) {
        Write-Host "  + $($plugin.Desc) installed" -ForegroundColor Green
    } else {
        Write-Host "  - $($plugin.Desc) NOT installed" -ForegroundColor Red
        $missingPlugins += $plugin
    }
}

if ($missingPlugins.Count -gt 0) {
    Write-Host ""
    Write-Host "  Missing plugins! In Obsidian:" -ForegroundColor Yellow
    Write-Host "  Settings > Community plugins > Browse > Search and install:" -ForegroundColor White
    foreach ($p in $missingPlugins) {
        Write-Host "    - $($p.Desc)" -ForegroundColor White
    }
}

Write-Host ""

# ── Step 6: Initialize git ──────────────────────────────────────────────
Write-Host "[6/6] Initializing git ..." -ForegroundColor Yellow

if (-not (Test-Path (Join-Path $wikiVault ".git"))) {
    Push-Location $wikiVault
    git init 2>&1 | Out-Null
    # Create .gitignore
    $gitignore = @"
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/cache
"@
    Set-Content -Path (Join-Path $wikiVault ".gitignore") -Value $gitignore
    git add -A 2>&1 | Out-Null
    git commit -m "Initialize mimocode-wiki vault" 2>&1 | Out-Null
    Pop-Location
    Write-Host "  Git initialized with initial commit" -ForegroundColor Green
} else {
    Write-Host "  Git already initialized" -ForegroundColor DarkGray
}

Write-Host ""

# ── Done ────────────────────────────────────────────────────────────────
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installation complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  1. Open this folder as an Obsidian vault" -ForegroundColor White
Write-Host "     File > Open folder as vault > Select: $wikiVault" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  2. Install missing plugins (see above)" -ForegroundColor White
Write-Host "     Settings > Community plugins > Browse" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  3. Open MiMoCode and type:" -ForegroundColor White
Write-Host "     /wiki" -ForegroundColor Cyan
Write-Host ""
Write-Host "  4. Start using your wiki!" -ForegroundColor White
Write-Host "     - Add knowledge: place files in .raw/, then say 'ingest [file]'" -ForegroundColor DarkGray
Write-Host "     - Ask questions: just ask anything" -ForegroundColor DarkGray
Write-Host "     - Deep research: /autoresearch [topic]" -ForegroundColor DarkGray
Write-Host "     - Save conversations: /save" -ForegroundColor DarkGray
Write-Host ""
