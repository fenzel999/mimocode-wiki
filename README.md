# mimocode-wiki: AI 驱动的个人知识管理系统

> 基于 Karpathy LLM Wiki Pattern，专为 MimoCode 打造

## 目录

1. [项目简介](#项目简介)
2. [什么是 Obsidian](#什么是-obsidian)
3. [安装 Obsidian](#安装-obsidian)
4. [安装插件](#安装插件)
5. [安装项目](#安装项目)
6. [使用教程](#使用教程)
7. [功能演示](#功能演示)
8. [卸载说明](#卸载说明)
9. [内容保存](#内容保存)
10. [常见问题](#常见问题)

---

## 项目简介

mimocode-wiki 是一个 AI 驱动的个人知识管理系统。它使用 MimoCode 的技能系统，让 AI 自动帮你整理笔记、建立知识图谱、进行深度研究。

### 核心特性

- **自动整理**：AI 自动提取实体、概念，建立关联
- **持久记忆**：跨会话保持连续性，不会"失忆"
- **深度研究**：自动搜索、整理、归档研究结果
- **可视化图谱**：在 Obsidian 中查看知识关联

---

## 什么是 Obsidian

Obsidian 是一个基于本地 Markdown 文件的知识管理工具。

### 为什么用 Obsidian？

- **本地存储**：所有数据都在你的电脑上，没有云端依赖
- **双向链接**：轻松建立笔记之间的关联
- **图谱视图**：可视化知识网络
- **插件丰富**：通过插件扩展功能
- **免费使用**：核心功能完全免费

### Obsidian vs 其他工具

| 特性 | Obsidian | Notion | Evernote |
|------|----------|--------|----------|
| 数据存储 | 本地 | 云端 | 云端 |
| 离线使用 | ✅ | ❌ | ⚠️ 有限 |
| 双向链接 | ✅ | ⚠️ 有限 | ❌ |
| 图谱视图 | ✅ | ❌ | ❌ |
| 插件系统 | ✅ | ⚠️ 有限 | ❌ |
| 价格 | 免费 | 免费/付费 | 免费/付费 |

---

## 安装 Obsidian

### Windows

1. 访问 https://obsidian.md/download
2. 下载 Windows 版本
3. 运行安装程序
4. 按照提示完成安装

### macOS

1. 访问 https://obsidian.md/download
2. 下载 macOS 版本
3. 拖动 Obsidian 到 Applications 文件夹

### Linux

```bash
# Flatpak
flatpak install flathub md.obsidian.Obsidian

# 或下载 AppImage
```

### 首次启动

1. 启动 Obsidian
2. 选择 "Open folder as vault"
3. 选择项目目录（mimocode-wiki）
4. 点击 "Trust author and enable plugins"

---

## 安装插件

### 必需插件

#### 1. Templater（模板引擎）

1. 打开 Obsidian
2. 点击左下角齿轮图标（设置）
3. 选择 "Community Plugins"
4. 点击 "Browse"
5. 搜索 "Templater"
6. 点击 "Install"
7. 安装后点击 "Enable"

**配置 Templater**：
1. 设置 > Templater
2. Template folder location: `_templates`
3. Trigger Templater on new file creation: 开启

#### 2. Obsidian Git（自动备份）

1. 设置 > Community Plugins > Browse
2. 搜索 "Obsidian Git"
3. 安装并启用

**配置 Obsidian Git**：
1. 设置 > Obsidian Git
2. Auto backup interval: 15 minutes
3. Backup on file change: 开启
4. Pull updates on startup: 开启

#### 3. Dataview（查询引擎）

1. 设置 > Community Plugins > Browse
2. 搜索 "Dataview"
3. 安装并启用

**配置 Dataview**：
1. 设置 > Dataview
2. Enable JavaScript Queries: 开启
3. Enable Inline Queries: 开启

### 可选插件

- **Calendar**：右侧日历视图
- **Excalidraw**：绘图工具
- **Banners**：页面横幅

---

## 安装项目

### 方法 1: 从 GitHub 下载（推荐）

1. 访问 https://github.com/fenzel999/mimocode-wiki
2. 点击绿色 "Code" 按钮
3. 选择 "Download ZIP"
4. 解压到你喜欢的位置
5. 打开 Obsidian，选择解压后的目录作为 Vault

### 方法 2: 使用 Git

```powershell
# 配置代理（如果你需要）
git config --global http.proxy http://127.0.0.1:31181
git config --global https.proxy http://127.0.0.1:31181

# 克隆仓库
git clone https://github.com/fenzel999/mimocode-wiki.git

# 进入目录
cd mimocode-wiki
```

### 方法 3: 一键安装脚本

```powershell
# 运行安装脚本
.\bin\install.ps1
```

---

## 使用教程

### 第一步：初始化 Wiki

1. 打开 MimoCode
2. 输入 `/wiki`
3. AI 会问你："这个 Wiki 用来做什么？"
4. 回答后，Wiki 自动创建完成

### 第二步：添加知识

**单个文件**：
```
ingest .raw/notes.txt
```

**批量文件**：
```
ingest all of these
```

**从 URL**：
```
ingest https://example.com/article
```

### 第三步：查询知识

```
query: 我的技术背景是什么？
query quick: .NET 10 是什么？
query deep: 全面分析 Blazor 的优缺点
```

### 第四步：保存对话

```
/save
/save 我的职业规划
```

### 第五步：深度研究

```
/autoresearch .NET 10 新特性
/autoresearch Blazor 最佳实践
```

### 第六步：可视化图谱

```
/canvas
/canvas add note [.NET 10]
/canvas add text "关键洞察"
```

### 第七步：深度思考

```
/think 我应该如何开始构建项目？
/think 如何平衡求职和创业？
```

### 第八步：健康检查

```
lint the wiki
```

---

## 功能演示

### 示例 1：添加技术笔记

```
# 创建一个测试文件
# 文件内容：# .NET 10 新特性

## C# 14
- 字段关键字
- 空条件赋值
- 扩展成员

## ASP.NET Core
- Blazor 改进
- Minimal API 增强

# 在 MimoCode 中运行
ingest .raw/dotnet10.md
```

### 示例 2：查询知识

```
query: .NET 10 有什么新特性？
```

AI 会从 Wiki 中找到相关页面并综合回答。

### 示例 3：创建知识图谱

```
/canvas new "技术学习"
/canvas add note [.NET 10]
/canvas add note [Blazor]
/canvas add text "技术栈规划"
```

在 Obsidian 中打开 `wiki/canvases/技术学习.canvas` 查看图谱。

### 示例 4：深度研究

```
/autoresearch 微服务架构设计
```

AI 会自动搜索相关资料，整理成 Wiki 页面。

---

## 卸载说明

### 卸载 Obsidian

1. 关闭 Obsidian
2. Windows：设置 > 应用 > 卸载 Obsidian
3. macOS：拖动 Obsidian 到废纸篓
4. Linux：根据安装方式卸载

**注意**：卸载 Obsidian 不会删除你的笔记数据。

### 卸载插件

1. 打开 Obsidian
2. 设置 > Community Plugins
3. 点击插件旁边的垃圾桶图标
4. 确认卸载

### 卸载项目

1. 删除项目目录
2. 删除 Obsidian 配置（可选）：
   - Windows: `%APPDATA%\Obsidian`
   - macOS: `~/Library/Application Support/Obsidian`
   - Linux: `~/.config/Obsidian`

### 卸载 MimoCode 技能

```powershell
# 删除全局技能
Remove-Item -Path "$env:USERPROFILE\.mimocode\skills\*" -Recurse -Force

# 或删除特定技能
Remove-Item -Path "$env:USERPROFILE\.mimocode\skills\wiki*" -Recurse -Force
```

---

## 内容保存

### 卸载后内容是否保留？

**是的，内容会保留！**

- **Obsidian 卸载**：笔记数据保存在项目目录中，不会被删除
- **插件卸载**：插件配置被删除，但笔记内容保留
- **项目删除**：如果你删除了项目目录，内容会丢失

### 备份建议

1. **定期备份**：使用 Obsidian Git 自动备份
2. **手动备份**：复制整个项目目录
3. **云同步**：使用 OneDrive、Dropbox 等同步工具

### 如何恢复

如果意外删除了内容：

```powershell
# 从 Git 恢复
git checkout -- .

# 从备份恢复
# 复制备份文件到项目目录
```

---

## 常见问题

### Q: Obsidian 是免费的吗？

是的，Obsidian 核心功能完全免费。同步服务和发布服务需要付费，但不是必需的。

### Q: 我的数据安全吗？

是的，所有数据都保存在你的本地电脑上，没有云端依赖。

### Q: 可以在多台电脑上使用吗？

可以，使用 Obsidian Sync 或其他同步工具（OneDrive、Dropbox）同步项目目录。

### Q: 如何更新项目？

```powershell
cd mimocode-wiki
git pull
```

### Q: 遇到问题怎么办？

1. 检查插件是否正确安装
2. 重启 Obsidian
3. 查看 Obsidian 控制台（Ctrl+Shift+I）
4. 在 GitHub 提交 Issue

---

## 技能列表

| 技能 | 命令 | 功能 |
|------|------|------|
| wiki | `/wiki` | 初始化 Wiki |
| wiki-ingest | `ingest [文件]` | 添加知识 |
| wiki-query | `query: [问题]` | 查询知识 |
| wiki-lint | `lint the wiki` | 健康检查 |
| wiki-retrieve | `retrieve [查询]` | 混合检索 |
| wiki-mode | `set vault mode` | 切换模式 |
| wiki-cli | `wiki-cli` | Obsidian CLI |
| wiki-fold | `fold the log` | 日志折叠 |
| save | `/save` | 保存对话 |
| autoresearch | `/autoresearch [主题]` | 自动研究 |
| canvas | `/canvas` | 可视化图谱 |
| think | `/think [问题]` | 深度思考 |
| defuddle | `defuddle [URL]` | 清理网页 |
| obsidian-bases | 参考用 | 数据库视图 |
| obsidian-markdown | 参考用 | Markdown 语法 |

---

## 代理列表

| 代理 | 功能 |
|------|------|
| wiki-ingest | 摄取源文件 |
| wiki-lint | 健康检查 |
| wiki-research | 自动研究 |

---

## 贡献

欢迎贡献！请查看 [CONTRIBUTING.md](CONTRIBUTING.md)。

---

## 许可证

MIT License - 详见 [LICENSE](LICENSE)

---

**版本**: 1.0.0  
**更新日期**: 2026-07-01  
**作者**: fenzel999
