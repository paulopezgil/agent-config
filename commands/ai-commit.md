# ai-commit

This command automates the process of evaluating uncommitted changes, updating the project's documentation if necessary, and then creating a single comprehensive git commit, WITH a human-in-the-loop approval step.

## Instructions
When the user runs this command, follow these steps strictly:

1. **Analyze Current Changes**:
   - Run `git status` to identify modified, deleted, and untracked files.
   - Run `git diff` and `git diff --staged` to inspect the exact incoming changes across the codebase.

2. **Evaluate Documentation Impact**:
   - Analyze the diffs. Determine if the changes introduce new features, alter existing architecture, add new dependencies, or change instructions that would require an update to the `README.md`.
   - If you decide `README.md` *should* be updated:
     - Read the current `README.md`.
     - Update the `README.md` to accurately reflect the new changes.
     - Stage the updated `README.md` using `git add README.md`.

3. **Stage Remaining Changes**:
   - Stage all the other relevant files that are part of this component/feature update.

4. **Human-in-the-Loop Review (CRITICAL STEP)**:
   - Run `git status` and `git diff --staged` to capture the final staged state.
   - Summarize what you have staged (including what changed in the README, if anything) and what the proposed commit message will be.
   - **PAUSE AND ASK THE USER FOR APPROVAL.** Use the `question` tool or simply ask in the chat: "Please review the staged changes. Do you approve me to commit this with the message: '<proposed message>'?"
   - DO NOT proceed to step 5 until the user explicitly says yes or approves.

5. **Commit (Only after approval)**:
   - If the user approves, run `git commit -m "<proposed message>"`.
   - If the user requests changes, make the requested adjustments, stage them, and ask for approval again.
   - Run `git status` after the commit completes to confirm success.