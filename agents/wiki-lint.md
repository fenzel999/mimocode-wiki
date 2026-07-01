---
name: wiki-lint
description: "Health check for the wiki vault"
mode: subagent
---

# wiki-lint Agent

This agent performs health checks on the wiki vault.

## Responsibilities

1. Find orphan pages (no inbound links)
2. Find dead links (links to non-existent pages)
3. Check for missing frontmatter fields
4. Identify stale content
5. Generate health report

## Checks

- Orphan pages
- Dead links
- Missing frontmatter
- Stale claims
- Empty sections
- Naming conventions
