# install.ps1 - 一键安装

Write-Host "安装 mimocode-wiki..." -ForegroundColor Cyan

# 复制工具到 MimoCode
$toolsSource = "$PSScriptRoot\tools"
$toolsDest = "$env:USERPROFILE\.mimocode\tools"

New-Item -ItemType Directory -Path $toolsDest -Force | Out-Null
Copy-Item -Path "$toolsSource\*" -Destination $toolsDest -Recurse -Force

# 复制技能到 MimoCode
$skillsSource = "$PSScriptRoot\skills"
$skillsDest = "$env:USERPROFILE\.mimocode\skills"

New-Item -ItemType Directory -Path $skillsDest -Force | Out-Null
Copy-Item -Path "$skillsSource\*" -Destination $skillsDest -Recurse -Force

Write-Host "安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "下一步：" -ForegroundColor Yellow
Write-Host "1. 打开 Obsidian，选择此目录作为 Vault" -ForegroundColor White
Write-Host "2. 安装插件：Templater, Obsidian Git, Dataview" -ForegroundColor White
Write-Host "3. 打开 MimoCode，输入 /wiki 开始使用" -ForegroundColor White
