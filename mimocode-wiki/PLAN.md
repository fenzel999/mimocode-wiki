# mimocode-wiki Plugin 计划

## 目标

将 mimocode-wiki 转换为 MimoCode Plugin，实现：
1. 直接联动 Obsidian
2. 自动下载所需插件
3. 完全兼容 MimoCode
4. 完全兼容 Karpathy LLM Wiki Pattern

## 项目结构

```
mimocode-wiki/
├── tools/                     # TypeScript 工具
│   ├── wiki-init.ts          # 初始化 Wiki
│   ├── wiki-ingest.ts        # 摄取源文件
│   ├── wiki-query.ts         # 查询知识
│   ├── wiki-lint.ts          # 健康检查
│   ├── wiki-save.ts          # 保存对话
│   ├── wiki-autoresearch.ts  # 自动研究
│   ├── wiki-canvas.ts        # 可视化图谱
│   ├── wiki-think.ts         # 深度思考
│   └── obsidian-setup.ts     # Obsidian 设置
├── skills/                    # 技能文件（保留）
├── install.ps1               # 安装脚本
├── uninstall.ps1             # 卸载脚本
├── README.md                 # 使用说明
└── package.json              # 依赖配置
```

## 工具清单

### 1. wiki-init.ts
- 功能：初始化 Wiki 结构
- 参数：mode (string) - Wiki 模式
- 输出：创建 wiki/ 目录和文件

### 2. wiki-ingest.ts
- 功能：摄取源文件到 Wiki
- 参数：source (string) - 文件路径或 URL
- 输出：创建 Wiki 页面，更新索引

### 3. wiki-query.ts
- 功能：从 Wiki 查询答案
- 参数：query (string), mode (string) - 查询模式
- 输出：综合答案

### 4. wiki-lint.ts
- 功能：检查 Wiki 健康状态
- 参数：无
- 输出：健康报告

### 5. wiki-save.ts
- 功能：保存对话到 Wiki
- 参数：title (string), type (string)
- 输出：创建 Wiki 页面

### 6. wiki-autoresearch.ts
- 功能：自动研究
- 参数：topic (string)
- 输出：研究结果

### 7. wiki-canvas.ts
- 功能：可视化图谱
- 参数：action (string), data (any)
- 输出：画布操作

### 8. wiki-think.ts
- 功能：10 原则深度思考
- 参数：problem (string)
- 输出：结构化思考

### 9. obsidian-setup.ts
- 功能：设置 Obsidian 和插件
- 参数：无
- 输出：配置完成

## 实现步骤

### 步骤 1：创建 package.json
### 步骤 2：创建工具文件
### 步骤 3：更新安装脚本
### 步骤 4：更新 README
### 步骤 5：测试

## 兼容性

### MimoCode 兼容
- 使用 tool() 辅助函数
- 放在 .mimocode/tools/ 目录
- 使用 tool.schema 定义参数

### Karpathy LLM Wiki Pattern 兼容
- 三层架构：.raw/ → wiki/ → tools/
- 操作：Ingest, Query, Lint
- 索引：index.md + log.md
- Hot Cache：hot.md
