---
name: wiki-cli
description: "Default vault-mutation transport. Wraps the Obsidian CLI (Obsidian 1.12+) as the preferred way to read, write, search, and modify vault notes. Falls back to direct filesystem Read/Write/Edit when the CLI is unavailable. Triggers on: wiki-cli, obsidian cli, obsidian read, obsidian write, obsidian search, daily note, obsidian create, obsidian append, vault transport, which transport, transport detection, obsidian command line."
---

# wiki-cli: Default Transport Layer

Wraps the Obsidian CLI as the preferred transport for vault mutations. Falls back to filesystem when CLI is unavailable.

---

## Detection

```bash
bash scripts/detect-transport.sh
```

Writes `.vault-meta/transport.json`.

---

## Recipes

### Read a note
```bash
obsidian-cli read "$VAULT" "$NOTE"
# Fallback: Read $VAULT/$NOTE
```

### Create or overwrite a note
```bash
obsidian-cli write "$VAULT" "$NOTE" < /path/to/content.md
# Fallback: Write $VAULT/$NOTE
```

### Append to a note
```bash
echo "content" | obsidian-cli append "$VAULT" "$NOTE"
# Fallback: Read, append, Write back
```

### Search note content
```bash
obsidian-cli search "$VAULT" "<query>"
# Fallback: rg --type=md "<query>" "$VAULT/wiki/"
```

### Patch a frontmatter property
```bash
obsidian-cli property:set "$VAULT" "$NOTE" status "evergreen"
# Fallback: read, parse, mutate, rewrite
```

### List backlinks
```bash
obsidian-cli backlinks "$VAULT" "$NOTE"
# Fallback: rg "\[\[$(basename "$NOTE" .md)" "$VAULT/wiki/"
```

---

## When CLI is NOT the right choice

- Mobile: filesystem write is the only path
- CI / headless: filesystem with manual parsing
- Cross-vault operations: filesystem walks
