---
name: wiki-retrieve
description: "Hybrid retrieval primitive for the Compound Vault. Replaces the static hot→index→drill read order with contextual-prefix + BM25 + cosine-rerank. Opt-in via setup script; feature-detected by wiki-query and autoresearch. Triggers on: retrieve, hybrid retrieval, BM25, rerank, contextual retrieval, search the chunks, chunk search, vault search, semantic search, what chunks match, find relevant passages."
---

# wiki-retrieve: Hybrid Retrieval over the Vault

Page-level granularity loses to chunk-level granularity when the answer lives in a specific passage rather than a whole page. This skill is the chunk-level upgrade.

---

## Architecture

```
INGEST (one-time, then incremental):

  wiki/<page>.md
       │
       ▼
  scripts/contextual-prefix.py
       │   ├─ chunk on paragraph boundaries (~500 token target)
       │   ├─ generate 1-2 sentence prefix per chunk
       │   └─ write .vault-meta/chunks/<address>/chunk-NNN.json
       │
       ▼
  scripts/bm25-index.py build
       └─ inverted index over chunks → .vault-meta/bm25/index.json

QUERY:

  query string
       │
       ▼
  scripts/retrieve.py "<query>" --top 5
       ├─ bm25-index.py query "<query>" --top 20
       ├─ rerank.py "<query>" --candidates -
       │     cosine(query_embedding, chunk_embedding)
       └─ dedupe by page-address, return top-N candidates
```

---

## Feature Detection

```bash
[ -x scripts/retrieve.py ] && [ -d .vault-meta/chunks ] && \
  [ -f .vault-meta/bm25/index.json ] && \
  echo "wiki-retrieve installed" || echo "fallback: legacy hot→index→drill"
```

---

## Setup

```bash
bash bin/setup-retrieve.sh
```

Flags:
- `--check` — diagnostics only
- `--no-llm` — force synthetic prefix (zero LLM dependency)
- `--rebuild` — re-chunk every page

---

## Usage

### Standard retrieve
```bash
python3 scripts/retrieve.py "your question here" --top 5
```

### BM25-only (skip rerank)
```bash
python3 scripts/retrieve.py "query" --top 5 --no-rerank
```

### Explain mode
```bash
python3 scripts/retrieve.py "query" --top 5 --explain
```

---

## Index Maintenance

After substantive ingest sessions:

```bash
python3 scripts/contextual-prefix.py --all
python3 scripts/bm25-index.py build
```

---

## Integration with wiki-query

After installation, wiki-query standard and deep modes will:
1. Read `wiki/hot.md` (always)
2. Call `python3 scripts/retrieve.py "<query>" --top 5`
3. Read candidate pages
4. Synthesize with chunk-level citation
