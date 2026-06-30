---
name: wiki-mode
description: "Methodology modes for the Compound Vault. Lets the vault declare an organizational style (LYT / PARA / Zettelkasten / Generic) that wiki-ingest, save, and autoresearch consult before filing new pages. Triggers on: set vault mode, switch to PARA, use LYT, what's my vault mode, zettelkasten setup, wiki mode, methodology mode, change mode, configure mode."
---

# wiki-mode: Methodology Modes

Declare an organizational style for the vault. Other skills consult this mode before filing new pages.

---

## The Four Modes

### LYT (Linking Your Thinking)
- **Philosophy:** Notes link, folders don't. MOCs (Maps of Content) are the navigation primitive.
- **Filing:** `wiki/mocs/<topic>-moc.md` + `wiki/notes/<atomic-note>.md`

### PARA (Tiago Forte)
- **Philosophy:** Organize by actionability. Projects, Areas, Resources, Archives.
- **Filing:** `wiki/projects/`, `wiki/areas/`, `wiki/resources/`, `wiki/archives/`

### Zettelkasten (Niklas Luhmann)
- **Philosophy:** Atomic notes, unique IDs, dense bidirectional linking, no folders.
- **Filing:** `wiki/<YYYYMMDDHHMMSSffffff>-<slug>.md` (flat, timestamped)

### Generic (default)
- **Philosophy:** No opinion. Default v1.7 behavior.
- **Filing:** `wiki/sources/`, `wiki/entities/`, `wiki/concepts/`

---

## How to Set the Mode

Check `.vault-meta/mode.json`. If absent, mode = generic.

```json
{
  "mode": "generic",
  "description": "Personal Second Brain",
  "set_at": "2026-07-01"
}
```

To change mode, update this file.

---

## Routing Table

| Content type | Generic | LYT | PARA | Zettelkasten |
|---|---|---|---|---|
| New source | `wiki/sources/foo.md` | `wiki/notes/foo.md` | `wiki/resources/<topic>/foo.md` | `wiki/<ID>-foo.md` |
| New entity | `wiki/entities/<Name>.md` | `wiki/notes/<Name>.md` | `wiki/resources/people/<Name>.md` | `wiki/<ID>-<name>.md` |
| New concept | `wiki/concepts/<Name>.md` | `wiki/notes/<Name>.md` | `wiki/resources/concepts/<Name>.md` | `wiki/<ID>-<name>.md` |
| Session note | `wiki/sessions/<date>-<topic>.md` | `wiki/notes/<date>-<topic>.md` | `wiki/projects/<project>/<date>-<topic>.md` | `wiki/<ID>-session-<topic>.md` |

---

## Migration

Switching modes does NOT auto-migrate existing files. Manual migration required.
