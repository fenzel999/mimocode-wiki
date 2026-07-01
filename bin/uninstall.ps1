# uninstall.ps1 - mimocode-wiki 一键卸载脚本
# 只卸载 mimocode-wiki 的插件，不影响其他插件

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 卸载程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. 卸载 MimoCode 技能
Write-Host "1. 卸载 MimoCode 技能..." -ForegroundColor Yellow
$skillsDest = "$env:USERPROFILE\.mimocode\skills"

if (Test-Path $skillsDest) {
    $wikiSkills = @(
        "autoresearch", "canvas", "defuddle", "obsidian-bases", "obsidian-markdown",
        "save", "think", "wiki", "wiki-cli", "wiki-fold", "wiki-ingest",
        "wiki-lint", "wiki-mode", "wiki-query", "wiki-retrieve"
    )
    
    foreach ($skill in $wikiSkills) {
        $skillPath = Join-Path $skillsDest $skill
        if (Test-Path $skillPath) {
            Remove-Item -Path $skillPath -Recurse -Force
            Write-Host "   已删除技能: $skill" -ForegroundColor Gray
        }
    }
    Write-Host "   技能卸载完成" -ForegroundColor Green
} else {
    Write-Host "   技能目录不存在，跳过" -ForegroundColor Gray
}

# 2. 卸载 Agents
Write-Host "2. 卸载 Agents..." -ForegroundColor Yellow
$agentsDest = "$env:USERPROFILE\.mimocode\agents"

if (Test-Path $agentsDest) {
    $wikiAgents = @("wiki-ingest.md", "wiki-lint.md", "wiki-research.md")
    
    foreach ($agent in $wikiAgents) {
        $agentPath = Join-Path $agentsDest $agent
        if (Test-Path $agentPath) {
            Remove-Item -Path $agentPath -Force
            Write-Host "   已删除代理: $agent" -ForegroundColor Gray
        }
    }
    Write-Host "   Agents 卸载完成" -ForegroundColor Green
} else {
    Write-Host "   Agents 目录不存在，跳过" -ForegroundColor Gray
}

# 3. 卸载 Commands
Write-Host "3. 卸载 Commands..." -ForegroundColor Yellow
$commandsDest = "$env:USERPROFILE\.mimocode\commands"

if (Test-Path $commandsDest) {
    $wikiCommands = @(
        "autoresearch.md", "canvas.md", "save.md", "wiki.md",
        "wiki-autoresearch.md", "wiki-init.md", "wiki-save.md"
    )
    
    foreach ($command in $wikiCommands) {
        $commandPath = Join-Path $commandsDest $command
        if (Test-Path $commandPath) {
            Remove-Item -Path $commandPath -Force
            Write-Host "   已删除命令: $command" -ForegroundColor Gray
        }
    }
    Write-Host "   Commands 卸载完成" -ForegroundColor Green
} else {
    Write-Host "   Commands 目录不存在，跳过" -ForegroundColor Gray
}

# 4. 卸载 Templates
Write-Host "4. 卸载 Templates..." -ForegroundColor Yellow
$templatesDest = "$env:USERPROFILE\.mimocode\_templates"

if (Test-Path $templatesDest) {
    $wikiTemplates = @("comparison.md", "concept.md", "entity.md", "question.md", "source.md")
    
    foreach ($template in $wikiTemplates) {
        $templatePath = Join-Path $templatesDest $template
        if (Test-Path $templatePath) {
            Remove-Item -Path $templatePath -Force
            Write-Host "   已删除模板: $template" -ForegroundColor Gray
        }
    }
    Write-Host "   Templates 卸载完成" -ForegroundColor Green
} else {
    Write-Host "   Templates 目录不存在，跳过" -ForegroundColor Gray
}

# 5. 询问是否删除项目目录
Write-Host ""
Write-Host "5. 删除项目目录？" -ForegroundColor Yellow
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
