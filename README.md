# mimocode-wiki

AI 驱动的个人知识管理系统，基于 Karpathy LLM Wiki Pattern，专为 MimoCode 打造。

## 安装

```powershell
.\install.ps1
```

## 卸载

```powershell
.\uninstall.ps1
```

## 快速开始

1. 安装后，打开 Obsidian，选择此目录作为 Vault
2. 安装插件：Templater, Obsidian Git, Dataview
3. 打开 MimoCode，输入 `/wiki` 初始化

---

## 核心理念

基于 Karpathy LLM Wiki Pattern：

> **Wiki 是持久的、复合的产物。** 交叉引用已经存在，矛盾已经标记，综合分析已经反映了所有阅读的内容。Wiki 随着每个源文件和每个问题变得越来越丰富。

**与 RAG 的区别**：
- RAG：每次查询时重新检索原始文档
- Wiki：构建持久化的知识库，交叉引用已存在

---

## 技能分类

### 核心技能（必须掌握）

<details>
<summary><b>wiki - Wiki 主入口</b></summary>

**功能**：初始化 Wiki 结构，检查状态，显示最近活动。

**工作方式**：
1. 检查 wiki/ 目录是否存在
2. 如果不存在，创建完整结构
3. 创建 index.md, hot.md, log.md, overview.md
4. 创建子目录：sources, entities, concepts, domains, questions

**使用场景**：
- 第一次使用时初始化 Wiki
- 检查 Wiki 健康状态
- 显示最近活动

**示例**：
```
/wiki
```

AI 会问你："这个 Wiki 用来做什么？"，然后自动创建结构。

**何时使用**：首次使用、检查状态、显示活动
</details>

---

<details>
<summary><b>wiki-ingest - 添加知识</b></summary>

**功能**：将文件添加到 Wiki。读取文件，提取实体和概念，创建 Wiki 页面。

**工作方式**：
1. 读取源文件（完全读取，不跳过）
2. 提取实体（人物、组织、产品）
3. 提取概念（想法、模式、框架）
4. 创建或更新 Wiki 页面
5. 更新 index.md 和 log.md
6. 交叉引用相关页面
7. 检查矛盾并标记

**使用场景**：
- 添加文章、论文、笔记
- 从 URL 获取内容
- 批量添加多个文件

**示例**：
```
# 添加单个文件
ingest .raw/article.md

# 添加 URL
ingest https://example.com/article

# 批量添加
ingest all of these
```

**输出**：一个源文件通常会创建 8-15 个 Wiki 页面。

**何时使用**：有新的源文件需要整理到知识库时
</details>

---

<details>
<summary><b>wiki-query - 查询知识</b></summary>

**功能**：从 Wiki 中查找答案。读取热点缓存、索引、相关页面，综合回答。

**工作方式**：
1. 读取 hot.md（最近上下文，~500 token）
2. 读取 index.md（所有页面目录，~1000 token）
3. 找到相关页面（3-5 个，每个 ~300 token）
4. 读取那些页面
5. 综合回答并引用来源

**三种模式**：

| 模式 | 触发方式 | 读取内容 | Token 消耗 | 适用场景 |
|------|---------|---------|-----------|---------|
| Quick | `query quick: ...` | 仅 hot.md + index.md | ~1,500 | 简单事实查询 |
| Standard | `query: ...` | hot.md + index + 3-5 页面 | ~3,000 | 大多数问题 |
| Deep | `query deep: ...` | 全部相关页面 | ~8,000+ | 深度分析 |

**使用场景**：
- 回忆之前学过的内容
- 查询项目相关信息
- 查找特定概念或实体

**示例**：
```
# 快速查询
query quick: .NET 10 是什么？

# 标准查询
query: 我之前学过什么？

# 深度查询
query deep: 全面分析 Blazor 的优缺点
```

**何时使用**：需要从知识库中查找信息时
</details>

---

<details>
<summary><b>wiki-lint - 健康检查</b></summary>

**功能**：检查 Wiki 的健康状态，查找问题。

**检查内容**：
1. 孤立页面（没有入链的页面）
2. 死链接（链接到不存在的页面）
3. 过时的内容
4. 缺失的页面
5. 缺失的交叉引用
6. 缺失的 frontmatter 字段
7. 空章节
8. 过时的索引条目

**使用场景**：
- 定期维护 Wiki
- 发现并修复问题
- 保持知识库健康

**示例**：
```
lint the wiki
```

**输出**：生成健康报告 `wiki/meta/lint-report-YYYY-MM-DD.md`

**何时使用**：每 10-15 次摄取后，或每周一次
</details>

---

<details>
<summary><b>wiki-save - 保存对话</b></summary>

**功能**：将当前对话保存到 Wiki。

**工作方式**：
1. 分析对话内容
2. 确定笔记类型（synthesis, concept, source, decision, session）
3. 创建 Wiki 页面，包含完整 frontmatter
4. 更新 index.md
5. 更新 log.md
6. 更新 hot.md

**笔记类型**：

