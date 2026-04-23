#!/bin/bash
# pkb-commit.sh
# Run daily at 3 AM to commit changes in PKB file-by-file with AI-generated conventional commits.
# Commit message generation: Gemini CLI first, Codex fallback.

export PATH="$PATH:/home/tphat/.local/share/pnpm:/home/tphat/.local/bin:/usr/local/bin:/usr/bin:/bin"

# Load shell auth/env if needed
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

REPO="/data/syncthing/obsidian-second-brain"
cd "$REPO" || exit 1

if [ -z "$(git status --porcelain)" ]; then
    exit 0
fi

if ! git config user.name >/dev/null 2>&1; then
    git config user.name "Alice (OpenClaw)"
    git config user.email "alice@openclaw.ai"
fi

git add -A
staged_files=$(git diff --name-only --cached -z)

if [ -z "$staged_files" ]; then
    exit 0
fi

git reset --mixed >/dev/null 2>&1

while IFS= read -r -d '' file; do
    if [ -z "$file" ]; then
        continue
    fi

    git add "$file"
    diff_text=$(git diff --cached -- "$file" | head -n 60)

    if [ -z "$diff_text" ]; then
        folder=$(dirname "$file")
        filename=$(basename "$file")
        if [ "$folder" = "." ]; then
            msg="docs: add $filename"
        else
            msg="docs($folder): add $filename"
        fi
    elif [[ "$file" == *".sync-conflict-"* ]]; then
        msg="chore: add syncthing conflict file"
    else
        diff_text_clean=$(printf '%s' "$diff_text" | tr '"' "'")
        prompt="Write a 1-line conventional commit message (e.g. docs(area): update note) for this PKB file change. Output ONLY the raw message string without quotes or markdown blocks. Keep it under 60 chars. Diff: ${diff_text_clean}"

        msg=$(gemini -p "$prompt" -o text 2>/dev/null)

        if [ -z "$msg" ] || [[ "$msg" == *"Error"* ]] || [[ "$msg" == *"Rate limit"* ]]; then
            msg=$(codex exec -C "$REPO" --sandbox read-only -a never "$prompt" 2>/dev/null)
        fi

        if [ -z "$msg" ] || [[ "$msg" == *"Error"* ]] || [[ "$msg" == *"Rate limit"* ]]; then
            folder=$(dirname "$file")
            filename=$(basename "$file")
            if [ "$folder" = "." ]; then
                msg="docs: update $filename"
            else
                msg="docs($folder): update $filename"
            fi
        fi
    fi

    msg=$(printf '%s' "$msg" | head -n 1 | tr -d "\"'")
    git commit -m "$msg"
done <<< "$staged_files"
