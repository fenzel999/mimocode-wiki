# uninstall.ps1 - mimocode-wiki 一键卸载脚本
# 只卸载 mimocode-wiki 的插件，不影响其他插件

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 卸载程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. 检查并卸载 MimoCode 技能
Write-Host "1. 卸载 MimoCode 技能..." -ForegroundColor Yellow
$skillsDest = "$env:USERPROFILE\.mimocode\skills"

if (Test-Path $skillsDest) {
    # 只删除 mimocode-wiki 相关的技能
    $wikiSkills = @(
        "autoresearch",
        "canvas",
        "defuddle",
        "obsidian-bases",
        "obsidian-markdown",
        "save",
        "think",
        "wiki",
        "wiki-cli",
        "wiki-fold",
        "wiki-ingest",
        "wiki-lint",
        "wiki-mode",
        "wiki-query",
        "wiki-retrieve"
    )
    
    foreach ($skill in $wikiSkills) {
        $skillPath = Join-Path $skillsDest $skill
        if (Test-Path $skillPath) {
            Remove-Item -Path $skillPath -Recurse -Force
            Write-Host "   已删除: $skill" -ForegroundColor Gray
        }
    }
    Write-Host "   技能卸载完成" -ForegroundColor Green
} else {
    Write-Host "   技能目录不存在，跳过" -ForegroundColor Gray
}

# 2. 检查并卸载 Obsidian 插件（可选）
Write-Host ""
Write-Host "2. 检查 Obsidian 插件..." -ForegroundColor Yellow
$obsidianPath = "$env:LOCALAPPDATA\Obsidian\Obsidian.exe"
if (Test-Path $obsidianPath) {
    Write-Host "   Obsidian 已安装" -ForegroundColor Green
    Write-Host "   请在 Obsidian 中手动卸载以下插件：" -ForegroundColor Yellow
    Write-Host "   - Templater" -ForegroundColor White
    Write-Host "   - Obsidian Git" -ForegroundColor White
    Write-Host "   - Dataview" -ForegroundColor White
    Write-Host ""
    Write-Host "   卸载步骤：" -ForegroundColor Yellow
    Write-Host "   1. 打开 Obsidian" -ForegroundColor White
    Write-Host "   2. 设置 > Community Plugins" -ForegroundColor White
    Write-Host "   3. 点击插件旁边的垃圾桶图标" -ForegroundColor White
} else {
    Write-Host "   Obsidian 未安装，跳过" -ForegroundColor Gray
}

# 3. 询问是否删除项目目录
Write-Host ""
Write-Host "3. 删除项目目录？" -ForegroundColor Yellow
$deleteProject = Read-Host "是否删除 mimocode-wiki 目录？(y/n)"
if ($deleteProject -eq "y" -or $deleteProject -eq "Y") {
    $projectPath = Split-Path -Parent $PSScriptRoot
    if (Test-Path $projectPath) {
        Remove-Item -Path $projectPath -Recurse -Force
        Write-Host "   项目目录已删除" -ForegroundColor Green
    }
} else {
    Write-Host "   保留项目目录" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  卸载完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "注意：" -ForegroundColor Yellow
Write-Host "- 卸载只删除了 mimocode-wiki 的插件" -ForegroundColor White
Write-Host "- 其他插件不受影响" -ForegroundColor White
Write-Host "- Wiki 内容保留在项目目录中（除非你选择了删除）" -ForegroundColor White
Write-Host ""
