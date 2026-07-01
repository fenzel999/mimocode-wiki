# run.ps1 - mimocode-wiki 完整教程和运行脚本
# 面向第一次使用的用户，包含完整教程

Clear-Host
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  mimocode-wiki 完整教程" -ForegroundColor Cyan
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

# 循环运行
$running = $true
while ($running) {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  mimocode-wiki 主菜单" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "请选择操作：" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1. 安装教程（第一次使用）" -ForegroundColor White
    Write-Host "2. 启动 MimoCode" -ForegroundColor White
    Write-Host "3. 打开 Obsidian" -ForegroundColor White
    Write-Host "4. 功能演示" -ForegroundColor White
    Write-Host "5. 常见问题" -ForegroundColor White
    Write-Host "6. 卸载说明" -ForegroundColor White
    Write-Host "7. 退出" -ForegroundColor White
    Write-Host ""
    
    $choice = Read-Host "请选择 (1-7)"
    
    switch ($choice) {
        "1" {
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  安装教程" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 第一步：了解 Obsidian ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Obsidian 是什么？" -ForegroundColor Green
            Write-Host "- 一个基于本地 Markdown 文件的知识管理工具" -ForegroundColor White
            Write-Host "- 所有数据都在你的电脑上，没有云端依赖" -ForegroundColor White
            Write-Host "- 支持双向链接和图谱视图" -ForegroundColor White
            Write-Host "- 免费使用，插件丰富" -ForegroundColor White
            Write-Host ""
            Write-Host "为什么用 Obsidian？" -ForegroundColor Green
            Write-Host "- 数据安全：本地存储，不怕云端服务关闭" -ForegroundColor White
            Write-Host "- 知识关联：轻松建立笔记之间的关联" -ForegroundColor White
            Write-Host "- 可视化：查看知识网络图谱" -ForegroundColor White
            Write-Host "- 可扩展：通过插件添加功能" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键继续..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  安装教程 - 第二步" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 第二步：安装 Obsidian ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Windows:" -ForegroundColor Green
            Write-Host "1. 访问 https://obsidian.md/download" -ForegroundColor White
            Write-Host "2. 下载 Windows 版本" -ForegroundColor White
            Write-Host "3. 运行安装程序" -ForegroundColor White
            Write-Host "4. 按照提示完成安装" -ForegroundColor White
            Write-Host ""
            Write-Host "macOS:" -ForegroundColor Green
            Write-Host "1. 访问 https://obsidian.md/download" -ForegroundColor White
            Write-Host "2. 下载 macOS 版本" -ForegroundColor White
            Write-Host "3. 拖动 Obsidian 到 Applications 文件夹" -ForegroundColor White
            Write-Host ""
            Write-Host "首次启动：" -ForegroundColor Green
            Write-Host "1. 启动 Obsidian" -ForegroundColor White
            Write-Host "2. 选择 'Open folder as vault'" -ForegroundColor White
            Write-Host "3. 选择 mimocode-wiki 目录" -ForegroundColor White
            Write-Host "4. 点击 'Trust author and enable plugins'" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键继续..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  安装教程 - 第三步" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 第三步：安装插件 ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "必需插件：" -ForegroundColor Green
            Write-Host ""
            Write-Host "1. Templater（模板引擎）" -ForegroundColor Cyan
            Write-Host "   - 设置 > Community Plugins > Browse" -ForegroundColor White
            Write-Host "   - 搜索 'Templater'" -ForegroundColor White
            Write-Host "   - 安装并启用" -ForegroundColor White
            Write-Host "   - 配置：Template folder location = _templates" -ForegroundColor White
            Write-Host ""
            Write-Host "2. Obsidian Git（自动备份）" -ForegroundColor Cyan
            Write-Host "   - 设置 > Community Plugins > Browse" -ForegroundColor White
            Write-Host "   - 搜索 'Obsidian Git'" -ForegroundColor White
            Write-Host "   - 安装并启用" -ForegroundColor White
            Write-Host "   - 配置：Auto backup interval = 15 minutes" -ForegroundColor White
            Write-Host ""
            Write-Host "3. Dataview（查询引擎）" -ForegroundColor Cyan
            Write-Host "   - 设置 > Community Plugins > Browse" -ForegroundColor White
            Write-Host "   - 搜索 'Dataview'" -ForegroundColor White
            Write-Host "   - 安装并启用" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键继续..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  安装教程 - 第四步" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 第四步：启动 MimoCode ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "1. 打开终端" -ForegroundColor White
            Write-Host "2. 进入 mimocode-wiki 目录" -ForegroundColor White
            Write-Host "3. 输入 mimocode 启动" -ForegroundColor White
            Write-Host "4. 输入 /wiki 初始化 Wiki" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键继续..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  安装完成！" -ForegroundColor Green
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "现在你可以：" -ForegroundColor Yellow
            Write-Host "1. 输入 /wiki 初始化 Wiki" -ForegroundColor White
            Write-Host "2. 将文件放入 .raw/ 目录" -ForegroundColor White
            Write-Host "3. 输入 ingest .raw/文件名.md 添加知识" -ForegroundColor White
            Write-Host "4. 输入 query: 问题 查询知识" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键返回主菜单..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        "2" {
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
        "3" {
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
            Write-Host "按任意键继续..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        "4" {
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  功能演示" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 示例 1：添加技术笔记 ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "1. 创建文件 .raw/dotnet10.md" -ForegroundColor White
            Write-Host "2. 文件内容：" -ForegroundColor White
            Write-Host "   # .NET 10 新特性" -ForegroundColor Gray
            Write-Host "   ## C# 14" -ForegroundColor Gray
            Write-Host "   - 字段关键字" -ForegroundColor Gray
            Write-Host "   - 空条件赋值" -ForegroundColor Gray
            Write-Host "3. 在 MimoCode 中运行：" -ForegroundColor White
            Write-Host "   ingest .raw/dotnet10.md" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 示例 2：查询知识 ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "query: .NET 10 有什么新特性？" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 示例 3：创建知识图谱 ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "/canvas new '技术学习'" -ForegroundColor Cyan
            Write-Host "/canvas add note [.NET 10]" -ForegroundColor Cyan
            Write-Host "/canvas add text '技术栈规划'" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 示例 4：深度研究 ===" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "/autoresearch 微服务架构设计" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "按任意键返回主菜单..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        "5" {
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  常见问题" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Q: Obsidian 是免费的吗？" -ForegroundColor Green
            Write-Host "A: 是的，Obsidian 核心功能完全免费。" -ForegroundColor White
            Write-Host ""
            Write-Host "Q: 我的数据安全吗？" -ForegroundColor Green
            Write-Host "A: 是的，所有数据都保存在你的本地电脑上。" -ForegroundColor White
            Write-Host ""
            Write-Host "Q: 可以在多台电脑上使用吗？" -ForegroundColor Green
            Write-Host "A: 可以，使用 Obsidian Sync 或其他同步工具。" -ForegroundColor White
            Write-Host ""
            Write-Host "Q: 如何更新项目？" -ForegroundColor Green
            Write-Host "A: cd mimocode-wiki; git pull" -ForegroundColor White
            Write-Host ""
            Write-Host "Q: 遇到问题怎么办？" -ForegroundColor Green
            Write-Host "A: 1. 检查插件是否正确安装" -ForegroundColor White
            Write-Host "   2. 重启 Obsidian" -ForegroundColor White
            Write-Host "   3. 查看 Obsidian 控制台（Ctrl+Shift+I）" -ForegroundColor White
            Write-Host "   4. 在 GitHub 提交 Issue" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键返回主菜单..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        "6" {
            Clear-Host
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host "  卸载说明" -ForegroundColor Cyan
            Write-Host "========================================" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "=== 卸载 Obsidian ===" -ForegroundColor Yellow
            Write-Host "1. 关闭 Obsidian" -ForegroundColor White
            Write-Host "2. Windows：设置 > 应用 > 卸载 Obsidian" -ForegroundColor White
            Write-Host "3. macOS：拖动 Obsidian 到废纸篓" -ForegroundColor White
            Write-Host ""
            Write-Host "注意：卸载 Obsidian 不会删除你的笔记数据。" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "=== 卸载插件 ===" -ForegroundColor Yellow
            Write-Host "1. 打开 Obsidian" -ForegroundColor White
            Write-Host "2. 设置 > Community Plugins" -ForegroundColor White
            Write-Host "3. 点击插件旁边的垃圾桶图标" -ForegroundColor White
            Write-Host ""
            Write-Host "=== 卸载项目 ===" -ForegroundColor Yellow
            Write-Host "1. 删除项目目录" -ForegroundColor White
            Write-Host "2. 删除 Obsidian 配置（可选）：" -ForegroundColor White
            Write-Host "   - Windows: %APPDATA%\Obsidian" -ForegroundColor Gray
            Write-Host "   - macOS: ~/Library/Application Support/Obsidian" -ForegroundColor Gray
            Write-Host ""
            Write-Host "=== 卸载 MimoCode 技能 ===" -ForegroundColor Yellow
            Write-Host "Remove-Item -Path `"$env:USERPROFILE\.mimocode\skills\*`" -Recurse -Force" -ForegroundColor White
            Write-Host ""
            Write-Host "=== 内容保存 ===" -ForegroundColor Yellow
            Write-Host "卸载后内容会保留！" -ForegroundColor Green
            Write-Host "- Obsidian 卸载：笔记数据保存在项目目录中" -ForegroundColor White
            Write-Host "- 插件卸载：插件配置被删除，但笔记内容保留" -ForegroundColor White
            Write-Host "- 项目删除：如果你删除了项目目录，内容会丢失" -ForegroundColor White
            Write-Host ""
            Write-Host "按任意键返回主菜单..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        "7" {
            Write-Host ""
            Write-Host "感谢使用 mimocode-wiki！" -ForegroundColor Green
            Write-Host "再见！" -ForegroundColor Green
            $running = $false
        }
        default {
            Write-Host "无效选择，请重新输入" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}
