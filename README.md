# Agent Config 🛠️

![Agent Config Banner](https://github.com/user-attachments/assets/9df24d12-a1b8-446b-861e-dd48cb273f25)

Every new project starts the same way: the model is ready, the agent has no idea what your project is. You re-explain conventions, stack decisions, and team preferences from scratch — every session.
 
**Agent Config** is a drop-in agent configuration you clone into any project. Specialist agents, reusable skills, and project conventions — so your AI agent hits the ground running from session one.

**Currently compatible with OpenCode and Claude Code.**

## What's Inside
 
- **Agents** — Specialist personas for common roles (code reviewer, planner, docs writer, etc.), each scoped with the right tools and permissions
- **Skills** — Reusable instruction sets your agent loads on demand, following the [open Agent Skills standard](https://openagentskills.dev)
- **Init scripts** — One command to scaffold your project's `AGENTS.md` or `CLAUDE.md` with your stack and conventions

### Available Agents
- **Explain** (`agents/explain.md`): Explains the current project architecture, codebase, and conventions
- **Linus Review** (`agents/linus-review.md`): Provides technically rigorous code review with direct, unfiltered feedback
- **Senior Architect** (`agents/senior-architect.md`): Helps design software architecture and technical plans
- **Stepwise Builder** (`agents/stepwise-builder.md`): Constructs code incrementally and collaboratively

### Available Commands
- **ai-commit** (`commands/ai-commit.md`): Generates and applies an AI-driven commit, adding significant changes to keep `README.md` updated when needed

### Available Skills
- **Adding a Module** (`skills/adding-a-module.md`)
- **Writing Tests** (`skills/writing-tests.md`)

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

After cloning the repository, run the init script from your project root. It asks for your project name and language, then generates a ready-to-fill instructions file.
 
### OpenCode
 
```bash
./.opencode/scripts/init-opencode.sh
```
 
Generates `AGENTS.md` in your project root.
 
### Claude Code
 
```bash
./.claude/scripts/init-claude.sh
```
 
Generates `CLAUDE.md` in your project root.
 
Open the generated file and fill in the project-specific sections — stack, conventions, commands. That's what your agent reads at the start of every session.
This script will ask for your project name and language, and copy the `CLAUDE.md` template into your project root. You can then fill in the project-specific details to guide your AI agent.


## Updating
 
To pull in the latest agents and skills:
 
```bash
cd .opencode # or .claude
git pull
```
 
 
## Contributing
 
Found an agent or skill worth sharing? PRs are welcome. Check [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

