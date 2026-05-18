# Commit

This command stages the specified changes and creates a git commit. The AI analyzes the changes and generates an appropriate commit message.

## INPUT

User-provided description:
$ARGUMENTS

## Instructions
When the user runs this command, follow these steps:

1. **Parse the Arguments**:
   - The user provides file paths or a description of what to commit.
   - If the user provides file paths directly (e.g., `src/utils/foo.py tests/`), stage those files.
   - If the user provides a description, interpret it and stage the relevant files.

2. **Stage Changes**:
   - Use `git add <files>` to stage the specified files.

3. **Generate Commit Message**:
   - Run `git diff --staged` to see what was staged.
   - Generate a concise, descriptive commit message following conventional commit format.
   - Format: `<type>(<scope>): <description>` where type is `feat`, `fix`, `docs`, `refactor`, etc.

4. **Commit**:
   - Run `git commit -m "<generated message>"`.
   - Run `git status` to confirm success.

5. **Update Documentation** (if applicable):
   - If the changes introduce new features, alter architecture, or change user-facing instructions, update `README.md` accordingly.
   - Create a separate commit for documentation updates with message: `docs: update README for <change summary>`.