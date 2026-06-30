---
type: source
title: "ASP.NET Core 10 Features"
created: 2026-07-01
updated: 2026-07-01
tags:
  - source
  - aspnetcore
  - web
status: developing
source_type: documentation
author: "Microsoft"
date_published: "2026-04-22"
url: "https://learn.microsoft.com/aspnet/core/release-notes/aspnetcore-10.0"
confidence: high
key_claims:
  - "Blazor improvements including preloading, form validation, and passkey support"
  - "OpenAPI enhancements"
  - "Minimal API updates"
  - "Enhanced diagnostics and metrics"
related:
  - "[[.NET 10]]"
  - "[[Blazor 10]]"
sources:
  - "[[Microsoft Learn Documentation]]"
---

# ASP.NET Core 10 Features

## Summary

ASP.NET Core 10 引入了多项新功能和增强，重点关注 Blazor 改进、OpenAPI 增强和 Minimal API 更新。

## Blazor Improvements

### 1. Blazor Script as Static Web Asset
- 从嵌入式资源改为静态 web 资源
- 自动压缩和指纹识别

### 2. Route Template Highlights
- 路由属性支持语法高亮

### 3. NavigateTo Same-Page Navigation
- 同页面导航不再滚动到顶部

### 4. Reconnection UI Component
- 新增 ReconnectModal 组件
- 改进断线重连体验

### 5. QuickGrid Enhancements
- RowClass 参数支持行样式
- HideColumnOptionsAsync 方法

### 6. HttpClient Response Streaming
- 默认启用响应流

### 7. Client-Side Fingerprinting
- 支持客户端静态资源指纹

### 8. Preloaded Framework Assets
- 预加载框架静态资源

### 9. Declarative State Persistence
- 声明式状态持久化
- [PersistentState] 属性

### 10. JavaScript Interop Enhancements
- InvokeConstructorAsync
- GetValueAsync/SetValueAsync

### 11. Passkey Support
- WebAuthn API 支持
- 无密码认证

### 12. Circuit State Persistence
- 会话状态持久化
- 支持浏览器标签节流

### 13. Hot Reload for WebAssembly
- WebAssembly 热重载支持

### 14. Improved Form Validation
- 嵌套对象验证
- 集合项验证
- 源生成器实现

### 15. NotFoundPage Parameter
- 路由器 NotFoundPage 参数
- 改进 404 处理

## Minimal API Updates

- OpenAPI 增强
- 端点组改进
- 参数绑定优化

## Connections

- [[.NET 10]] - 运行时和 SDK 更新
- [[Blazor 10]] - UI 框架详细更新
- [[Minimal APIs]] - API 开发模式

## Notes

ASP.NET Core 10 的 Blazor 改进非常显著，特别是：
1. 声明式状态持久化简化了代码
2. Passkey 支持增强了安全性
3. 表单验证改进提升了开发体验

对于 .NET 架构师，重点关注：
- Blazor 在企业应用中的适用性
- Passkey 认证对安全架构的影响
- 声明式状态持久化对性能的提升
