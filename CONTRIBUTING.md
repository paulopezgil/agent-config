# Contributing to Agent Config

Thanks for wanting to contribute. This project grows through shared agents and skills from people solving real problems — so if you've built something useful, it belongs here.

---

## What to Contribute

**Agents** — Specialist personas with a clear, scoped role. Good candidates: roles you reach for repeatedly across projects, or roles where the right tool/permission scope makes a meaningful difference to output quality.

**Skills** — Reusable instruction sets for recurring tasks. Good candidates: workflows with clear steps, things that benefit from bundled scripts or reference files, tasks where a description alone is enough to trigger the right behavior.

**Fixes and improvements** — Typos, broken scripts, outdated frontmatter fields, compatibility issues with new OpenCode or Claude Code versions. All welcome.

---

## Folder Structure

```
.
├── agents/               # Agent markdown files
│   └── code-reviewer.md
├── skills/               # One folder per skill
│   └── my-skill/
│       ├── SKILL.md      # Required
│       └── references/   # Optional supporting files
├── scripts/
│   ├── init-opencode.sh
│   └── init-claude.sh
└── templates/
    ├── AGENTS.md
    └── CLAUDE.md
```

---

## Adding an Agent

Create a markdown file in `agents/`. The filename becomes the agent name.

```markdown
---
description: One sentence on what this agent does and when to use it.
mode: subagent
model: anthropic/claude-sonnet-4-5
temperature: 0.3
permissions:
  edit: ask
  bash:
    "*": deny
---

Your system prompt here.
```

**Guidelines:**
- `description` should be specific enough that the tool knows when to invoke it automatically — avoid vague descriptions like "helps with code"
- Set `mode: subagent` unless it's genuinely a primary agent people would switch to directly
- Restrict permissions to what the agent actually needs — default to denying bash unless there's a real reason
- Keep the system prompt focused; one role, one area of expertise

---

## Adding a Skill

Create a folder in `skills/` named after your skill. Put a `SKILL.md` inside it.

```markdown
---
name: your-skill-name
description: When to load this skill. Be specific — this is what the agent reads to decide relevance.
---

Instructions here. Write them as if briefing a capable colleague who knows nothing about your specific workflow.
```

**Guidelines:**
- Folder name and `name` field should match
- The `description` is the most important line — make it trigger-specific, not topic-general
- If your skill needs supporting files (reference docs, templates, scripts), add them alongside `SKILL.md` in the same folder
- Skills should be self-contained — don't assume other skills are loaded

---

## Compatibility

Both OpenCode and Claude Code read this repo's structure. When adding agents or skills, test against whichever tool you use. If you know it works on both, note that in your PR description. If you only tested one, say so — someone else can verify the other.

The Agent Skills frontmatter spec is shared across tools. Stick to documented fields; avoid tool-specific extensions in shared files.

---

## Submitting a PR

1. Fork the repo and create a branch: `git checkout -b add/my-skill-name`
2. Add your agent or skill following the structure above
3. Test it in a real session — does the agent actually load and use it correctly?
4. Open a PR with a short description: what it does, what problem it solves, which tool(s) you tested on

No issue required before a PR for new agents or skills. For larger structural changes, open an issue first to align before building.

---

## Code of Conduct

Be direct and constructive. This is a practical tools project — feedback should be specific and actionable, not personal.