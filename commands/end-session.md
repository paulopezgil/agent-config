# Session End Command

You are acting as an expert Context Engineer responsible for finalizing a coding session.

We are ending a development session. Your job is to extract, structure, and persist everything important so that future sessions can immediately continue with full context.

You must produce up to 3 outputs:

---

# OUTPUT 1 — SESSION FILE (IMMUTABLE LOG)

Create a session log file:

`.opencode/sessions/session-<DATE>.md`

It must include:

## Session Summary
- What we were trying to accomplish
- What was completed
- What remains unfinished

## Key Changes
- Files created / modified / deleted (based on git diff if available)
- Major implementation changes

## Decisions Made
- Architectural or product decisions finalized during this session
- Alternatives considered and rejected

## Work Completed
- Bullet list of implemented features or fixes

## Open Tasks
- Actionable TODOs for next session

## Risks / Issues
- Bugs, fragile areas, missing pieces, technical debt

---

# OUTPUT 2 — WIKI INTEGRATION (CONDITIONAL)

**Only run this step if the session produced substantial new knowledge** — stable insights, new concepts, architectural revelations, or design decisions that should compound the project wiki. If the session was routine (bug fixes, small tweaks, no new understanding), skip this output entirely.

This replaces the concept of a "memory delta." Instead of writing an isolated file, you integrate the session's stable knowledge directly into the persistent wiki. The wiki pages are the memory.

## Wiki structure

The wiki lives at `.opencode/memory/`. It consists of:

| Path | Purpose |
|---|---|
| `memory/index.md` | Content catalog — every wiki page listed with link, summary, date |
| `memory/concepts/` | Project concepts, entities, terminology. Each page has frontmatter tagging it `type: domain` or `type: technical`. |
| `memory/architecture/` | System architecture pages — flows, layers, integration patterns |
| `memory/decisions/` | Architectural Decision Records (ADRs) |
| `memory/patterns/` | Recurring implementation patterns specific to this codebase |
| `memory/gotchas/` | Non-obvious failure modes, landmines, fragile areas |
| `memory/integrations/` | How external services, APIs, and infra are configured and used |
| `memory/roadmap.md` | Product vision, priorities, and pending work (single file) |

Wiki pages are markdown files that the LLM owns. You create them, update them, and maintain cross-references between them. You never modify raw source documents.

## Step 1 — Read the wiki
- Read `memory/index.md` to understand existing wiki structure and find relevant pages
- Read any existing pages whose topics overlap with this session's knowledge

## Step 2 — Decide if integration is warranted
Only proceed if at least one of:
- A new concept, entity, or term was introduced that deserves its own page (tag with `type: domain` or `type: technical` in frontmatter)
- An existing understanding was significantly revised or contradicted
- A design decision was finalized that should be recorded as an ADR
- An architectural insight adds meaningful depth to existing pages
- A recurring implementation pattern was established or changed
- A non-obvious bug or failure mode was discovered
- External service setup or integration details were discussed
- Product vision, priorities, or pending work changed

If none apply, skip Output 2 entirely.

## Step 3 — Extract stable knowledge
Distill the session's learnings into stable, reusable knowledge. Apply the same selectivity that would have gone into a memory delta:

### Learned Rules & Guardrails
- Hard rules discovered during development
- Patterns that prevented bugs
- "Prefer X over Y" type guidance

### System Understanding
- Architectural insights that are now considered stable truth
- Integration constraints between components

### Product/Engineering Insights
- Reusable design decisions
- Patterns that should be replicated in future work

❌ DO NOT include:
- temporary debugging steps
- one-off issues
- unfinished ideas
- noise from conversation

Be extremely selective.

## Step 4 — Create or update wiki pages
For each significant knowledge item, decide which page(s) to put it in:

- **Subdirectory pages** (`concepts/`, `architecture/`, `decisions/`, `patterns/`, `gotchas/`, `integrations/`): Create individual markdown files with clear, descriptive filenames (e.g., `circuit-breaker.md`). Link to related pages using relative markdown links. For `concepts/` pages, include frontmatter: `type: domain` or `type: technical`.
- **Flat file** (`roadmap.md`): Single file aggregating vision, priorities, and pending work. Read the existing file and append or revise sections. Do not delete still-relevant content.
- **Existing page**: Read the current page, integrate the new information, and note any contradictions explicitly. Update the summary if the understanding has evolved.

Page format for subdirectory pages:
```markdown
# Page Title

One-line summary.

## Details

Structured body with the key information.

## Related
- [Concept Name](../concepts/concept-name.md)
- [ADR-xxx](../decisions/adr-xxx.md)
```

## Step 5 — Update `memory/index.md`
Add or update an entry for each page touched. Use this format:

```markdown
### concepts/circuit-breaker.md
- Summary: Circuit breaker for external API calls
- Created: 2026-05-25
- Updated: 2026-05-25
- Sources: session-2026-05-25.md
```

For the flat `roadmap.md`:
```markdown
### roadmap.md
- Summary: Vision, priorities, and pending work
- Updated: 2026-05-25
- Sources: session-2026-05-25.md
```

If you created the first entry in a category, add a category header above it:

```markdown
## Patterns
```

---

# OUTPUT 3 — UPDATE SCHEMA FILES (IF THEY EXIST)

If `AGENTS.md` or `CLAUDE.md` exist at the project root, update them with stable knowledge from this session. Do NOT create these files if they don't exist — they are per-project setup files managed by the user.

Only include stable, long-term knowledge. Update or append to relevant sections:

### Active Technical Context
- Current system state
- New dependencies
- Environment variables
- Temporary mocks or hacks

### Learned Rules & Guardrails
- Persistent fixes or constraints discovered in this session
- Engineering rules to prevent repeated mistakes
- Use strict declarative language (e.g., "Prefer X over Y")

### Architecture & System Design
- Updated understanding of system structure
- Integration patterns between components
- Any new invariants or assumptions

### Future Roadmap & Ideas
- Product direction ideas mentioned during the session
- Features or improvements not yet implemented

## Curation Rules
- DO NOT copy session logs into schema files
- ONLY include stable, long-term knowledge
- Deduplicate existing content
- Resolve contradictions in favor of newest valid understanding
- Keep it concise, structured, and machine-readable

## Safety Constraints
- DO NOT delete core system setup unless explicitly obsolete
- DO NOT include transient debugging information
- DO NOT write conversational text
- Prefer declarative rules over explanations
- Prefer short entries scoped to specific decisions

---

# FINAL OUTPUT FORMAT

Return a summary of everything produced:

1. **Session file path** — `.opencode/sessions/session-<DATE>.md`
2. **Wiki integration** — summary of pages created/updated, or "Skipped — no substantial new knowledge"
3. **Schema files updated** — list of files modified, or "None — no schema files exist at project root"
