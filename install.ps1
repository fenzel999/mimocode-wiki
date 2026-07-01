# install.ps1 - 一键安装

Write-Host "安装 mimocode-wiki..." -ForegroundColor Cyan

$source = "$PSScriptRoot\skills"
$dest = "$env:USERPROFILE\.mimocode\skills"

New-Item -ItemType Directory -Path $dest -Force | Out-Null
Copy-Item -Path "$source\*" -Destination $dest -Recurse -Force

Write-Host "安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "下一步：" -ForegroundColor Yellow
Write-Host "1. 打开 Obsidian，选择此目录作为 Vault" -ForegroundColor White
Write-Host "2. 安装插件：Templater, Obsidian Git, Dataview" -ForegroundColor White
Write-Host "3. 打开 MimoCode，输入 /wiki 开始使用" -ForegroundColor White
