# mimocode-wiki

AI 驱动的个人知识管理系统，专为 MimoCode 打造。

## 一键安装

```powershell
.\bin\install.ps1
```

## 一键卸载

```powershell
.\bin\uninstall.ps1
```

## 使用方法

### 1. 安装后

1. 打开 Obsidian
2. 选择此目录作为 Vault
3. 安装插件：Templater, Obsidian Git, Dataview
4. 打开 MimoCode，输入 `/wiki`

### 2. 常用命令

| 命令 | 功能 |
|------|------|
| `/wiki` | 初始化 Wiki |
| `ingest 文件` | 添加知识 |
| `query: 问题` | 查询知识 |
| `/save` | 保存对话 |
| `/autoresearch 主题` | 自动研究 |
| `/canvas` | 可视化图谱 |
| `/think 问题` | 深度思考 |
| `lint the wiki` | 健康检查 |

### 3. 示例

**添加知识**：
```
ingest .raw/article.md
```

**查询知识**：
```
query: .NET 10 有什么新特性？
```

**深度研究**：
```
/autoresearch Blazor 最佳实践
```

## 卸载

运行 `.\bin\uninstall.ps1` 即可。只删除本项目的插件，不影响其他插件。
