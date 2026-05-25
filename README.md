# Agent Config

Drop-in agent configuration for AI coding tools. Specialist agents, reusable commands, and a persistent memory wiki — so your AI agent hits the ground running from session one.

**Currently compatible with OpenCode.**

## What's Inside

- **Commands** — Reusable command definitions following the [open Agent Commands standard](https://openagentskills.dev)
- **Memory (Wiki)** — A persistent, LLM-maintained wiki at `.opencode/memory/` that compounds knowledge across sessions

### Available Commands

| Command | File | Purpose |
| --- | --- | --- |
| start-session | `commands/start-session.md` | Load project context from the persistent wiki at session start |
| end-session | `commands/end-session.md` | Session log, wiki integration (conditional), and schema file update |
| commit | `commands/commit.md` | Stage changes and create a git commit with AI-generated messages |

### Available Agents

| Agent | File | Purpose |
| --- | --- | --- |
| Explain | `agents/explain.md` | Explain the project architecture, codebase, and conventions |

---

## Persistent Memory (Wiki)

The fundamental problem with AI coding sessions: every session starts from zero. The model has no memory of what was built, decided, or discovered in previous sessions. You re-explain the same context over and over.

This repo solves that with a **persistent wiki** — a directory of interlinked markdown files at `.opencode/memory/` that the LLM reads at session start and updates at session end. The wiki is the project's long-term memory.

### How it works

```
start-session → read wiki → work → end-session → update wiki
     ↑                                                    │
     └────────────── wiki compounds over time ────────────┘
```

The wiki is **LLM-maintained**. You never write it directly. The LLM creates pages, updates cross-references, and keeps everything consistent — you just guide the work and decide what matters.

### Session workflow

**1. Start a session** — run `start-session`
The LLM reads the wiki and presents a summary of where things stand: current roadmap, architecture, key decisions, patterns, known gotchas. You pick what to work on.

**2. Work normally** — code, discuss, decide. The LLM tracks what happens.

**3. End the session** — run `end-session`
The LLM produces:
- **Session log** (`sessions/session-<DATE>.md`) — immutable record of what was done, decided, and left unfinished
- **Wiki updates** (conditional) — if substantial knowledge was discovered, the LLM creates or updates wiki pages and cross-references them
- **Schema updates** (if `AGENTS.md`/`CLAUDE.md` exist) — stable rules propagated to project-level config

### Wiki structure

```
.opencode/memory/
├── index.md                 # Catalog of all wiki pages (auto-maintained)
├── concepts/                # Project concepts, entities, terminology
│                             # Frontmatter tag: type: domain | technical
├── architecture/            # System structure, flows, integration patterns
├── decisions/               # Architectural Decision Records (ADRs)
├── patterns/                # Recurring implementation patterns specific to this codebase
├── gotchas/                 # Non-obvious failure modes and landmines
├── integrations/            # External service, API, and infra configuration
└── roadmap.md               # Product vision, priorities, and pending work (single file)
```

### What goes where

| Section | Content | Example entry |
|---|---|---|
| `concepts/` | Domain and technical concepts | `order-lifecycle.md` (type: domain), `event-bus.md` (type: technical) |
| `architecture/` | How the system is structured | `data-flow.md`, `service-layers.md` |
| `decisions/` | Why things were built a certain way | `adr-001-use-postgres.md` |
| `patterns/` | Local implementation conventions | `repository-pattern.md`, `error-handling.md` |
| `gotchas/` | Mistakes you don't want to repeat | `transaction-timeout.md` |
| `integrations/` | How external services are configured | `stripe-api.md`, `deployment-env.md` |
| `roadmap.md` | Where the project is going | Vision, priorities, pending features |

### Tips

- The wiki is a git repo — version history, branching, rollbacks work naturally
- The index file (`memory/index.md`) is the entry point: the LLM reads it first, then drills into relevant pages
- Wiki pages are written by `end-session` and read by `start-session` — the commands are the interface; you never touch the files
- If a session produces no substantial new knowledge (routine bug fixes, small tweaks), wiki integration is skipped — only meaningful sessions compound the wiki

---

## How to Install

Clone this repository into the root of your target project. The folder name tells your tool where to look.

```bash
# OpenCode
git clone https://github.com/paulopezgil/agent-config .opencode
```

```bash
# Claude Code (if supported)
git clone https://github.com/paulopezgil/agent-config .claude
```

Add `AGENTS.md`, `CLAUDE.md`, and the cloned directory (`.opencode` or `.claude`) to your project's `.gitignore` to keep them out of version control.

### First session

The first time you use this, the wiki is empty. Run `start-session` — the LLM will note the blank slate and start fresh. After your first `end-session`, the wiki begins compounding.

## Updating

```bash
cd .opencode  # or .claude
git pull
```

## Contributing

Found an agent or command worth sharing? PRs are welcome. Check [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
