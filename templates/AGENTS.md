# Global Preferences
- GENERATION: Never generate more than one logical unit at a time.
- DECISIONS: Always explain trade-offs before deciding on a technical approach.
- STYLE: Prefer explicit configuration and code over implicit magic.
- WORKFLOW: Write tests before implementation (TDD).

# Project Specifics
**Project Name**: {{PROJECT_NAME}}
**Description**: [TODO: Describe what this project does]
**Language & Tooling**: [TODO: e.g., Python 3.12, Pytest, Ruff / TypeScript, Jest, ESLint]
**Conventions**: [TODO: List core naming, styling, or architectural conventions]

## Available Agents
- **Explain**: `.opencode/agents/explain.md` (Explains the current project architecture, codebase, and conventions)
- **Linus Review**: `.opencode/agents/linus-review.md` (Provides technically rigorous code review with direct, unfiltered feedback)
- **Senior Architect**: `.opencode/agents/senior-architect.md` (Helps design software architecture and technical plans)
- **Stepwise Builder**: `.opencode/agents/stepwise-builder.md` (Constructs code incrementally and collaboratively)

## Available Skills
| Task | Skill File Path |
| :--- | :--- |
| Writing tests | `skills/writing-tests.md` |
| Adding a new module | `skills/adding-a-module.md` |
| Publishing package to PyPI | `skills/publishing-to-pypi.md` |

## Current Focus
[TODO: Update this section each session with the immediate next goal or active bug]