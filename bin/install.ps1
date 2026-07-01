# install.ps1 - mimocode-wiki 一键安装脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 安装程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$SourceDir = Split-Path -Parent $PSScriptRoot

# 1. 安装 MimoCode 技能
Write-Host "1. 安装 MimoCode 技能..." -ForegroundColor Yellow
$skillsSource = "$SourceDir\skills"
$skillsDest = "$env:USERPROFILE\.mimocode\skills"

if (Test-Path $skillsSource) {
    New-Item -ItemType Directory -Path $skillsDest -Force | Out-Null
    Copy-Item -Path "$skillsSource\*" -Destination $skillsDest -Recurse -Force
    Write-Host "   技能安装完成 (15 个技能)" -ForegroundColor Green
} else {
    Write-Host "   技能目录不存在，跳过" -ForegroundColor Gray
}

# 2. 安装 Agents
Write-Host "2. 安装 Agents..." -ForegroundColor Yellow
$agentsSource = "$SourceDir\agents"
$agentsDest = "$env:USERPROFILE\.mimocode\agents"

if (Test-Path $agentsSource) {
    New-Item -ItemType Directory -Path $agentsDest -Force | Out-Null
    Copy-Item -Path "$agentsSource\*" -Destination $agentsDest -Recurse -Force
    Write-Host "   Agents 安装完成 (3 个代理)" -ForegroundColor Green
} else {
    Write-Host "   Agents 目录不存在，跳过" -ForegroundColor Gray
}

# 3. 安装 Commands
Write-Host "3. 安装 Commands..." -ForegroundColor Yellow
$commandsSource = "$SourceDir\commands"
$commandsDest = "$env:USERPROFILE\.mimocode\commands"

if (Test-Path $commandsSource) {
    New-Item -ItemType Directory -Path $commandsDest -Force | Out-Null
    Copy-Item -Path "$commandsSource\*" -Destination $commandsDest -Recurse -Force
    Write-Host "   Commands 安装完成 (5 个命令)" -ForegroundColor Green
} else {
    Write-Host "   Commands 目录不存在，跳过" -ForegroundColor Gray
}

# 4. 安装 Templates
Write-Host "4. 安装 Templates..." -ForegroundColor Yellow
$templatesSource = "$SourceDir\_templates"
$templatesDest = "$env:USERPROFILE\.mimocode\_templates"

if (Test-Path $templatesSource) {
    New-Item -ItemType Directory -Path $templatesDest -Force | Out-Null
    Copy-Item -Path "$templatesSource\*" -Destination $templatesDest -Recurse -Force
    Write-Host "   Templates 安装完成 (5 个模板)" -ForegroundColor Green
} else {
    Write-Host "   Templates 目录不存在，跳过" -ForegroundColor Gray
}

# 5. 创建 Obsidian 配置
Write-Host "5. 配置 Obsidian..." -ForegroundColor Yellow
$obsidianDir = "$SourceDir\.obsidian"
New-Item -ItemType Directory -Path $obsidianDir -Force | Out-Null
New-Item -ItemType Directory -Path "$obsidianDir\snippets" -Force | Out-Null

# 创建 app.json
@{
    showLineNumber = $true
    showFrontmatter = $true
    livePreview = $true
    readableLineLength = $true
    strictLineBreaks = $false
    attachmentFolderPath = "_attachments"
    newFileLocation = "current"
} | ConvertTo-Json | Set-Content "$obsidianDir\app.json"

# 创建 appearance.json
@{
    baseFontSize = 16
    theme = "obsidian"
    cssTheme = ""
    cssSnippets = @("snippets/vault-colors.css")
} | ConvertTo-Json | Set-Content "$obsidianDir\appearance.json"

# 创建 graph.json
@{
    collapseFilter = $false
    search = ""
    showTags = $true
    showAttachments = $false
    hideUnresolved = $false
    showOrphans = $true
    collapseColorGroups = $false
    colorGroups = @(
        @{ query = "path:wiki/domains"; color = @{ a = 1; rgb = 5145199 } }
        @{ query = "path:wiki/entities"; color = @{ a = 1; rgb = 12940032 } }
        @{ query = "path:wiki/concepts"; color = @{ a = 1; rgb = 14408667 } }
        @{ query = "path:wiki/sources"; color = @{ a = 1; rgb = 13469496 } }
        @{ query = "path:wiki/questions"; color = @{ a = 1; rgb = 6924069 } }
    )
    collapseDisplay = $false
    showArrow = $true
    textFadeMultiplier = 0
    nodeSizeMultiplier = 1
    lineSizeMultiplier = 1
    collapseForces = $true
    centerStrength = 0.5
    repelStrength = 10
    linkStrength = 1
    linkDistance = 250
    scale = 1
    close = $false
} | ConvertTo-Json -Depth 10 | Set-Content "$obsidianDir\graph.json"

