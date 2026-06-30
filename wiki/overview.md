---
type: overview
title: "Wiki Overview"
created: 2026-07-01
updated: 2026-07-01
tags: [meta, overview]
status: developing
---

# Wiki Overview

**This Wiki is AI 的持久记忆。**

## Purpose

1. **为 AI 提供持久上下文** - 跨会话保持连续性
2. **记录项目决策** - 所有选择和原因
3. **积累知识** - 技术研究、最佳实践
4. **支持创业** - TeamMind 产品开发

## How It Works

```
会话开始 → 读取 hot.md → 恢复上下文 → 工作 → 更新 Wiki
    ↑                                           ↓
    └───────────────────────────────────────────┘
```

## Current Project: TeamMind

**AI 驱动的团队知识持久化平台**

- 技术栈: Blazor + ASP.NET Core + .NET 10 + Aspire
- 目标: 消除知识孤岛，AI 自动维护
- 状态: 计划阶段，准备构建 MVP

## Key Files

| 文件 | 用途 |
|------|------|
| `hot.md` | 最近上下文（每次会话首先读取） |
| `index.md` | 所有页面的目录 |
| `overview.md` | 本文件，项目概览 |
| `log.md` | 操作历史 |

## User Context

- 前 .NET 架构师，技术管理者
- 正在职业转型，探索创业
- 目标: 用 .NET 10 构建 SaaS 产品

## For AI

每次新会话，请：
1. 读取 `hot.md` 恢复最近上下文
2. 读取 `index.md` 了解完整知识库
3. 根据用户问题，读取相关页面
4. 工作完成后，更新 Wiki 保持连续性
