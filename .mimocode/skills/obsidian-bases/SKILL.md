---
name: obsidian-bases
description: "Create and edit Obsidian Bases (.base files): Obsidian's native database layer for dynamic tables, card views, list views, filters, formulas, and summaries over vault notes. Triggers on: create a base, add a base file, obsidian Bases, base view, filter notes, formula, database view, dynamic table, task tracker base, reading list base."
---

# obsidian-bases: Obsidian's Database Layer

Obsidian Bases turns vault notes into queryable, dynamic views. Tables, cards, lists. Defined in `.base` files. Core Obsidian feature (v1.9.10+).

---

## File Format

`.base` files contain valid YAML:

```yaml
filters:
  and:
    - file.hasTag("wiki")
    - 'status != "archived"'

formulas:
  age_days: '(now() - file.ctime).days.round(0)'
  status_icon: 'if(status == "mature", "✅", "🔄")'

properties:
  status:
    displayName: "Status"

views:
  - type: table
    name: "All Pages"
    order:
      - file.name
      - type
      - status
      - updated
      - formula.age_days
```

---

## Filters

```yaml
# AND
filters:
  and:
    - 'status != "archived"'
    - file.hasTag("wiki")

# OR
filters:
  or:
    - file.hasTag("concept")
    - file.hasTag("entity")

# NOT
filters:
  not:
    - file.inFolder("wiki/meta")
```

### Filter Functions

| Function | Example |
|----------|---------|
| `file.hasTag("x")` | Notes with tag |
| `file.inFolder("path/")` | Notes in folder |
| `file.hasLink("Note")` | Notes linking to Note |

---

## Formulas

```yaml
formulas:
  age_days: '(now() - file.ctime).days.round(0)'
  days_until: 'if(due_date, (date(due_date) - today()).days, "")'
  status_icon: 'if(status == "mature", "✅", "🔄")'
```

**Key rule**: Subtract dates returns Duration. Always access `.days` first.

---

## View Types

### Table
```yaml
views:
  - type: table
    name: "Wiki Index"
    order:
      - file.name
      - type
      - status
    groupBy:
      property: type
```

### Cards
```yaml
views:
  - type: cards
    name: "Gallery"
    order:
      - file.name
      - tags
```

### List
```yaml
views:
  - type: list
    name: "Quick List"
    order:
      - file.name
```

---

## Wiki Vault Templates

### All Wiki Pages
```yaml
filters:
  and:
    - file.inFolder("wiki/")
    - not:
        - file.inFolder("wiki/meta")
views:
  - type: table
    name: "All Wiki Pages"
    order:
      - file.name
      - type
      - status
      - updated
```

### Entity Index
```yaml
filters:
  and:
    - file.inFolder("wiki/entities/")
views:
  - type: table
    name: "Entities"
    order:
      - file.name
      - entity_type
```

---

## Where to Save

Store `.base` files in `wiki/meta/`:
- `wiki/meta/dashboard.base`: main view
- `wiki/meta/entities.base`: entity tracker
- `wiki/meta/sources.base`: ingestion log

---

## What Not to Do

- Do not use `from:` or `where:` (Dataview syntax)
- Do not use `sort:` at root level
- Do not reference `formula.X` without defining it
