#!/bin/bash
# Claude Code Novel Writer — PostCompact hook
# Reminds user to recover context after compression

set +e

echo "=== 上下文已压缩 ==="

STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "读取 $STATE_FILE 以恢复创作上下文。"
    echo "当前阶段和章节信息在该文件中。"
else
    echo ""
    echo "未找到会话状态文件。"
    echo "运行 /project-stage-detect 检测当前项目状态。"
fi

LATEST_CHAPTER=$(find manuscript -name "chapter-*.md" -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
if [ -n "$LATEST_CHAPTER" ]; then
    echo ""
    echo "最新章节: $LATEST_CHAPTER"
    echo "如正在继续写作，读取该文件以恢复上下文。"
fi

echo "==================================="
exit 0