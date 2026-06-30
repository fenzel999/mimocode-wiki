---
name: canvas
description: "Visual layer of the wiki. Add images, text cards, PDFs, and wiki pages to Obsidian canvas files with auto-positioning inside zones. Triggers on: /canvas, canvas new, canvas add image, canvas add text, canvas add pdf, canvas add note, canvas zone, canvas list, add to canvas, put this on the canvas, open canvas, create canvas."
---

# canvas: Visual Reference Layer

The three knowledge capture layers:
- `/save` → text synthesis (wiki/questions/, wiki/concepts/)
- `/autoresearch` → structured knowledge (wiki/sources/, wiki/concepts/)
- `/canvas` → visual references (wiki/canvases/)

A canvas is a JSON file Obsidian renders as an infinite visual board. This skill reads and writes canvas JSON directly.

---

## Default Canvas

`wiki/canvases/main.canvas`

If it does not exist, create it:

```json
{
  "nodes": [
    {
      "id": "title",
      "type": "text",
      "text": "# Visual Reference\n\nDrop images, PDFs, and notes here.",
      "x": -400, "y": -300, "width": 400, "height": 120, "color": "6"
    },
    {
      "id": "zone-default",
      "type": "group",
      "label": "General",
      "x": -400, "y": -140, "width": 800, "height": 400, "color": "4"
    }
  ],
  "edges": []
}
```

---

## Operations

### open / status (`/canvas` with no args)

1. Check if `wiki/canvases/main.canvas` exists.
2. If yes: read it, count nodes by type, list all group node labels (zone names).
   Report: "Canvas has N nodes: X images, Y text cards, Z wiki pages. Zones: [list]"
3. If no: create it with the starter structure above.
   Report: "Created main.canvas with a General zone."
4. Tell user: "Open `wiki/canvases/main.canvas` in Obsidian to view."

---

### new (`/canvas new [name]`)

1. Slugify the name: lowercase, spaces → hyphens, strip special chars.
2. Create `wiki/canvases/[slug].canvas` with the starter structure, title updated to `# [Name]`.
3. Report: "Created wiki/canvases/[slug].canvas"

---

### add image (`/canvas add image [path or url]`)

**Resolve the image:**
- If URL (starts with `http`): download with webfetch tool
- If local path outside vault: copy to `_attachments/images/canvas/`
- If already vault-relative: use as-is

Create `_attachments/images/canvas/` if it doesn't exist.

**Position using auto-layout** and append node to canvas JSON.

Report: "Added [filename] to canvas."

---

### add text (`/canvas add text [content]`)

Create a text node:
```json
{
  "id": "text-[timestamp]",
  "type": "text",
  "text": "[content]",
  "x": [auto], "y": [auto],
  "width": 400, "height": [auto]
}
```

Append to canvas JSON and write.

Report: "Added text card to canvas."

---

### add note (`/canvas add note [wiki-page]`)

1. Verify the wiki page exists.
2. Create a file node:
```json
{
  "id": "note-[timestamp]",
  "type": "file",
  "file": "wiki/[path-to-page].md",
  "x": [auto], "y": [auto],
  "width": 250, "height": 120
}
```

3. Append to canvas JSON and write.
4. Report: "Pinned [[Page Name]] to canvas."

---

### zone (`/canvas zone [name]`)

1. Create a group node:
```json
{
  "id": "zone-[timestamp]",
  "type": "group",
  "label": "[name]",
  "x": [auto], "y": [auto],
  "width": 800, "height": 400,
  "color": "[next color]"
}
```

2. Append to canvas JSON and write.
3. Report: "Added zone '[name]' to canvas."

---

### list (`/canvas list`)

Read the canvas JSON and report:
- All zones (group nodes with labels)
- Node counts by type
- Recent additions

---

## Auto-Positioning

When adding nodes, position them to avoid overlaps:

1. Find the rightmost node in the target zone.
2. Place the new node to the right of it, with 40px gap.
3. If the zone is full (node extends beyond zone width), start a new row below.
4. Zone colors: 1=red, 2=orange, 3=yellow, 4=green, 5=cyan, 6=purple

---

## JSON Canvas Spec Reference

- Nodes: text, file, link, group
- Edges: with labels and colors
- Colors: 1-6 (red, orange, yellow, green, cyan, purple)
- Full spec: https://jsoncanvas.org/

---

## When to Use

- Visual knowledge maps
- Research synthesis boards
- Project dashboards
- Mood boards and inspiration collections
- Meeting notes with visual context
