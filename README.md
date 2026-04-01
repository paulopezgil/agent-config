# Agent Config 🛠️

![Agent Config Banner](assets/banner.png)

This repository contains reusable AI agent configuration and skills. It is designed to be cloned into a new project to give an AI agent instant context, global preferences, and domain-specific skills.

## How to Install

### For OpenCode

The recommended approach for OpenCode is to add this repository as a git submodule named `.opencode` in your new project:

```bash
cd my-new-project
git submodule add https://github.com/paulopezgil/agent-config .opencode
```

### For Claude Code

The recommended approach for Claude Code is to add this repository as a git submodule named `.claude` in your new project:

```bash
cd my-new-project
git submodule add https://github.com/paulopezgil/agent-config .claude
```

This keeps your agent configuration version-controlled and easily updatable across projects.

## Initialization

After adding the submodule, run the respective initialization script from your project root.

### For OpenCode

Run the OpenCode initialization script:

```bash
./.opencode/scripts/init-opencode.sh
```

This script will ask for your project name and language, and copy the `AGENTS.md` template into your project root. You can then fill in the project-specific details to guide your AI agent.

### For Claude Code

Run the Claude Code initialization script:

```bash
./.claude/scripts/init-claude.sh
```

This script will ask for your project name and language, and copy the `CLAUDE.md` template into your project root. You can then fill in the project-specific details to guide your AI agent.
