#!/usr/bin/env bash
set -euo pipefail

DEST_FILE="AGENTS.md"

if [ -f "$DEST_FILE" ]; then
    read -p "AGENTS.md already exists in the project root. Overwrite? (y/N): " OVERWRITE
    if [[ ! "$OVERWRITE" =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
fi

read -p "Enter Project Name: " PROJ_NAME
read -p "Enter Primary Language (python / typescript / generic): " PROJ_LANG

# Locate the script directory to find the template relative to it
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_PATH="$SCRIPT_DIR/../templates/AGENTS.md"

if [ ! -f "$TEMPLATE_PATH" ]; then
    echo "Error: Template not found at $TEMPLATE_PATH"
    exit 1
fi

# Copy template and substitute the project name
sed "s/{{PROJECT_NAME}}/$PROJ_NAME/g" "$TEMPLATE_PATH" > "$DEST_FILE"

echo ""
echo "✅ AI configuration initialized!"
echo "Created: AGENTS.md in the current directory."
echo ""
echo "Next steps:"
echo "1. Open AGENTS.md in your root directory."
echo "2. Fill in the [TODO] sections for Description, Language & Tooling ($PROJ_LANG), and Conventions."
echo "3. Update the 'Current Focus' section to start working with your AI agent."