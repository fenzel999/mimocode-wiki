# mimocode-wiki Plugin 优化计划

## 目标

创建一个干净、简洁、易用的 MimoCode Plugin。

## 设计原则

1. **一个入口**：用户只需要知道一个命令
2. **自动路由**：AI 自动判断该做什么
3. **可视化**：直接联动 Obsidian
4. **简单**：不需要记忆复杂命令

## 项目结构

```
mimocode-wiki/
├── tools/
│   └── wiki.ts              # 唯一的工具入口
├── skills/                   # 技能文件（AI 的指令）
├── install.ps1              # 一键安装
├── uninstall.ps1            # 一键卸载
├── README.md                # 简单说明
└── package.json
```

## 核心设计

### 一个工具，多种操作

用户只需要输入：
```
/wiki [操作] [参数]
```

AI 自动判断：
- `/wiki` → 初始化
- `/wiki ingest 文件` → 摄取
- `/wiki query 问题` → 查询
- `/wiki lint` → 健康检查
- `/wiki save` → 保存
- `/wiki research 主题` → 研究
- `/wiki canvas` → 可视化
- `/wiki think 问题` → 思考
- `/wiki setup` → 设置 Obsidian

### 界面设计

```
/wiki
┌─────────────────────────────────────┐
│  mimocode-wiki                      │
│                                     │
│  [初始化]  [摄取]  [查询]           │
│  [保存]    [研究]  [可视化]         │
│  [思考]    [检查]  [设置]           │
│                                     │
└─────────────────────────────────────┘
```

## 实现步骤

1. 创建 wiki.ts 工具
2. 实现路由逻辑
3. 更新安装脚本
4. 更新 README
5. 测试

## 兼容性

- MimoCode：✅ 使用 tool() 辅助函数
- Karpathy Pattern：✅ 三层架构
- Obsidian：✅ 直接联动
