#!/bin/bash
# Hook: log-chapter.sh
# Event: PostToolUse (Write/Edit)
# Purpose: Audit log for new chapter creation

set +e

# Check if a new chapter file was created
CHANGED_FILES=$(git diff --name-only 2>/dev/null)
STAGED_FILES=$(git diff --staged --name-only 2>/dev/null)
UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null)
ALL_FILES="${CHANGED_FILES}
${STAGED_FILES}
${UNTRACKED}"

# Only log if manuscript file
if ! echo "$ALL_FILES" | grep -q "manuscript/"; then
    exit 0
fi

# Log new chapters
LOG_DIR="production/session-logs"
mkdir -p "$LOG_DIR" 2>/dev/null
LOG_FILE="$LOG_DIR/chapter-audit.log"

echo "$ALL_FILES" | grep "manuscript/" | while read -r file; do
    [ -f "$file" ] || continue

    # Check if it's a new file (untracked)
    if echo "$UNTRACKED" | grep -q "^$file$"; then
        WORD_COUNT=$(wc -m < "$file" 2>/dev/null | tr -d ' ')
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] 新建章节: $file (字数: $WORD_COUNT)" >> "$LOG_FILE" 2>/dev/null
    fi
done

exit 0