# 创建 community-plugins.json
@() | ConvertTo-Json | Set-Content "$obsidianDir\community-plugins.json"

# 创建 core-plugins.json
@(
    "file-explorer", "global-search", "switcher", "graph", "backlink",
    "outgoing-link", "tag-pane", "page-preview", "daily-notes", "templates",
    "note-composer", "command-palette", "markdown-importer", "outline",
    "word-count", "file-recovery"
) | ConvertTo-Json | Set-Content "$obsidianDir\core-plugins.json"

# 创建 vault-colors.css
@"
:root {
  --wiki-1: #4fc1ff;
  --wiki-2: #c586c0;
  --wiki-3: #dcdcaa;
  --wiki-4: #ce9178;
  --wiki-5: #6a9955;
  --wiki-6: #d16969;
  --wiki-7: #569cd6;
}

.nav-folder-title[data-path^="wiki/domains"] { color: var(--wiki-1); }
.nav-folder-title[data-path^="wiki/entities"] { color: var(--wiki-2); }
.nav-folder-title[data-path^="wiki/concepts"] { color: var(--wiki-3); }
.nav-folder-title[data-path^="wiki/sources"] { color: var(--wiki-4); }
.nav-folder-title[data-path^="wiki/questions"] { color: var(--wiki-5); }
.nav-folder-title[data-path^="wiki/comparisons"] { color: var(--wiki-6); }
.nav-folder-title[data-path^="wiki/meta"] { color: var(--wiki-7); }
.nav-folder-title[data-path=".raw"] { color: #808080; opacity: 0.6; }
"@ | Set-Content "$obsidianDir\snippets\vault-colors.css"

Write-Host "   Obsidian 配置完成" -ForegroundColor Green

# 6. 创建 vault-meta
Write-Host "6. 配置 Vault Meta..." -ForegroundColor Yellow
$vaultMetaDir = "$SourceDir\.vault-meta"
New-Item -ItemType Directory -Path $vaultMetaDir -Force | Out-Null

@{
    mode = "generic"
    description = "Personal Second Brain"
    set_at = (Get-Date -Format "yyyy-MM-dd")
} | ConvertTo-Json | Set-Content "$vaultMetaDir\mode.json"

@{
    preferred = "filesystem"
    fallback = @("filesystem")
    detected_at = (Get-Date -Format "yyyy-MM-dd")
    refresh_weekly = $true
} | ConvertTo-Json | Set-Content "$vaultMetaDir\transport.json"

Write-Host "   Vault Meta 配置完成" -ForegroundColor Green

# 7. 创建 wiki 目录
Write-Host "7. 创建 Wiki 目录..." -ForegroundColor Yellow
$wikiDir = "$SourceDir\wiki"
New-Item -ItemType Directory -Path $wikiDir -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\sources" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\entities" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\concepts" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\domains" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\questions" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\comparisons" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\meta" -Force | Out-Null
New-Item -ItemType Directory -Path "$wikiDir\canvases" -Force | Out-Null
Write-Host "   Wiki 目录创建完成" -ForegroundColor Green

# 8. 检查 Obsidian
Write-Host "8. 检查 Obsidian..." -ForegroundColor Yellow
$obsidianPath = "$env:LOCALAPPDATA\Obsidian\Obsidian.exe"
if (Test-Path $obsidianPath) {
    Write-Host "   Obsidian 已安装" -ForegroundColor Green
    Write-Host "   请在 Obsidian 中安装以下插件：" -ForegroundColor Yellow
    Write-Host "   - Templater" -ForegroundColor White
    Write-Host "   - Obsidian Git" -ForegroundColor White
    Write-Host "   - Dataview" -ForegroundColor White
} else {
    Write-Host "   Obsidian 未安装" -ForegroundColor Gray
    Write-Host "   请访问 https://obsidian.md/download 下载安装" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  安装完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "已安装组件：" -ForegroundColor Yellow
Write-Host "- Skills: 15 个技能" -ForegroundColor White
Write-Host "- Agents: 3 个代理" -ForegroundColor White
Write-Host "- Commands: 5 个命令" -ForegroundColor White
Write-Host "- Templates: 5 个模板" -ForegroundColor White
Write-Host "- Obsidian 配置" -ForegroundColor White
Write-Host "- Wiki 目录结构" -ForegroundColor White
Write-Host ""
Write-Host "下一步：" -ForegroundColor Yellow
Write-Host "1. 打开 Obsidian，选择 mimocode-wiki 目录作为 Vault" -ForegroundColor White
Write-Host "2. 安装插件：Templater, Obsidian Git, Dataview" -ForegroundColor White
Write-Host "3. 打开 MimoCode，输入 /wiki 开始使用" -ForegroundColor White
Write-Host ""
