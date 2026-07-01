# mimocode-wiki: AI 驱动的个人知识管理系统

> 基于 Karpathy LLM Wiki Pattern，专为 MimoCode 打造

## 项目结构

```
mimocode-wiki/
├── skills/              # 15 个技能文件
├── agents/              # 3 个代理定义
├── commands/            # 5 个命令定义
├── _templates/          # 5 个模板文件
├── bin/                 # 安装和卸载脚本
├── .gitignore           # Git 忽略规则
└── README.md            # 本文件
```

**注意**：项目不包含 `.mimocode/`、`.obsidian/`、`.vault-meta/` 等目录。这些由安装脚本自动创建。

## 快速开始

### 安装

```powershell
# 进入项目目录
cd mimocode-wiki

# 运行安装脚本
.\bin\install.ps1
```

安装脚本会自动：
- 复制技能到 `~/.mimocode/skills/`
- 复制代理到 `~/.mimocode/agents/`
- 复制命令到 `~/.mimocode/commands/`
- 复制模板到 `~/.mimocode/_templates/`
- 创建 Obsidian 配置
- 创建 Wiki 目录结构

### 卸载

```powershell
.\bin\uninstall.ps1
```

卸载脚本只会删除 mimocode-wiki 的插件，不影响其他插件。

## 使用教程

### 第一步：安装后

1. 打开 Obsidian
2. 选择 mimocode-wiki 目录作为 Vault
3. 安装插件：Templater, Obsidian Git, Dataview
4. 打开 MimoCode
5. 输入 `/wiki` 初始化 Wiki

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

## 技能列表

| 技能 | 命令 | 功能 |
|------|------|------|
| wiki | `/wiki` | 初始化 Wiki |
| wiki-ingest | `ingest [文件]` | 添加知识 |
| wiki-query | `query: [问题]` | 查询知识 |
| wiki-lint | `lint the wiki` | 健康检查 |
| save | `/save` | 保存对话 |
| autoresearch | `/autoresearch [主题]` | 自动研究 |
| canvas | `/canvas` | 可视化图谱 |
| think | `/think [问题]` | 深度思考 |

## 代理列表

| 代理 | 功能 |
|------|------|
| wiki-ingest | 摄取源文件 |
| wiki-lint | 健康检查 |
| wiki-research | 自动研究 |

## 卸载说明

运行 `.\bin\uninstall.ps1` 即可一键卸载。

**注意**：
- 只删除 mimocode-wiki 的插件
- 不影响其他插件
- Wiki 内容保留在项目目录中

## 常见问题

### Q: Obsidian 是免费的吗？
是的，Obsidian 核心功能完全免费。

### Q: 我的数据安全吗？
是的，所有数据都保存在你的本地电脑上。

### Q: 如何更新项目？
```powershell
cd mimocode-wiki
git pull
```

### Q: 遇到问题怎么办？
1. 检查插件是否正确安装
2. 重启 Obsidian
3. 在 GitHub 提交 Issue

---

**版本**: 1.0.0  
**更新日期**: 2026-07-01  
**作者**: fenzel999