| 类型 | 文件夹 | 使用场景 |
|------|--------|---------|
| synthesis | wiki/questions/ | 多步分析、对比、回答特定问题 |
| concept | wiki/concepts/ | 解释或定义想法、模式、框架 |
| source | wiki/sources/ | 外部材料的摘要 |
| decision | wiki/meta/ | 架构、项目或战略决策 |
| session | wiki/meta/ | 完整会话摘要 |

**使用场景**：
- 保存有价值的对话
- 记录重要决策
- 保留研究结果

**示例**：
```
# 保存当前对话
/save

# 指定名称保存
/save 技术学习笔记

# 指定类型保存
/save --type concept 微服务概念
```

**何时使用**：对话中有值得保留的内容时
</details>

---

<details>
<summary><b>wiki-autoresearch - 自动研究</b></summary>

**功能**：自动搜索、整理、归档研究结果到 Wiki。

**工作方式**：
1. 分解主题为 3-5 个搜索角度
2. 执行网络搜索（每个角度 2-3 次）
3. 获取并分析结果（每个角度前 2-3 个）
4. 识别缺失或矛盾的信息
5. 针对性补充搜索
6. 创建 Wiki 页面（源、实体、概念）
7. 交叉引用所有页面
8. 更新 index 和 log

**研究循环**：
```
Round 1: 广泛搜索
  - 分解为 3-5 个角度
  - 每个角度执行 2-3 次搜索
  - 获取前 2-3 个结果

Round 2: 补充搜索
  - 识别缺失或矛盾的信息
  - 针对性搜索（最多 5 次查询）

Round 3: 综合检查（可选）
  - 如果仍有重大缺口，再进行一轮
```

**使用场景**：
- 深入研究某个主题
- 收集多方观点
- 建立主题知识库

**示例**：
```
/wiki-autoresearch .NET 10 新特性
/wiki-autoresearch Blazor 最佳实践
/wiki-autoresearch 微服务架构设计
```

**输出**：创建多个 Wiki 页面，包括源、实体、概念，并交叉引用。

**何时使用**：需要深入研究某个主题时
</details>

---

<details>
<summary><b>wiki-canvas - 可视化图谱</b></summary>

**功能**：创建和管理可视化知识图谱。

**工作方式**：
1. 创建或打开画布
2. 添加笔记、文本、图片到画布
3. 管理区域
4. 显示画布状态

**命令**：
```
/wiki-canvas                           # 查看状态
/wiki-canvas new "技术学习"             # 创建新画布
/wiki-canvas add note [.NET 10]        # 添加 Wiki 页面
/wiki-canvas add text "关键洞察"        # 添加文本
/wiki-canvas zone "Product"            # 添加区域
/wiki-canvas list                      # 列出所有节点
```

**使用场景**：
- 创建知识图谱
- 项目仪表板
- 研究综合板
- 会议笔记可视化

**何时使用**：需要可视化知识关联时
</details>

---

<details>
<summary><b>wiki-think - 深度思考</b></summary>

**功能**：用 10 原则框架分析复杂问题。

**10 原则**：
1. **OBSERVE (外部)** - 收集数据，观察环境
2. **OBSERVE (内部)** - 反思偏见，自我觉察
3. **LISTEN** - 倾听需求，理解用户意图
4. **THINK** - 分析问题，第一性原理
5. **CONNECT (横向)** - 关联思考，找到隐藏联系
6. **CONNECT (系统)** - 整体思考，系统编排
7. **FEEL** - 直觉判断，情感智能
8. **ACCEPT** - 接受现实，放弃沉没成本
9. **CREATE** - 产出方案，生成输出
10. **GROW** - 迭代改进，反馈循环

**使用场景**：
- 架构决策
- 事后分析
- 模糊的用户需求
- 多方利益权衡
- 审计和评估

**示例**：
```
/wiki-think 我应该如何开始构建项目？
/wiki-think 如何平衡求职和创业？
/wiki-think 选择什么技术栈最合适？
```

**输出**：AI 会按 10 个原则逐步分析你的问题，给出结构化的思考过程。

**何时使用**：遇到复杂问题需要深度分析时
</details>

---

## 对比 Karpathy LLM Wiki Pattern

| Karpathy 要点 | 我们的实现 | 状态 |
|--------------|-----------|------|
| 持久化 Wiki | wiki/ 目录 | ✅ |
| 三层架构 | .raw/ → wiki/ → skills | ✅ |
| Ingest 操作 | wiki-ingest | ✅ |
| Query 操作 | wiki-query | ✅ |
| Lint 操作 | wiki-lint | ✅ |
| index.md | 内容索引 | ✅ |
| log.md | 时间日志 | ✅ |
| Hot Cache | hot.md | ✅ |
| 交叉引用 | wikilinks | ✅ |
| 矛盾标记 | [!contradiction] | ✅ |
| 可视化 | wiki-canvas | ✅ |
| 深度思考 | wiki-think | ✅ |
| 自动研究 | wiki-autoresearch | ✅ |

---

## FAQ

**Q: Obsidian 是免费的吗？**
是的，核心功能完全免费。

**Q: 数据安全吗？**
是的，所有数据都在本地。

**Q: 如何更新？**
```powershell
git pull
```

**Q: 遇到问题？**
在 GitHub 提交 Issue。
