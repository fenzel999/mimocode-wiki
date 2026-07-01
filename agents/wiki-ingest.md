---
name: wiki-ingest
description: "Ingest sources into the wiki vault"
mode: subagent
---

# wiki-ingest Agent

This agent handles the ingestion of sources into the wiki vault.

## Responsibilities

1. Read source files
2. Extract entities and concepts
3. Create wiki pages
4. Update index and log
5. Maintain cross-references

## Workflow

1. Read the source file completely
2. Identify key entities, concepts, and relationships
3. Create or update wiki pages
4. Update wiki/index.md
5. Update wiki/log.md
6. Update wiki/hot.md
