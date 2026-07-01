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

## 三者区别：Skills vs Commands vs Agents

| 类型 | 作用 | 类比 |
|------|------|------|
| **Skills** | AI 的知识库/说明书 | 像一本操作手册，AI 按需读取 |
| **Commands** | 用户的快捷命令 | 像键盘快捷键，一键触发 |
| **Agents** | 专门的子代理 | 像雇了一个专家来处理特定任务 |

### 工作流程

```
用户输入命令 → Commands 触发 → AI 加载对应 Skill → 执行任务
                                    ↓
                              复杂任务调用 Agent
```

## Skills 列表（AI 的操作手册）

| 技能 | 功能 |
|------|------|
| wiki | Wiki 主入口，初始化和管理 |
| wiki-ingest | 摄取源文件的详细指南 |
| wiki-query | 查询知识的详细指南 |
| wiki-lint | 健康检查的详细指南 |
| wiki-retrieve | **混合检索**（BM25 + 语义排序，更精准的搜索） |
| wiki-mode | 切换 Wiki 组织模式 |
| wiki-cli | Obsidian CLI 操作 |
| wiki-fold | 日志折叠 |
| save | 保存对话的详细指南 |
| autoresearch | 自动研究的详细指南 |
| canvas | 可视化图谱的详细指南 |
| think | 10 原则深度思考的详细指南 |
| defuddle | 清理网页内容 |
| obsidian-bases | 数据库视图参考 |
| obsidian-markdown | Markdown 语法参考 |

### wiki-retrieve 是什么？

**混合检索** = BM25（关键词搜索）+ 语义排序（理解含义）

普通搜索：只匹配关键词
混合搜索：理解语义，找到最相关的段落

例如搜索 ".NET 性能优化"：
- 普通搜索：找到包含"性能"和"优化"的页面
- 混合搜索：找到真正讨论性能优化的段落，即使没有完全匹配关键词

## Commands 列表（用户的快捷命令）

| 命令 | 触发的技能 | 功能 |
|------|-----------|------|
| `/wiki` | wiki | 初始化 Wiki |
| `/wiki-init` | wiki | 初始化 Wiki |
| `/wiki-save` | save | 保存对话 |
| `/wiki-autoresearch` | autoresearch | 自动研究 |
| `/canvas` | canvas | 可视化图谱 |
| `/save` | save | 保存对话 |
| `/autoresearch` | autoresearch | 自动研究 |

## Agents 列表（专门的子代理）

| 代理 | 功能 | 何时使用 |
|------|------|---------|
| wiki-ingest | 摄取源文件 | 执行 `ingest` 命令时 |
| wiki-lint | 健康检查 | 执行 `lint the wiki` 时 |
| wiki-research | 自动研究 | 执行 `/autoresearch` 时 |

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
