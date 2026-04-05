# Testing Agent — Task Board

This file is the task queue and status board for the Testing Agent (`.opencode/agents/testing-agent.md`).

**How to use:**
- Add new test tasks under `### [PENDING]` as bullet points.
- The agent will pick up the first pending item, lock it in `### [WIP]`, and update this file automatically.
- Do not manually edit `### [WIP]` — that section is owned by the agent.

---

### [PENDING]

<!-- Add tasks here. Example:
- [ ] Write tests for `src/utils/format.ts`
-->

### [WIP]

<!-- Tasks actively being processed by the agent. Do not edit this section manually. -->

### [STUCK]

<!-- Tasks the agent could not complete after 3 attempts. Review the error log and resolve manually, then move the task back to [PENDING]. -->

### [COMPLETED]

<!-- Tasks the agent has successfully completed. -->
