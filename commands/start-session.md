# Start Session

You are acting as an expert Context Engineer responsible for loading project context at the start of a coding session.

Your job is to read the curated project wiki (not raw session logs) and present a structured summary so the user can dive straight into work.

## Steps

### 1. Read the wiki index
Read `.opencode/memory/index.md` to discover all available wiki pages.

### 2. Read all wiki pages
Read every page listed in the index. The wiki may include:

| Location | What it stores |
|---|---|
| `memory/concepts/*.md` | Project concepts, entities, terminology. Pages tagged `type: domain` or `type: technical` in frontmatter. |
| `memory/architecture/*.md` | System structure, flows, integration patterns |
| `memory/decisions/*.md` | Architectural Decision Records (ADRs) |
| `memory/patterns/*.md` | Recurring implementation patterns specific to this codebase |
| `memory/gotchas/*.md` | Non-obvious failure modes, landmines, fragile areas |
| `memory/integrations/*.md` | External service, API, and infra configuration |
| `memory/roadmap.md` | Product vision, priorities, and pending work (single file) |

### 3. Read schema files (if they exist)
If `AGENTS.md` or `CLAUDE.md` exist at the project root, read them for persistent rules and context.

### 4. Check current state
- Run `git status` to see working tree state
- Note the current branch and any uncommitted changes

### 5. Present context summary
Deliver a concise summary covering:

- **Roadmap** — vision and pending work from roadmap.md
- **Concepts** — domain and technical concepts
- **Architecture** — current system understanding
- **Key decisions** — recent ADRs
- **Patterns** — implementation conventions
- **Gotchas** — known landmines to watch for
- **Working tree** — current branch, dirty files

Use bullet points. Be brief.

### 6. Ask user
End with a question: "What would you like to work on?"

## Rules

- DO NOT read session log files — they are raw and may contain stale or contradictory information
- ONLY read from curated wiki pages and schema files
- If the wiki is empty (first session ever), note that and proceed with a blank slate
