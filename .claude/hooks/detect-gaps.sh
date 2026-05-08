#!/bin/bash
# Hook: detect-gaps.sh
# Event: SessionStart
# Purpose: Detect missing creative documents

set +e

echo "=== 检查创作文档缺口 ==="

# --- Check 0: Fresh project detection ---
FRESH_PROJECT=true

if [ -f "design/novel/concept.md" ]; then
    FRESH_PROJECT=false
fi

if [ -d "manuscript" ]; then
    CHAPTER_CHECK=$(find manuscript -name "chapter-*.md" 2>/dev/null | head -1)
    if [ -n "$CHAPTER_CHECK" ]; then
        FRESH_PROJECT=false
    fi
fi

if [ "$FRESH_PROJECT" = true ]; then
    echo ""
    echo "🚀 新项目: 没有小说概念，没有正文。"
    echo "   看起来是全新开始！运行: /start"
    echo ""
    echo "💡 获取完整的项目分析，运行: /project-stage-detect"
    echo "==================================="
    exit 0
fi

# --- Check 1: Has concept but no outline ---
if [ -f "design/novel/concept.md" ]; then
    OUTLINE_CHECK=$(find outlines -name "*.md" 2>/dev/null | head -1)
    if [ -z "$OUTLINE_CHECK" ]; then
        echo "⚠️  缺口: 有小说概念但没有大纲。"
        echo "    建议操作: /volume-outline"
    fi
fi

# --- Check 2: Has outline but no manuscript ---
OUTLINE_COUNT=$(find outlines -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
CHAPTER_COUNT=$(find manuscript -name "chapter-*.md" 2>/dev/null | wc -l | tr -d ' ')

if [ "$OUTLINE_COUNT" -gt 0 ] && [ "$CHAPTER_COUNT" -eq 0 ]; then
    echo "⚠️  缺口: 有大纲但没有正文。"
    echo "    建议操作: /opening 开始写开篇"
fi

# --- Check 3: Has manuscript but missing character sheets ---
if [ "$CHAPTER_COUNT" -gt 0 ]; then
    CHAR_COUNT=$(find design/novel/characters -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$CHAR_COUNT" -eq 0 ]; then
        echo "⚠️  缺口: 有正文但没有人物档案。"
        echo "    建议操作: 创建 design/novel/characters/protagonist.md"
    fi
fi

# --- Check 4: Missing worldbuilding for fantasy/scifi ---
if [ -f "design/novel/concept.md" ]; then
    GENRE_CHECK=$(grep -i -E "玄幻|科幻|仙侠|奇幻|西幻|末世" "design/novel/concept.md" 2>/dev/null)
    if [ -n "$GENRE_CHECK" ]; then
        if [ ! -f "design/novel/worldbuilding/rules.md" ]; then
            echo "⚠️  缺口: 题材需要世界观支撑，但没有世界规则文档。"
            echo "    建议操作: 创建 design/novel/worldbuilding/rules.md"
        fi
    fi
fi

# --- Check 5: Active chapters without review ---
if [ "$CHAPTER_COUNT" -gt 0 ]; then
    REVIEW_COUNT=$(find production/reviews -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$REVIEW_COUNT" -eq 0 ]; then
        echo "⚠️  缺口: 有正文但没有审查记录。"
        echo "    建议操作: /review-chapter [章节文件]"
    fi
fi

# --- Summary ---
echo ""
echo "💡 获取完整的项目分析，运行: /project-stage-detect"
echo "==================================="

exit 0