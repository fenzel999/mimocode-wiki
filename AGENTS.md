# Wiki Knowledge Base

Mode: D (Personal / Second Brain)
Purpose: Persistent knowledge wiki managed by MiMoCode
Created: 2026-07-01

## Structure

```
.wiki/
├── .raw/           # Immutable source documents
├── wiki/           # LLM-generated knowledge base
│   ├── index.md    # Master catalog
│   ├── log.md      # Chronological log
│   ├── hot.md      # Hot cache (recent context)
│   ├── overview.md # Executive summary
│   ├── sources/    # Source summaries
│   ├── entities/   # People, orgs, products
│   ├── concepts/   # Ideas, patterns, frameworks
│   ├── domains/    # Topic areas
│   ├── comparisons/ # Side-by-side analyses
│   ├── questions/  # Filed answers
│   ├── meta/       # Dashboards, lint reports
│   └── canvases/   # Visual reference boards
├── _templates/     # Note templates
├── _attachments/   # Images and files
└── AGENTS.md       # This file
```

## Conventions

- All notes use YAML frontmatter: type, status, created, updated, tags (minimum)
- Wikilinks use [[Note Name]] format: filenames are unique, no paths needed
- .raw/ contains source documents: never modify them
- wiki/index.md is the master catalog: update on every ingest
- wiki/log.md is append-only: never edit past entries
- New log entries go at the TOP of the file

## Operations

- Ingest: drop source in .raw/, say "ingest [filename]"
- Query: ask any question: AI reads index first, then drills in
- Lint: say "lint the wiki" to run a health check
- Save: say "save this" or "/save" to file conversation
- Research: say "/autoresearch [topic]" for deep research
- Canvas: say "/canvas" for visual reference boards
- Think: say "/think [problem]" for structured thinking
- Archive: move cold sources to .archive/ to keep .raw/ clean

## Wiki Knowledge Base Reference

When you need context from this wiki in other projects:
1. Read wiki/hot.md first (recent context, ~500 words)
2. If not enough, read wiki/index.md (full catalog)
3. If you need domain specifics, read wiki/<domain>/_index.md
4. Only then read individual wiki pages
