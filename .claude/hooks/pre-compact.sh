#!/bin/bash
# Claude Code Novel Writer — PreCompact hook
# Dumps creative session state before context compression

set +e

echo "=== 压缩前会话状态转储 ==="
echo "时间: $(date)"

# --- Active session state file ---
STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "## 活跃会话状态 (来自 $STATE_FILE)"
    STATE_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null | tr -d ' ')
    if [ "$STATE_LINES" -gt 100 ] 2>/dev/null; then
        head -n 100 "$STATE_FILE"
        echo "... (已截断 — $STATE_LINES 行总计, 显示前 100 行)"
    else
        cat "$STATE_FILE"
    fi
else
    echo ""
    echo "## 未找到活跃会话状态文件"
    echo "建议维护 production/session-state/active.md 以便更好地恢复上下文。"
fi

# --- Files modified this session ---
echo ""
echo "## 修改的文件 (git 工作树)"

CHANGED=$(git diff --name-only 2>/dev/null)
STAGED=$(git diff --staged --name-only 2>/dev/null)
UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null)

if [ -n "$CHANGED" ]; then
    echo "未暂存的修改:"
    echo "$CHANGED" | while read -r f; do echo "  - $f"; done
fi
if [ -n "$STAGED" ]; then
    echo "已暂存的修改:"
    echo "$STAGED" | while read -r f; do echo "  - $f"; done
fi
if [ -n "$UNTRACKED" ]; then
    echo "新增未跟踪文件:"
    echo "$UNTRACKED" | while read -r f; do echo "  - $f"; done
fi
if [ -z "$CHANGED" ] && [ -z "$STAGED" ] && [ -z "$UNTRACKED" ]; then
    echo "  (无未提交修改)"
fi

# --- WIP design docs ---
echo ""
echo "## 设计文档 — 进行中"

WIP_FOUND=false
for f in design/novel/*.md design/novel/**/*.md 2>/dev/null; do
    [ -f "$f" ] || continue
    INCOMPLETE=$(grep -n -E "TODO|WIP|待填|待定|PLACEHOLDER|\[TO BE|\[TBD\]" "$f" 2>/dev/null)
    if [ -n "$INCOMPLETE" ]; then
        WIP_FOUND=true
        echo "  $f:"
        echo "$INCOMPLETE" | while read -r line; do echo "    $line"; done
    fi
done

if [ "$WIP_FOUND" = false ]; then
    echo "  (设计文档中未找到 WIP 标记)"
fi

# --- Log compaction event ---
SESSION_LOG_DIR="production/session-logs"
mkdir -p "$SESSION_LOG_DIR" 2>/dev/null
echo "上下文压缩发生在 $(date)。" \
    >> "$SESSION_LOG_DIR/compaction-log.txt" 2>/dev/null

echo ""
echo "## 恢复指引"
echo "压缩后，读取 $STATE_FILE 恢复完整工作上下文。"
echo "然后读取上面列出的正在活跃编辑的文件。"
echo "=== 会话状态转储结束 ==="

exit 0