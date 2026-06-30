---
name: wiki-fold
description: "Rollup of wiki log entries into meta-pages. Reads the last 2^k entries from wiki/log.md, writes a structurally-idempotent fold page to wiki/folds/ that links back to children. Extractive summarization (no invention). Dry-run by default, stdout-only; commit mode writes. Triggers on: fold the log, run a fold, run wiki-fold, log rollup, roll up log entries."
---

# wiki-fold: Extractive Log Rollup

Implements flat fold over raw `wiki/log.md` entries. A fold is additive (children never modified) and extractive (no invented facts).

---

## Modes

| Mode | Writes? | Invocation |
|---|---|---|
| **dry-run (default)** | No Write tool calls. Stdout only. | `fold the log, dry-run k=3` |
| **commit** | Uses Write/Edit tools. | `fold the log, commit k=3` |

---

## Parameters

- `k` (default 4): batch exponent. Batch size = `2^k`.
- `range` (optional): explicit entry range. Overrides k.
- `--force`: overwrite existing fold.
- `--commit`: write to wiki/.

If fewer than `2^k` log entries exist, report and stop.

---

## Deterministic Fold ID

```
fold-k{K}-from-{EARLIEST-DATE}-to-{LATEST-DATE}-n{COUNT}
```

Example: `fold-k3-from-2026-04-10-to-2026-04-23-n8`

---

## Procedure

### 1. Parse log entries
```bash
grep -n "^## \[" wiki/log.md | head -{2^k}
```

### 2. Extract child page identifiers
Build structured children list from each entry.

### 3. Read referenced pages (bounded)
Budget: 0-15 page reads per fold.

### 4. Extractive summarization
- Every outcome must cite a specific child entry
- Count checks enforced
- No merging across entries without naming them

### 5. Self-check
- Every child in frontmatter appears in table
- Every numeric claim is grep-verifiable
- Fold ID is deterministic and file doesn't exist

### 6. Emit

**Dry-run**: Bash `cat <<'EOF' ... EOF` to stdout.

**Commit**:
1. Write fold page to `wiki/folds/{FOLD-ID}.md`
2. Edit `wiki/index.md` to add fold link
3. Edit `wiki/log.md` to prepend fold entry

---

## Invariants

1. Structural idempotency: same range + same k = same fold ID
2. Additive: children never modified
3. Bounded reads: 0-15 child-page reads per fold
4. Extractive: zero invented facts
