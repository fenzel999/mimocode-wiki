#!/usr/bin/env node

/**
 * mimocode-wiki installer (cross-platform)
 *
 * Usage:
 *   node install.js [vault-path]
 *   npx mimocode-wiki
 *
 * Installs MiMoCode skills and creates wiki vault skeleton.
 */

import { readdir, mkdir, writeFile, access, constants } from "node:fs/promises";
import { join, resolve, dirname } from "node:path";
import { homedir } from "node:os";
import { execSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const today = new Date().toISOString().slice(0, 10);
const timestamp = new Date().toISOString().slice(0, 19);

// ── Helpers ────────────────────────────────────────────────────────────

const GREEN = "\x1b[32m";
const YELLOW = "\x1b[33m";
const RED = "\x1b[31m";
const CYAN = "\x1b[36m";
const DIM = "\x1b[2m";
const RESET = "\x1b[0m";

function log(msg) { console.log(msg); }
function ok(msg) { console.log(`${GREEN}  + ${msg}${RESET}`); }
function warn(msg) { console.log(`${YELLOW}  ! ${msg}${RESET}`); }
function err(msg) { console.log(`${RED}  - ${msg}${RESET}`); }
function dim(msg) { console.log(`${DIM}    ${msg}${RESET}`); }

async function exists(path) {
  try { await access(path, constants.F_OK); return true; }
  catch { return false; }
}

async function ensureDir(path) {
  await mkdir(path, { recursive: true });
}

async function writeFileIfMissing(path, content) {
  if (await exists(path)) {
    dim(`exists: ${path}`);
    return;
  }
  await writeFile(path, content, "utf-8");
  ok(`created: ${path}`);
}

// ── Main ───────────────────────────────────────────────────────────────

async function main() {
  const vaultPath = resolve(process.argv[2] || ".");
  const skillsSource = join(__dirname, "skills");
  const mimocodeSkills = join(homedir(), ".mimocode", "skills");

  console.log();
  console.log(`${CYAN}  mimocode-wiki installer${RESET}`);
  console.log(`${CYAN}  ======================${RESET}`);
  console.log();

  // ── Step 1: Install skills ────────────────────────────────────────────
  log(`${YELLOW}[1/6] Installing skills to ${mimocodeSkills} ...${RESET}`);

  const skillDirs = (await readdir(skillsSource, { withFileTypes: true }))
    .filter((d) => d.isDirectory())
    .map((d) => d.name);

  for (const dir of skillDirs) {
    const src = join(skillsSource, dir, "SKILL.md");
    const destDir = join(mimocodeSkills, dir);
    const dest = join(destDir, "SKILL.md");
    await ensureDir(destDir);

    const content = await (await import("node:fs/promises")).readFile(src, "utf-8");
    await writeFile(dest, content, "utf-8");
    ok(`${dir}/SKILL.md`);
  }

  console.log();

  // ── Step 2: Create wiki vault skeleton ────────────────────────────────
  log(`${YELLOW}[2/6] Creating wiki vault structure ...${RESET}`);

  const dirs = [
    ".raw/articles", ".raw/images", ".archive",
    "wiki/sources", "wiki/entities", "wiki/concepts",
    "wiki/domains", "wiki/comparisons", "wiki/questions",
    "wiki/meta", "wiki/canvases", "wiki/templates",
    "_attachments/images", "_templates",
  ];

  for (const dir of dirs) {
    await ensureDir(join(vaultPath, dir));
  }

  // Index files for entity/concept/domain
  for (const folder of ["entities", "concepts", "domains"]) {
    const indexPath = join(vaultPath, `wiki/${folder}/_index.md`);
    await writeFileIfMissing(
      indexPath,
      `---\ntype: meta\ntitle: "${folder} Index"\nupdated: ${today}\n---\n\n#${folder}\n`
    );
  }

  // wiki/index.md
  await writeFileIfMissing(
    join(vaultPath, "wiki/index.md"),
    `---\ntype: meta\ntitle: "Wiki Index"\nupdated: ${today}\n---\n\n# Wiki Index\n\n## Sources\n\n## Entities\n\n## Concepts\n\n## Domains\n\n## Questions\n`
  );

  // wiki/log.md
  await writeFileIfMissing(
    join(vaultPath, "wiki/log.md"),
    `---\ntype: meta\ntitle: "Wiki Log"\nupdated: ${today}\n---\n\n# Wiki Log\n\n## ${today} setup | Wiki initialized\n- Created vault structure\n- Skills installed\n`
  );

  // wiki/hot.md
  await writeFileIfMissing(
    join(vaultPath, "wiki/hot.md"),
    `---\ntype: meta\ntitle: "Hot Cache"\nupdated: ${timestamp}\n---\n\n# Recent Context\n\n## Last Updated\n${today}. Wiki initialized.\n\n## Key Recent Facts\n- Wiki created on ${today}\n`
  );

  // wiki/overview.md
  await writeFileIfMissing(
    join(vaultPath, "wiki/overview.md"),
    `---\ntype: meta\ntitle: "Wiki Overview"\nupdated: ${today}\n---\n\n# Wiki Overview\n\nThis wiki was initialized on ${today}.\n\nDescribe what this wiki is about here.\n`
  );

  ok("Created wiki/, .raw/, _templates/, _attachments/");
  console.log();

  // ── Step 3: Create AGENTS.md ──────────────────────────────────────────
  log(`${YELLOW}[3/6] Creating AGENTS.md ...${RESET}`);

  const agentsContent = `# Wiki Knowledge Base

Mode: D (Personal / Second Brain)
Purpose: Persistent knowledge wiki managed by MiMoCode
Created: ${today}

## Structure

\`\`\`
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
\`\`\`

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
`;

  await writeFileIfMissing(join(vaultPath, "AGENTS.md"), agentsContent);
  console.log();

  // ── Step 4: Check Obsidian ────────────────────────────────────────────
  log(`${YELLOW}[4/6] Checking Obsidian installation ...${RESET}`);

  let obsidianFound = false;
  const platform = process.platform;

  if (platform === "win32") {
    const paths = [
      join(process.env.LOCALAPPDATA || "", "Obsidian", "Obsidian.exe"),
      join(process.env.LOCALAPPDATA || "", "Programs", "Obsidian", "Obsidian.exe"),
      join(process.env.ProgramFiles || "", "Obsidian", "Obsidian.exe"),
    ];
    for (const p of paths) {
      if (await exists(p)) { obsidianFound = true; ok(`Found Obsidian: ${p}`); break; }
    }
  } else if (platform === "darwin") {
    const appPath = "/Applications/Obsidian.app";
    if (await exists(appPath)) { obsidianFound = true; ok(`Found Obsidian: ${appPath}`); }
  } else {
    // Linux
    try {
      execSync("which obsidian", { stdio: "ignore" });
      obsidianFound = true;
      ok("Found Obsidian in PATH");
    } catch {}
  }

  if (!obsidianFound) {
    err("Obsidian not found!");
    log("  Download from: https://obsidian.md");
  }

  console.log();

  // ── Step 5: Check plugins ─────────────────────────────────────────────
  log(`${YELLOW}[5/6] Checking Obsidian plugins ...${RESET}`);

  const pluginsDir = join(vaultPath, ".obsidian", "plugins");
  const requiredPlugins = [
    { name: "obsidian-local-rest-api", desc: "Local REST API (for MCP integration)" },
    { name: "templater-obsidian", desc: "Templater" },
    { name: "dataview", desc: "Dataview" },
  ];

  const missing = [];
  for (const plugin of requiredPlugins) {
    if (await exists(join(pluginsDir, plugin.name))) {
      ok(`${plugin.desc} installed`);
    } else {
      err(`${plugin.desc} NOT installed`);
      missing.push(plugin);
    }
  }

  if (missing.length > 0) {
    console.log();
    warn("Missing plugins! In Obsidian:");
    log("  Settings > Community plugins > Browse > Search and install:");
    for (const p of missing) {
      log(`    - ${p.desc}`);
    }
  }

  console.log();

  // ── Step 6: Initialize git ────────────────────────────────────────────
  log(`${YELLOW}[6/6] Initializing git ...${RESET}`);

  if (!(await exists(join(vaultPath, ".git")))) {
    try {
      execSync("git init", { cwd: vaultPath, stdio: "ignore" });
      await writeFile(
        join(vaultPath, ".gitignore"),
        ".obsidian/workspace.json\n.obsidian/workspace-mobile.json\n.obsidian/cache\n"
      );
      execSync("git add -A", { cwd: vaultPath, stdio: "ignore" });
      execSync('git commit -m "Initialize mimocode-wiki vault"', { cwd: vaultPath, stdio: "ignore" });
      ok("Git initialized with initial commit");
    } catch (e) {
      warn(`Git init failed: ${e.message}`);
    }
  } else {
    dim("Git already initialized");
  }

  console.log();

  // ── Done ──────────────────────────────────────────────────────────────
  console.log(`${CYAN}========================================${RESET}`);
  console.log(`${GREEN}  Installation complete!${RESET}`);
  console.log(`${CYAN}========================================${RESET}`);
  console.log();
  console.log(`${YELLOW}Next steps:${RESET}`);
  console.log();
  console.log(`  1. Open this folder as an Obsidian vault`);
  dim(`     File > Open folder as vault > Select: ${vaultPath}`);
  console.log();
  console.log(`  2. Install missing plugins (see above)`);
  dim(`     Settings > Community plugins > Browse`);
  console.log();
  console.log(`  3. Open MiMoCode and type:`);
  console.log(`${CYAN}     /wiki${RESET}`);
  console.log();
  console.log(`  4. Start using your wiki!`);
  dim(`     - Add knowledge: place files in .raw/, then say 'ingest [file]'`);
  dim(`     - Ask questions: just ask anything`);
  dim(`     - Deep research: /autoresearch [topic]`);
  dim(`     - Save conversations: /save`);
  console.log();
}

main().catch((e) => {
  console.error(`${RED}Error: ${e.message}${RESET}`);
  process.exit(1);
});
