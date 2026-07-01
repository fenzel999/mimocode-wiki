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

## 使用方法

### 第一步：安装后

1. 打开 Obsidian
2. 选择此目录作为 Vault
3. 安装插件：Templater, Obsidian Git, Dataview
4. 打开 MimoCode，输入 `/wiki`

### 第二步：核心命令

| 命令 | 功能 | 示例 |
|------|------|------|
| `/wiki` | 初始化 Wiki | `/wiki` |
| `ingest 文件` | 添加知识到 Wiki | `ingest .raw/article.md` |
| `query: 问题` | 从 Wiki 查询答案 | `query: .NET 10 有什么新特性？` |
| `/save` | 保存当前对话 | `/save 我的学习笔记` |
| `/autoresearch 主题` | 自动研究并归档 | `/autoresearch Blazor 最佳实践` |
| `/canvas` | 可视化知识图谱 | `/canvas` |
| `/think 问题` | 10 原则深度思考 | `/think 如何设计微服务架构？` |
| `lint the wiki` | 检查 Wiki 健康 | `lint the wiki` |

### 第三步：示例

**添加知识**：
```
ingest .raw/article.md
```

**查询知识**：
```
query: 我之前学过什么？
```

**深度研究**：
```
/autoresearch .NET 10 新特性
```

**保存对话**：
```
/save 技术学习笔记
```

## 技能说明

### wiki
Wiki 主入口。初始化 Wiki 结构，检查状态，显示最近活动。

### wiki-ingest
将文件添加到 Wiki。读取文件，提取实体和概念，创建 Wiki 页面。

### wiki-query
从 Wiki 查询答案。读取热点缓存、索引、相关页面，综合回答。

### wiki-lint
检查 Wiki 健康状态。查找孤立页面、死链接、缺失内容。

### save
保存当前对话到 Wiki。分析对话内容，创建 Wiki 页面。

### autoresearch
自动研究。搜索、整理、归档研究结果到 Wiki。

### canvas
可视化图谱。创建和管理知识图谱。

### think
深度思考。用 10 原则框架分析复杂问题。

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
