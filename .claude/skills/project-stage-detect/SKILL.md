---
name: project-stage-detect
description: "项目阶段检测——扫描文件，确定当前阶段，推荐下一步行动。"
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, AskUserQuestion
---

当此技能被调用时：

1. **扫描项目文件**：
   - `design/novel/concept.md` — 概念阶段
   - `design/novel/characters/*.md` — 人物设计
   - `design/novel/worldbuilding/*.md` — 世界观设计
   - `outlines/*.md` — 大纲阶段
   - `manuscript/volume-*/chapter-*.md` — 写作阶段
   - `production/reviews/*.md` — 审查阶段
   - `archives/*/` — 已有归档（可开始新小说）

2. **确定当前阶段**：
   - 概念确立 → 结构设计 → 写作准备 → 开篇试写 → 批量生产 → 精修打磨 → 发布交付 → 完结归档

3. **检测缺失文档**：
   - 哪些关键文档缺失？
   - 哪些审查未完成？

4. **推荐下一步**：
   - 基于当前状态推荐最合适的技能。

---

### 输出示例

```
当前阶段: 结构设计
已完成:
- 概念文档 ✓
- 人物档案 (3/5) ⚠️
- 世界观规则 ✓

缺失:
- 分卷大纲
- 章纲

推荐下一步:
1. /volume-outline — 设计分卷和章纲
2. 补充剩余人物档案
```