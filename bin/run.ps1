# run.ps1 - mimocode-wiki 一键运行脚本
# 功能：打开新终端，运行 MimoCode，展示 Obsidian 功能，循环直到用户确认退出

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 运行程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否在正确目录
if (-not (Test-Path "wiki")) {
    Write-Host "错误：请在 mimocode-wiki 目录下运行此脚本" -ForegroundColor Red
    Write-Host "当前目录: $(Get-Location)" -ForegroundColor Gray
    exit 1
}

# 显示欢迎信息
Write-Host "欢迎使用 mimocode-wiki！" -ForegroundColor Green
Write-Host ""
Write-Host "这是一个 AI 驱动的个人知识管理系统。" -ForegroundColor White
Write-Host "基于 Karpathy LLM Wiki Pattern，专为 MimoCode 打造。" -ForegroundColor White
Write-Host ""

# 显示功能介绍
Write-Host "=== 功能介绍 ===" -ForegroundColor Yellow
Write-Host "/wiki           - 初始化 Wiki" -ForegroundColor White
Write-Host "ingest [文件]   - 添加知识" -ForegroundColor White
Write-Host "query: [问题]   - 查询知识" -ForegroundColor White
Write-Host "/save           - 保存对话" -ForegroundColor White
Write-Host "/autoresearch   - 自动研究" -ForegroundColor White
Write-Host "/canvas         - 可视化图谱" -ForegroundColor White
Write-Host "/think [问题]   - 深度思考" -ForegroundColor White
Write-Host "lint the wiki   - 健康检查" -ForegroundColor White
Write-Host ""

# 循环运行
$running = $true
while ($running) {
    Write-Host "=== 选择操作 ===" -ForegroundColor Yellow
    Write-Host "1. 启动 MimoCode" -ForegroundColor White
    Write-Host "2. 打开 Obsidian" -ForegroundColor White
    Write-Host "3. 查看帮助" -ForegroundColor White
    Write-Host "4. 退出" -ForegroundColor White
    Write-Host ""
    
    $choice = Read-Host "请选择 (1-4)"
    
    switch ($choice) {
        "1" {
            Write-Host ""
            Write-Host "启动 MimoCode..." -ForegroundColor Green
            Write-Host "在 MimoCode 中输入 /wiki 开始使用" -ForegroundColor Yellow
            Write-Host ""
            
            # 打开新终端运行 MimoCode
            Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PWD'; mimocode"
            
            Write-Host "MimoCode 已在新终端启动" -ForegroundColor Green
            Write-Host "完成后按任意键继续..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        "2" {
            Write-Host ""
            Write-Host "打开 Obsidian..." -ForegroundColor Green
            
            $obsidianPath = "$env:LOCALAPPDATA\Obsidian\Obsidian.exe"
            if (Test-Path $obsidianPath) {
                Start-Process $obsidianPath -ArgumentList "$PWD"
                Write-Host "Obsidian 已打开" -ForegroundColor Green
            } else {
                Write-Host "Obsidian 未安装，请先安装" -ForegroundColor Yellow
                Write-Host "访问 https://obsidian.md/download" -ForegroundColor White
            }
            Write-Host ""
        }
        "3" {
            Write-Host ""
            Write-Host "=== 使用帮助 ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "快速开始：" -ForegroundColor Cyan
            Write-Host "1. 在 MimoCode 中输入 /wiki 初始化 Wiki" -ForegroundColor White
            Write-Host "2. 将文件放入 .raw/ 目录" -ForegroundColor White
            Write-Host "3. 输入 ingest .raw/文件名.md 添加知识" -ForegroundColor White
            Write-Host "4. 输入 query: 问题 查询知识" -ForegroundColor White
            Write-Host ""
            Write-Host "常用命令：" -ForegroundColor Cyan
            Write-Host "/wiki           - 初始化 Wiki" -ForegroundColor White
            Write-Host "ingest [文件]   - 添加知识" -ForegroundColor White
            Write-Host "query: [问题]   - 查询知识" -ForegroundColor White
            Write-Host "/save           - 保存对话" -ForegroundColor White
            Write-Host "/autoresearch   - 自动研究" -ForegroundColor White
            Write-Host "/canvas         - 可视化图谱" -ForegroundColor White
            Write-Host "/think [问题]   - 深度思考" -ForegroundColor White
            Write-Host "lint the wiki   - 健康检查" -ForegroundColor White
            Write-Host ""
            Write-Host "详细教程请查看 README.md" -ForegroundColor Gray
            Write-Host ""
        }
        "4" {
            Write-Host ""
            Write-Host "感谢使用 mimocode-wiki！" -ForegroundColor Green
            Write-Host "再见！" -ForegroundColor Green
            $running = $false
        }
        default {
            Write-Host "无效选择，请重新输入" -ForegroundColor Red
        }
    }
}
