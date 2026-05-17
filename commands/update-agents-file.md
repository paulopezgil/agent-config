# ROLE & TASK
You are acting as an expert Context Engineer. We have just finished a coding session where we modified the codebase and discussed future product, feature, and architectural ideas. 

Your task is to analyze our session and update the 'AGENTS.md' file at the root of this project so future AI agents (or yourself in a new session) can seamlessly pick up exactly where we left off.

# DIRECTION
1. Read the existing 'AGENTS.md' file to understand its current layout and existing foundational rules.
2. Run a 'git diff' or analyze the current codebase state to see what files were created, modified, or deleted during this session.
3. Review our conversation history for specific architectural choices made, roadblocks encountered, or future ideas I voiced.

# UPDATE REQUIREMENTS
Modify 'AGENTS.md' by updating or appending information into these critical dimensions:
- **Active Technical Context:** Document current state, new environment variables, newly introduced dependencies, or temporary mocks/hacks.
- **Learned Rules & Guardrails:** If we fixed a persistent bug or agreed on a specific design pattern (e.g., "Use explicit type casting for API responses"), document it here so future agents don't repeat mistakes.
- **Future Roadmap & Conceptual Ideas:** List the long-term features, enhancements, or product directions I brought up during the conversation, even if no code was written for them yet.

# CONSTRAINTS
- DO NOT overwrite or delete the core system stack, installation commands, or permanent human-defined guidelines unless they are explicitly obsolete.
- Keep instructions highly actionable and declarative (e.g., use "Prefer X over Y" instead of conversational prose).
- Ensure the Markdown remains clean, structured, and easy for future LLMs to parse. Output the updated file content entirely.