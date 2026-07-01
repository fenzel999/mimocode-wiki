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

| 命令 | 功能 |
|------|------|
| `/wiki` | 初始化 Wiki，选择组织模式 |
| `ingest 文件` | 添加知识到 Wiki |
| `query: 问题` | 从 Wiki 查询答案 |
| `/wiki-save` | 保存当前对话 |
| `/wiki-autoresearch 主题` | 自动研究并归档 |
| `/wiki-canvas` | 可视化知识图谱 |
| `/wiki-think 问题` | 10 原则深度思考 |
| `lint the wiki` | 检查 Wiki 健康 |

### 第三步：示例

**初始化 Wiki**：
```
/wiki
```
AI 会问你："这个 Wiki 用来做什么？"，然后自动创建结构。

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
/wiki-autoresearch .NET 10 新特性
```

**保存对话**：
```
/wiki-save 技术学习笔记
```

## 技能说明

| 技能 | 功能 |
|------|------|
| wiki | Wiki 主入口，初始化和管理 |
| wiki-ingest | 添加文件到 Wiki |
| wiki-query | 从 Wiki 查询答案 |
| wiki-lint | 检查 Wiki 健康状态 |
| wiki-save | 保存对话到 Wiki |
| wiki-autoresearch | 自动研究并归档 |
| wiki-canvas | 可视化知识图谱 |
| wiki-think | 10 原则深度思考 |

## FAQ

**Q: Obsidian 是免费的吗？**
是的，核心功能完全免费。

**Q: 数据安全吗？**
是的，所有数据都在本地。

**Q: 如何更新？**
```powershell
git pull
```
