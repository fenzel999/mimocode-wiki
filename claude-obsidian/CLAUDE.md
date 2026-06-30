# LLM Wiki - 第二大脑

Mode: D (Personal / Second Brain)
Purpose: 个人知识管理和 AI 第二大脑
Owner: 用户
Created: 2026-07-01

## Structure

```
wiki/
├── index.md            # 主目录
├── log.md              # 操作日志
├── hot.md              # 热点缓存
├── overview.md         # 概览
├── sources/            # 源文件摘要
├── entities/           # 实体（人物、组织、产品）
├── concepts/           # 概念和想法
├── domains/            # 领域
├── questions/          # 问答
├── comparisons/        # 对比分析
├── meta/               # 元数据和仪表板
└── canvases/           # 可视化画布
```

## Conventions

- 所有笔记使用 YAML frontmatter: type, status, created, updated, tags (minimum)
- 使用 [[Note Name]] 格式的 wikilinks
- .raw/ 包含源文件，不要修改
- wiki/index.md 是主目录，每次摄取后更新
- wiki/log.md 是追加式的，新条目在顶部

## Operations

- Ingest: 将源文件放入 .raw/，说 "ingest [filename]"
- Query: 问任何问题
- Lint: 说 "lint the wiki" 运行健康检查
- Save: 说 "/save" 保存当前对话
- Research: 说 "/autoresearch [topic]" 进行自动研究
- Canvas: 说 "/canvas" 打开可视化层

## Skills

本项目包含以下 MimoCode 技能：

| 技能 | 触发词 | 功能 |
|------|--------|------|
| wiki | /wiki, scaffold, set up vault | 设置和管理 Wiki |
| wiki-ingest | ingest, process this | 摄取源文件 |
| wiki-query | query, what do you know about | 查询知识 |
| wiki-lint | lint, health check | 健康检查 |
| save | /save, file this | 保存对话 |
| autoresearch | /autoresearch, research | 自动研究 |
| canvas | /canvas, add to canvas | 可视化层 |
| think | /think, think this through | 10原则思考框架 |

## Obsidian Integration

本 Wiki 设计为与 Obsidian 一起使用：

1. 在 Obsidian 中打开本目录作为 Vault
2. 安装推荐插件：Dataview, Templater, Obsidian Git
3. 启用 CSS Snippets 以获得彩色文件夹视图

## Cross-Project Access

在其他 MimoCode 项目中引用此 Wiki：

```markdown
## Wiki Knowledge Base
Path: D:\fenzel\source\repos\fff\claude-obsidian

When you need context:
1. Read wiki/hot.md first (recent context)
2. If not enough, read wiki/index.md (full catalog)
3. Only then read specific wiki pages
```
