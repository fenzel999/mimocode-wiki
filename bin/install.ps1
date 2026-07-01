# install.ps1 - mimocode-wiki 一键安装脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 安装程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$SourceDir = Split-Path -Parent $PSScriptRoot

# 1. 安装 MimoCode 技能
Write-Host "1. 安装 MimoCode 技能..." -ForegroundColor Yellow
$skillsSource = "$SourceDir\.mimocode\skills"
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
    Write-Host "   Commands 安装完成 (7 个命令)" -ForegroundColor Green
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

# 5. 检查 Obsidian
Write-Host "5. 检查 Obsidian..." -ForegroundColor Yellow
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
Write-Host "- Commands: 7 个命令" -ForegroundColor White
Write-Host "- Templates: 5 个模板" -ForegroundColor White
Write-Host ""
Write-Host "下一步：" -ForegroundColor Yellow
Write-Host "1. 打开 Obsidian，选择 mimocode-wiki 目录作为 Vault" -ForegroundColor White
Write-Host "2. 安装插件：Templater, Obsidian Git, Dataview" -ForegroundColor White
Write-Host "3. 打开 MimoCode，输入 /wiki 开始使用" -ForegroundColor White
Write-Host ""
