#!/bin/bash
# Hook: validate-manuscript.sh
# Event: PostToolUse (Write/Edit)
# Purpose: Validate manuscript file format

set +e

# Only validate if a manuscript file was modified
CHANGED_FILES=$(git diff --name-only 2>/dev/null)
STAGED_FILES=$(git diff --staged --name-only 2>/dev/null)
ALL_CHANGED="${CHANGED_FILES}${STAGED_FILES}"

if ! echo "$ALL_CHANGED" | grep -q "manuscript/"; then
    exit 0
fi

echo "=== 正文格式校验 ==="

ISSUES=0

# Check each changed manuscript file
echo "$ALL_CHANGED" | grep "manuscript/" | while read -r file; do
    [ -f "$file" ] || continue

    echo "检查: $file"

    # Check 1: Must start with chapter header
    FIRST_LINE=$(head -1 "$file" 2>/dev/null)
    if ! echo "$FIRST_LINE" | grep -qE "^# 第[0-9]+章[:：]"; then
        echo "  ⚠️  章节标题格式不正确。应以 '# 第X章：标题' 开头"
        ISSUES=$((ISSUES + 1))
    fi

    # Check 2: Must have scene markers if multi-scene
    SCENE_COUNT=$(grep -c "^## 场景" "$file" 2>/dev/null)
    if [ "$SCENE_COUNT" -gt 0 ]; then
        echo "  ✓ 检测到 $SCENE_COUNT 个场景标记"
    fi

    # Check 3: Check for empty scene markers
    EMPTY_SCENES=$(grep -A 2 "^## 场景" "$file" 2>/dev/null | grep -c "^---$" 2>/dev/null || true)
    if [ "$EMPTY_SCENES" -gt 0 ]; then
        echo "  ⚠️  发现空场景标记，请补充内容"
    fi

    # Check 4: Check for common issues
    if grep -q "空气中弥漫着" "$file" 2>/dev/null; then
        echo "  ⚠️  发现套话氛围描写: '空气中弥漫着...' — 建议用具体细节呈现"
    fi

    if grep -q "他意识到" "$file" 2>/dev/null; then
        echo "  ⚠️  发现总结性叙述: '他意识到...' — 建议用场景和动作呈现"
    fi
done

if [ "$ISSUES" -eq 0 ]; then
    echo "格式检查通过 ✓"
fi

echo "==================================="
exit 0