# mimocode-wiki

AI 驱动的个人知识管理系统，专为 MimoCode 打造。

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

## 技能详解

### wiki - Wiki 主入口

**功能**：初始化 Wiki 结构，检查状态，显示最近活动。

**工作方式**：
1. 检查 wiki/ 目录是否存在
2. 如果不存在，创建完整结构
3. 创建 index.md, hot.md, log.md, overview.md
4. 创建子目录：sources, entities, concepts, domains, questions

**示例**：
```
/wiki
```
AI 会问你："这个 Wiki 用来做什么？"，然后自动创建结构。

---

### wiki-ingest - 添加知识

**功能**：将文件添加到 Wiki。读取文件，提取实体和概念，创建 Wiki 页面。

**工作方式**：
1. 读取源文件
2. 提取实体（人物、组织、产品）
3. 提取概念（想法、模式、框架）
4. 创建或更新 Wiki 页面
5. 更新 index.md 和 log.md
6. 交叉引用相关页面

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

---

### wiki-query - 查询知识

**功能**：从 Wiki 中查找答案。读取热点缓存、索引、相关页面，综合回答。

**工作方式**：
1. 读取 hot.md（最近上下文）
2. 读取 index.md（所有页面目录）
3. 找到相关页面（3-5 个）
4. 读取那些页面
5. 综合回答并引用来源

**三种模式**：

| 模式 | 触发方式 | 读取内容 | 适用场景 |
|------|---------|---------|---------|
| Quick | `query quick: ...` | 仅 hot.md + index.md | 简单事实查询 |
| Standard | `query: ...` | hot.md + index + 3-5 页面 | 大多数问题 |
| Deep | `query deep: ...` | 全部相关页面 | 深度分析 |

**示例**：
```
# 快速查询
query quick: .NET 10 是什么？

# 标准查询
query: 我之前学过什么？

# 深度查询
query deep: 全面分析 Blazor 的优缺点
```

---

### wiki-lint - 健康检查

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

**示例**：
```
lint the wiki
```

**输出**：生成健康报告 `wiki/meta/lint-report-YYYY-MM-DD.md`

---

### wiki-save - 保存对话

**功能**：将当前对话保存到 Wiki。

**工作方式**：
1. 分析对话内容
2. 确定笔记类型（synthesis, concept, source, question）
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

**示例**：
```
# 保存当前对话
/save

# 指定名称保存
/save 技术学习笔记
```

---

### wiki-autoresearch - 自动研究

**功能**：自动搜索、整理、归档研究结果到 Wiki。

**工作方式**：
1. 分解主题为 3-5 个搜索角度
2. 执行网络搜索
3. 获取并分析结果
4. 创建 Wiki 页面（源、实体、概念）
5. 交叉引用所有页面
6. 更新 index 和 log

**研究循环**：
```
Round 1: 广泛搜索
  - 分解为 3-5 个角度
  - 每个角度执行 2-3 次搜索
  - 获取前 2-3 个结果

Round 2: 补充搜索
  - 识别缺失或矛盾的信息
  - 针对性搜索

Round 3: 综合检查（可选）
  - 如果仍有重大缺口，再进行一轮
```

**示例**：
```
/wiki-autoresearch .NET 10 新特性
/wiki-autoresearch Blazor 最佳实践
/wiki-autoresearch 微服务架构设计
```

**输出**：创建多个 Wiki 页面，包括源、实体、概念，并交叉引用。

---

### wiki-canvas - 可视化图谱

**功能**：创建和管理可视化知识图谱。

**工作方式**：
1. 创建或打开画布
2. 添加笔记、文本、图片到画布
3. 管理区域
4. 显示画布状态

**示例**：
```
# 查看状态
/wiki-canvas

# 创建新画布
/wiki-canvas new "技术学习"

# 添加 Wiki 页面
/wiki-canvas add note [.NET 10]

# 添加文本
/wiki-canvas add text "关键洞察"

# 添加区域
/wiki-canvas zone "Product"

# 列出所有节点
/wiki-canvas list
```

**输出**：在 Obsidian 中打开 `wiki/canvases/` 目录查看图谱。

---

### wiki-think - 深度思考

**功能**：用 10 原则框架分析复杂问题。

**10 原则**：
1. **OBSERVE (外部)** - 收集数据
2. **OBSERVE (内部)** - 反思偏见
3. **LISTEN** - 倾听需求
4. **THINK** - 分析问题
5. **CONNECT (横向)** - 关联思考
6. **CONNECT (系统)** - 整体思考
7. **FEEL** - 直觉判断
8. **ACCEPT** - 接受现实
9. **CREATE** - 产出方案
10. **GROW** - 迭代改进

**示例**：
```
/wiki-think 我应该如何开始构建项目？
/wiki-think 如何平衡求职和创业？
/wiki-think 选择什么技术栈最合适？
```

**输出**：AI 会按 10 个原则逐步分析你的问题，给出结构化的思考过程。

---

## 工作流程

```
用户输入命令
    ↓
MimoCode 加载对应技能
    ↓
AI 按技能指令执行
    ↓
读取/更新 Wiki
    ↓
返回结果
```

## Token 优化

系统分层加载，按需读取：

| 文件 | 内容 | Token 消耗 |
|------|------|-----------|
| hot.md | 最近上下文（500字） | ~500 |
| index.md | 目录索引 | ~1000 |
| 具体页面 | 单个页面 | ~300/页 |

**对比**：
- 不优化：加载整个 Wiki → 数万 token
- 优化后：只加载需要的 → 数千 token

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
