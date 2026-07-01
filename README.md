# mimocode-wiki

AI 驱动的个人知识管理系统，专为 MimoCode 打造。

## 安装

```powershell
.\install.ps1
```

## 使用

输入 `/wiki` 开始：

```
/wiki                          # 初始化 Wiki
/wiki ingest .raw/article.md   # 添加知识
/wiki query 问题               # 查询知识
/wiki lint                     # 健康检查
/wiki save                     # 保存对话
/wiki research 主题            # 自动研究
/wiki canvas                   # 可视化图谱
/wiki think 问题               # 深度思考
/wiki setup                    # 设置 Obsidian
```

## 卸载

```powershell
.\uninstall.ps1
```

## 示例

**初始化 Wiki**：
```
/wiki
```

**添加知识**：
```
/wiki ingest .raw/article.md
```

**查询知识**：
```
/wiki query 我之前学过什么？
```

**深度研究**：
```
/wiki research .NET 10 新特性
```

## FAQ

**Q: Obsidian 是免费的吗？**
是的，核心功能完全免费。

**Q: 数据安全吗？**
是的，所有数据都在本地。
