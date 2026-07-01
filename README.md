# mimocode-wiki

AI 驱动的个人知识管理系统，基于 Karpathy LLM Wiki Pattern，专为 MiMoCode 打造。

> Wiki 是持久的、复合的产物。交叉引用已经存在，矛盾已经标记，综合分析已经反映了所有阅读的内容。Wiki 随着每个源文件和每个问题变得越来越丰富。—— Andrej Karpathy

---

## 快速开始（3 步）

### 第 1 步：安装

```powershell
# 克隆仓库
git clone https://github.com/fenzel999/mimocode-wiki.git
cd mimocode-wiki

# 运行安装脚本（支持 Windows/macOS/Linux）
.\install.ps1          # PowerShell
# 或
node install.js        # Node.js（跨平台）
```

安装脚本会：
- 将技能文件安装到 `~/.mimocode/skills/`
- 在当前目录创建 Wiki 目录结构
- 创建 `AGENTS.md` 配置文件
- 检测 Obsidian 和插件安装情况
- 初始化 Git 仓库

### 第 2 步：配置 Obsidian

1. 打开 Obsidian → **File → Open folder as vault** → 选择当前目录
2. 安装必需插件：
   - **Settings → Community plugins → Browse**
   - 搜索并安装：`Templater`、`Dataview`
3. （可选）安装 MCP 集成插件：
   - 搜索并安装：`Local REST API`
   - 在插件设置中获取 API Key

### 第 3 步：开始使用

打开 MiMoCode，输入：

```
/wiki
```

AI 会问你："这个 Wiki 用来做什么？"，然后自动完成设置。

---

## 常用命令速查

| 命令 | 功能 | 示例 |
|------|------|------|
| `/wiki` | 初始化或检查 Wiki | `/wiki` |
| `ingest [文件]` | 添加知识到 Wiki | `ingest .raw/article.md` |
| `ingest [URL]` | 从网页添加知识 | `ingest https://example.com/article` |
| `query: [问题]` | 查询知识库 | `query: 什么是微服务？` |
| `query quick: [问题]` | 快速查询（省 token） | `query quick: .NET 10 发布日期` |
| `query deep: [问题]` | 深度查询（全面分析） | `query deep: 比较 Blazor 和 React` |
| `/save` | 保存当前对话到 Wiki | `/save 技术学习笔记` |
| `/autoresearch [主题]` | 自动深度研究 | `/autoresearch RAG 最佳实践` |
| `/canvas` | 可视化知识图谱 | `/canvas new "技术架构"` |
| `/think [问题]` | 10 原则深度思考 | `/think 如何设计微服务架构？` |
| `lint the wiki` | Wiki 健康检查 | `lint the wiki` |

---

## 技能列表

| 技能 | 功能 | 触发词 |
|------|------|--------|
| **wiki** | 主入口，路由到子技能 | `/wiki`, `set up wiki`, `scaffold vault` |
| **wiki-ingest** | 添加知识源 | `ingest`, `process this`, `add this` |
| **wiki-query** | 查询知识库 | `query:`, `what do you know about` |
| **wiki-lint** | 健康检查 | `lint`, `health check`, `clean up` |
| **wiki-save** | 保存对话 | `/save`, `save this`, `file this` |
| **wiki-autoresearch** | 自动深度研究 | `/autoresearch`, `research [topic]` |
| **wiki-canvas** | 可视化图谱 | `/canvas`, `add to canvas` |
| **wiki-think** | 10 原则深度思考 | `/think`, `deep think`, `think this through` |

---

## 目录结构

安装后，你的 Wiki 目录结构如下：

```
your-vault/
├── .raw/                  # 源文档（不可修改）
│   ├── articles/          # 文章源文件
│   └── images/            # 图片源文件
├── wiki/                  # AI 生成的知识库
│   ├── index.md           # 主索引（所有页面目录）
│   ├── log.md             # 操作日志（时间线）
│   ├── hot.md             # 热点缓存（最近上下文）
│   ├── overview.md        # 概览（整体摘要）
│   ├── sources/           # 源文件摘要
│   ├── entities/          # 实体（人物、组织、产品）
│   ├── concepts/          # 概念（想法、模式、框架）
│   ├── domains/           # 领域（主题区域）
│   ├── comparisons/       # 对比分析
│   ├── questions/         # 问答记录
│   ├── meta/              # 元数据（仪表板、lint 报告）
│   └── canvases/          # 可视化画布
├── _templates/            # 笔记模板
├── _attachments/          # 附件
├── .archive/              # 归档的源文件
├── AGENTS.md              # Wiki 配置和约定
└── .gitignore
```

---

## 核心理念

### 与 RAG 的区别

| | RAG | Wiki |
|---|---|---|
| **方式** | 每次查询时重新检索原始文档 | 构建持久化的知识库 |
| **交叉引用** | 不存在 | 已经存在 |
| **矛盾处理** | 不处理 | 已标记 |
| **综合分析** | 每次重新做 | 已经反映所有内容 |
| **Token 消耗** | 高 | 低（hot.md ~500 token） |

### 知识复利

Wiki 的核心价值在于**复利效应**：
- 每添加一个源文件，所有相关页面都获得交叉引用
- 每问一个问题，好的答案被保存为新页面
- 知识库越用越丰富，查询越来越高效

---

## MCP 集成（可选）

如果你想通过 API 直接操作 Obsidian，可以配置 MCP：

1. 在 Obsidian 中安装 `Local REST API` 插件
2. 在插件设置中获取 API Key
3. 在 MiMoCode 配置中添加：

```json
{
  "mcp": {
    "obsidian": {
      "command": "uvx",
      "args": ["mcp-obsidian"],
      "env": {
        "OBSIDIAN_API_KEY": "<你的 API Key>",
        "OBSIDIAN_HOST": "localhost",
        "OBSIDIAN_PORT": "27123"
      }
    }
  }
}
```

---

## 跨项目引用

在其他 MiMoCode 项目的 `AGENTS.md` 中添加：

```markdown
## Wiki Knowledge Base
Path: D:\path\to\your\vault

When you need context not already in this project:
1. Read wiki/hot.md first (recent context, ~500 words)
2. If not enough, read wiki/index.md (full catalog)
3. If you need domain specifics, read wiki/<domain>/_index.md
4. Only then read individual wiki pages
```

---

## 更新

```bash
cd mimocode-wiki
git pull
node install.js  # 重新安装技能
```

---

## 卸载

```powershell
.\uninstall.ps1          # PowerShell
# 或
node uninstall.js        # Node.js
```

---

## FAQ

**Q: Obsidian 是免费的吗？**
是的，核心功能完全免费。

**Q: 数据安全吗？**
是的，所有数据都在本地，不上传到任何服务器。

**Q: 需要什么环境？**
- Obsidian（桌面版）
- MiMoCode
- Node.js 18+（如果使用 install.js）

**Q: 支持什么操作系统？**
Windows、macOS、Linux。

**Q: 遇到问题？**
在 GitHub 提交 Issue：https://github.com/fenzel999/mimocode-wiki/issues

---

## License

MIT
