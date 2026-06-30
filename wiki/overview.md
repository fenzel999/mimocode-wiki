---
type: overview
title: "Wiki Overview"
created: 2026-07-01
updated: 2026-07-01
tags: [meta, overview]
status: developing
---

# Wiki Overview

This is a personal knowledge management system built using the Karpathy LLM Wiki Pattern.

## Purpose

To create a persistent, compounding knowledge base where:
- Every source gets integrated
- Every question pulls from everything that has been read
- Knowledge compounds like interest

## Structure

The wiki is organized into:
- **Sources**: Summaries of external materials
- **Entities**: People, organizations, products, repositories
- **Concepts**: Ideas, patterns, frameworks
- **Domains**: Top-level topic areas
- **Questions**: Filed answers to user queries
- **Comparisons**: Side-by-side analyses

## How to Use

1. **Ingest**: Drop source files into `.raw/` and say "ingest [filename]"
2. **Query**: Ask any question - the AI reads the index first, then drills into relevant pages
3. **Lint**: Say "lint the wiki" to run a health check
4. **Save**: Say "/save" to save the current conversation as a wiki page
5. **Research**: Say "/autoresearch [topic]" for autonomous research
6. **Canvas**: Say "/canvas" for visual knowledge maps

## Current State

- Pages created: 4 (meta pages)
- Sources ingested: 0
- Last updated: 2026-07-01
