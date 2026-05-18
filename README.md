# Agent Config 🛠️

![Agent Config Banner](https://github.com/user-attachments/assets/9df24d12-a1b8-446b-861e-dd48cb273f25)

Every new project starts the same way: the model is ready, the agent has no idea what your project is. You re-explain conventions, stack decisions, and team preferences from scratch — every session.
 
**Agent Config** is a drop-in agent configuration you clone into any project. Specialist agents, reusable commands, and project conventions — so your AI agent hits the ground running from session one.

**Currently compatible with OpenCode and Claude Code.**

## What's Inside
  
- **Agents** — Specialist personas for common roles (code reviewer, planner, docs writer, etc.), each scoped with the right tools and permissions
- **Commands** — Reusable command definitions following the [open Agent Commands standard](https://openagentskills.dev)
- **Templates** — Scaffolding files to generate project-specific AI configuration (`AGENTS.md`, `CLAUDE.md`)

### Available Agents
| Agent | File | Purpose |
| --- | --- | --- |
| Explain | `agents/explain.md` | Explains the project architecture, codebase, and conventions. |
| Linus Review | `agents/linus-review.md` | Delivers direct, technically rigorous code review feedback. |
| Senior Architect | `agents/senior-architect.md` | Designs software architecture and technical implementation plans. |
| Stepwise Builder | `agents/stepwise-builder.md` | Builds code incrementally through collaborative, step-by-step changes. |

### Available Commands
| Command | File | Purpose |
| --- | --- | --- |
| ai-commit | `commands/ai-commit.md` | Generates and applies an AI-driven commit. |
| end-session | `commands/end-session.md` | Finalizes a coding session and updates project documentation. |
| update-readme | `commands/update-readme.md` | Updates README.md to reflect current project state. |

## How to Install

Clone this repository directly into the root of your project. The folder name tells your tool where to look. Optionally, you can add `AGENTS.md`, `CLAUDE.md`, and the cloned directory (`.opencode` or `.claude`) to your `.gitignore` file to keep them out of your project's version control.
 
### OpenCode
 
```bash
git clone https://github.com/paulopezgil/agent-config .opencode
```
 
### Claude Code
 
```bash
git clone https://github.com/paulopezgil/agent-config .claude
```

## Initialization

After cloning the repository, manually copy the template you need into your project root and customize it.

### OpenCode

```bash
cp .opencode/templates/AGENTS.md ./AGENTS.md
```

### Claude Code

```bash
cp .claude/templates/CLAUDE.md ./CLAUDE.md
```

Open the generated file and fill in the project-specific sections — stack, conventions, commands. That's what your agent reads at the start of every session.


## Updating
  
To pull in the latest agents and commands:
 
```bash
cd .opencode # or .claude
git pull
```
 
 
## Contributing
 
Found an agent or command worth sharing? PRs are welcome. Check [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.
