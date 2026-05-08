#!/bin/bash
# Claude Code Novel Writer — SessionStart hook
# Loads creative context at session start

set +e

echo "=== Claude Code Novel Writer — 创作上下文 ==="

# Current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
    echo "分支: $BRANCH"
    echo ""
    echo "最近提交:"
    git log --oneline -5 2>/dev/null | while read -r line; do
        echo "  $line"
    done
fi

# Review mode
if [ -f "production/review-mode.txt" ]; then
    MODE=$(cat "production/review-mode.txt" | tr -d ' \n')
    echo ""
    echo "审查模式: $MODE"
fi

# Current manuscript stats
if [ -d "manuscript" ]; then
    VOL_COUNT=$(find manuscript -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
    CHAPTER_COUNT=$(find manuscript -name "chapter-*.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$CHAPTER_COUNT" -gt 0 ]; then
        echo ""
        echo "正文进度: $VOL_COUNT 卷, $CHAPTER_COUNT 章"

        # Latest chapter
        LATEST_CHAPTER=$(find manuscript -name "chapter-*.md" -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
        if [ -n "$LATEST_CHAPTER" ]; then
            LATEST_NAME=$(basename "$LATEST_CHAPTER")
            echo "最新章节: $LATEST_NAME"
        fi
    fi
fi

# Latest review
LATEST_REVIEW=$(find production/reviews -name "*.md" 2>/dev/null | xargs -I {} stat -c '%Y %n' {} 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
if [ -n "$LATEST_REVIEW" ]; then
    echo "最新审查: $(basename "$LATEST_REVIEW")"
fi

# --- Active session state recovery ---
STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "=== 检测到活跃会话状态 ==="
    echo "上次会话留下状态在: $STATE_FILE"
    echo ""
    echo "快速摘要 (最后 20 行):"
    tail -20 "$STATE_FILE" 2>/dev/null
    TOTAL_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null)
    if [ "$TOTAL_LINES" -gt 20 ]; then
        echo "  ... ($TOTAL_LINES 行总计 — 读取完整文件以继续)"
    fi
    echo "=== 会话状态预览结束 ==="
fi

echo "==================================="
exit 0