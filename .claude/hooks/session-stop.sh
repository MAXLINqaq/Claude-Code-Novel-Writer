#!/bin/bash
# Claude Code Novel Writer — SessionStop hook
# Summarizes the creative session

set +e

echo "=== 会话结束总结 ==="

# Files modified this session
CHANGED=$(git diff --name-only 2>/dev/null)
STAGED=$(git diff --staged --name-only 2>/dev/null)
UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null)

echo ""
echo "本次会话修改的文件:"

if [ -n "$CHANGED" ] || [ -n "$STAGED" ] || [ -n "$UNTRACKED" ]; then
    if [ -n "$CHANGED" ]; then
        echo "$CHANGED" | while read -r f; do echo "  [修改] $f"; done
    fi
    if [ -n "$STAGED" ]; then
        echo "$STAGED" | while read -r f; do echo "  [暂存] $f"; done
    fi
    if [ -n "$UNTRACKED" ]; then
        echo "$UNTRACKED" | while read -r f; do echo "  [新增] $f"; done
    fi
else
    echo "  (无文件变更)"
fi

# Chapter stats
if [ -d "manuscript" ]; then
    CHAPTER_COUNT=$(find manuscript -name "chapter-*.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$CHAPTER_COUNT" -gt 0 ]; then
        echo ""
        echo "正文统计: $CHAPTER_COUNT 章"
    fi
fi

# Log session
SESSION_LOG_DIR="production/session-logs"
mkdir -p "$SESSION_LOG_DIR" 2>/dev/null
LOG_FILE="$SESSION_LOG_DIR/session-$(date +%Y%m%d-%H%M%S).log"
{
    echo "Session ended at $(date)"
    echo "Modified files:"
    if [ -n "$CHANGED" ]; then echo "$CHANGED"; fi
    if [ -n "$STAGED" ]; then echo "$STAGED"; fi
    if [ -n "$UNTRACKED" ]; then echo "$UNTRACKED"; fi
    echo "---"
} >> "$LOG_FILE" 2>/dev/null

echo ""
echo "会话日志已归档: $LOG_FILE"
echo "==================================="
exit 0