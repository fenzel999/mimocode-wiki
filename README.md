# TeamMind Wiki - 使用说明书

> AI 驱动的个人知识管理系统，基于 Karpathy LLM Wiki Pattern

## 快速开始

### 1. 启动

```powershell
cd D:\fenzel\source\repos\fff
mimocode
```

### 2. 首次使用

输入 `/wiki` 开始设置 Wiki。

---

## 核心技能

### `/wiki` - Wiki 主入口

**功能**: 设置和管理 Wiki 知识库

**用法**:
```
/wiki
```

**功能**:
- 初始化 Wiki 结构
- 选择组织模式（Generic/LYT/PARA/Zettelkasten）
- 创建目录和模板

---

### `ingest [文件]` - 摄取文件

**功能**: 将文件添加到 Wiki 知识库

**用法**:
```
ingest .raw/article.md
ingest https://example.com/article
```

**流程**:
1. 读取源文件
2. 提取实体和概念
3. 创建 Wiki 页面
4. 更新索引和日志

---

### `query: [问题]` - 查询知识

**功能**: 从 Wiki 中查找答案

**用法**:
```
query: 我的技术背景是什么？
query: TeamMind 的技术栈是什么？
query quick: .NET 10 是什么？
query deep: 全面分析 Blazor 的优缺点
```

**模式**:
- `query quick:` - 快速查询（仅读取 hot.md 和 index.md）
- `query:` - 标准查询（读取 3-5 个相关页面）
- `query deep:` - 深度查询（读取所有相关页面）

---

### `lint the wiki` - 健康检查

**功能**: 检查 Wiki 的健康状态

**用法**:
```
lint the wiki
```

**检查内容**:
- 孤立页面（没有入链的页面）
- 死链接（链接到不存在的页面）
- 缺失的 frontmatter 字段
- 过时的内容

---

### `/save` - 保存对话

**功能**: 将当前对话保存到 Wiki

**用法**:
```
/save
/save 我的职业规划
```

**保存位置**: `wiki/questions/` 或 `wiki/concepts/`

---

### `/autoresearch [主题]` - 自动研究

**功能**: 自动搜索、整理、归档研究结果

**用法**:
```
/autoresearch .NET 10 新特性
/autoresearch Blazor 最佳实践
/autoresearch 微服务架构设计
```

**流程**:
1. 搜索相关资料
2. 提取关键信息
3. 创建 Wiki 页面
4. 交叉引用

---

### `/canvas` - 可视化图谱

**功能**: 创建和管理可视化知识图谱

**用法**:
```
/canvas                          # 查看状态
/canvas new research             # 创建新画布
/canvas add note [.NET 10]       # 添加 Wiki 页面
/canvas add text "关键洞察"      # 添加文本卡片
/canvas zone "Product"           # 添加区域
/canvas list                     # 列出所有节点
```

---

### `/think [问题]` - 深度思考

**功能**: 用 10 原则框架分析复杂问题

**用法**:
```
/think 我应该如何开始构建 TeamMind？
/think 如何平衡求职和创业？
/think 选择什么技术栈最合适？
```

**10 原则**:
1. OBSERVE (外部) - 收集数据
2. OBSERVE (内部) - 反思偏见
3. LISTEN - 倾听需求
4. THINK - 分析问题
5. CONNECT (横向) - 关联思考
6. CONNECT (系统) - 整体思考
7. FEEL - 直觉判断
8. ACCEPT - 接受现实
9. CREATE - 产出方案
10. GROW - 迭代改进

---

## 辅助技能

### `defuddle [URL]` - 清理网页

**功能**: 清理网页内容，提取纯文本

**用法**:
```
defuddle https://example.com/article
```

**效果**: 减少 40-60% 的 token 消耗

---

### `retrieve [查询]` - 混合检索

**功能**: 更精准的知识检索

**用法**:
```
retrieve 如何设计微服务架构
```

**技术**: BM25 + 语义排序

---

### `fold the log` - 日志折叠

**功能**: 将日志条目汇总为摘要页面

**用法**:
```
fold the log, dry-run k=3
fold the log, commit k=3
```

---

## 文件结构

```
D:\fenzel\source\repos\fff\
├── .mimocode\skills\        # 15 个技能
├── .raw\                    # 源文件（放入要摄取的文件）
├── wiki\                    # Wiki 知识库
│   ├── index.md             # 主目录
│   ├── hot.md               # 最近上下文（AI 首先读取）
│   ├── log.md               # 操作日志
│   ├── overview.md          # 概览
│   ├── sources\             # 源文件摘要
│   ├── entities\            # 实体（人物、组织）
│   ├── concepts\            # 概念和想法
│   ├── domains\             # 领域
│   ├── questions\           # 问答
│   ├── comparisons\         # 对比分析
│   ├── meta\                # 元数据
│   └── canvases\            # 可视化图谱
├── _templates\              # 模板文件
├── _attachments\            # 附件
├── CLAUDE.md                # 项目配置
└── WIKI.md                  # Wiki 架构参考
```

---

## 日常工作流

### 早上开始

1. 启动 MimoCode
2. AI 自动读取 `wiki/hot.md` 恢复上下文
3. 继续昨天的工作

### 添加知识

1. 将文件放入 `.raw/` 目录
2. 输入 `ingest .raw/your-file.md`
3. AI 自动整理和归档

### 查询知识

1. 输入 `query: [你的问题]`
2. AI 从 Wiki 中找答案
3. 可选：`/save` 保存问答

### 深度研究

1. 输入 `/autoresearch [主题]`
2. AI 自动搜索和整理
3. 创建多个 Wiki 页面

### 可视化

1. 输入 `/canvas` 查看知识图谱
2. 在 Obsidian 中打开查看

### 结束工作

1. 输入 `/save` 保存当前对话
2. AI 更新 `wiki/hot.md`
3. 下次启动时自动恢复

---

## AI 持久记忆

**核心原理**: Wiki = AI 的持久记忆

```
会话开始 → 读取 hot.md → 恢复上下文 → 工作 → 更新 Wiki
    ↑                                           ↓
    └───────────────────────────────────────────┘
```

**效果**:
- 跨会话保持连续性
- 不会"失忆"
- 知识持续积累

---

## 技术栈

- **前端**: Blazor Server (.NET 10)
- **后端**: ASP.NET Core Minimal APIs
- **数据库**: PostgreSQL + Redis
- **AI**: Semantic Kernel + OpenAI/开源模型
- **搜索**: Meilisearch
- **部署**: Docker + Aspire 13.1

---

## 常见问题

### Q: 如何在其他目录使用 Wiki？

在全局配置中添加 Wiki 路径：

```markdown
# C:\Users\fenze\.mimocode\CLAUDE.md

## Wiki Knowledge Base
Path: D:\fenzel\source\repos\fff\wiki
```

### Q: Wiki 文件太大怎么办？

使用 `fold the log` 折叠日志，或 `lint the wiki` 检查并清理。

### Q: 如何备份 Wiki？

Wiki 就是普通文件，直接备份整个目录即可。

### Q: 如何与团队共享？

将 Wiki 目录放在共享位置，或使用 Git 同步。

---

## 更多资源

- [Karpathy LLM Wiki Pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- [claude-obsidian 原项目](https://github.com/AgriciDaniel/claude-obsidian)
- [Obsidian 官网](https://obsidian.md)

---

**版本**: 1.0.0
**更新日期**: 2026-07-01
