---
type: source
title: "C# 14 Features"
created: 2026-07-01
updated: 2026-07-01
tags:
  - source
  - csharp
  - language
status: developing
source_type: documentation
author: "Microsoft"
date_published: "2025-11-18"
url: "https://learn.microsoft.com/dotnet/csharp/whats-new/csharp-14"
confidence: high
key_claims:
  - "Extension members now support properties and static members"
  - "field keyword enables backing field access in properties"
  - "Null-conditional assignment simplifies null checks"
  - "nameof supports unbound generic types"
  - "Partial events and constructors added"
related:
  - "[[.NET 10]]"
  - "[[C# 14]]"
sources:
  - "[[Microsoft Learn Documentation]]"
---

# C# 14 Features

## Summary

C# 14 随 .NET 10 发布，引入了多项语言增强功能。

## Key Features

### 1. Extension Members

新的扩展成员语法支持：
- 扩展属性
- 静态扩展成员
- 用户定义运算符

```csharp
public static class Enumerable
{
    extension<TSource>(IEnumerable<TSource> source)
    {
        // 扩展属性
        public bool IsEmpty => !source.Any();
        
        // 扩展方法
        public IEnumerable<TSource> Where(Func<TSource, bool> predicate) { ... }
    }
}
```

### 2. Field Keyword

允许在属性访问器中直接访问备份字段：

```csharp
public string Message
{
    get;
    set => field = value ?? throw new ArgumentNullException(nameof(value));
}
```

### 3. Null-Conditional Assignment

简化空值检查：

```csharp
// 之前
if (customer is not null)
{
    customer.Order = GetCurrentOrder();
}

// 现在
customer?.Order = GetCurrentOrder();
```

### 4. Unbound Generic Types in nameof

```csharp
nameof(List<>) // 返回 "List"
```

### 5. Lambda Parameter Modifiers

Lambda 表达式参数可以使用修饰符而不需要指定类型：

```csharp
TryParse<int> parse1 = (text, out result) => Int32.TryParse(text, out result);
```

### 6. Partial Events and Constructors

支持声明式 partial 事件和构造函数。

### 7. Implicit Span Conversions

Span<T> 和 ReadOnlySpan<T> 的一等支持。

## Connections

- [[.NET 10]] - 运行时和 SDK 更新
- [[Extension Members]] - 新的扩展机制
- [[Null-Conditional Assignment]] - 空值处理改进

## Notes

C# 14 的主要改进集中在：
1. 扩展性（Extension Members）
2. 简洁性（field keyword, null-conditional assignment）
3. 类型安全（Span 转换）

对于 .NET 架构师，这些改进可以：
- 减少样板代码
- 提高代码可读性
- 增强类型安全
