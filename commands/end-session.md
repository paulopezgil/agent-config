# Session End Command

You are acting as an expert Context Engineer responsible for finalizing a coding session.

We are ending a development session. Your job is to extract, structure, and persist everything important so that a future AI agent can immediately continue work with full context.

You must produce 3 outputs:

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

# OUTPUT 2 — MEMORY DELTA (FOR AGENTS INTELLIGENCE)

Create a distilled knowledge file:

`.opencode/memory/delta-<DATE>.md`

This is NOT a log. It must contain only stable, reusable knowledge.

Include only:

## Learned Rules & Guardrails
- Hard rules discovered during development
- Patterns that prevented bugs
- “Prefer X over Y” type guidance

## System Understanding
- Architectural insights that are now considered stable truth
- Integration constraints between components

## Product/Engineering Insights
- Reusable design decisions
- Patterns that should be replicated in future work

❌ DO NOT include:
- temporary debugging steps
- one-off issues
- unfinished ideas
- noise from conversation

Be extremely selective.

---

# OUTPUT 3 — UPDATE AGENTS.md (CURATED MEMORY)

You are acting as an expert Context Engineer.

Update the root `AGENTS.md` file so future agents can seamlessly continue development.

## STEP 1 — Read context
- Read existing `AGENTS.md`
- Analyze git diff for changes in this session
- Review conversation history for decisions and intent

## STEP 2 — Apply updates

Modify `AGENTS.md` by updating or appending information into:

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

## STEP 3 — CURATION RULES

- DO NOT copy session logs into AGENTS.md
- ONLY include stable, long-term knowledge
- Deduplicate existing content
- Resolve contradictions in favor of newest valid understanding
- Keep it concise, structured, and machine-readable

## STEP 4 — SAFETY CONSTRAINTS

- DO NOT delete core system setup unless explicitly obsolete
- DO NOT include transient debugging information
- DO NOT write conversational text
- Prefer declarative rules over explanations

---

# FINAL OUTPUT FORMAT

Return:
1. Session file content
2. Memory delta file content
3. Final updated AGENTS.md content (complete file)