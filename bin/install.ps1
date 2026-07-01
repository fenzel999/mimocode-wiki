# install.ps1 - mimocode-wiki 一键安装脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 安装程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. 克隆仓库
Write-Host "1. 克隆仓库..." -ForegroundColor Yellow
if (Test-Path "mimocode-wiki") {
    Write-Host "   仓库已存在，跳过克隆" -ForegroundColor Gray
} else {
    git clone https://github.com/fenzel999/mimocode-wiki.git
    Write-Host "   仓库克隆完成" -ForegroundColor Green
}

# 2. 进入目录
Set-Location -Path "mimocode-wiki"

# 3. 安装 MimoCode 技能
Write-Host "2. 安装 MimoCode 技能..." -ForegroundColor Yellow
$skillsSource = ".\.mimocode\skills"
$skillsDest = "$env:USERPROFILE\.mimocode\skills"

if (Test-Path $skillsSource) {
    New-Item -ItemType Directory -Path $skillsDest -Force | Out-Null
    Copy-Item -Path "$skillsSource\*" -Destination $skillsDest -Recurse -Force
    Write-Host "   技能安装完成" -ForegroundColor Green
} else {
    Write-Host "   技能目录不存在，跳过" -ForegroundColor Gray
}

# 4. 检查 Obsidian
Write-Host "3. 检查 Obsidian..." -ForegroundColor Yellow
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
Write-Host "下一步：" -ForegroundColor Yellow
Write-Host "1. 打开 Obsidian，选择 mimocode-wiki 目录作为 Vault" -ForegroundColor White
Write-Host "2. 安装插件：Templater, Obsidian Git, Dataview" -ForegroundColor White
Write-Host "3. 打开 MimoCode，输入 /wiki 开始使用" -ForegroundColor White
Write-Host ""
