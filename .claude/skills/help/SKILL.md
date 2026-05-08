---
name: help
description: "上下文感知帮助——读取当前阶段，推荐下一步技能。"
argument-hint: "[可选：主题或问题]"
user-invocable: true
allowed-tools: Read, Glob, Grep, AskUserQuestion
---

当此技能被调用时：

1. **检测项目状态**（同 `/project-stage-detect`）。
2. **根据当前状态推荐下一步**。
3. **如果用户有具体问题**，提供针对性帮助。

---

### 帮助内容

**常见问题**：
- "怎么开始？" → `/start`
- "我在哪？" → 运行状态检测
- "接下来做什么？" → 基于当前阶段推荐
- "怎么写开篇？" → `/opening`
- "怎么审查？" → `/review-chapter`

**技能速查表**：

| 你想做什么 | 使用 |
|-----------|------|
| 开始新项目 | `/start` |
| 脑暴创意 | `/brainstorm` |
| 规划概念 | `/concept-plan` |
| 设计分卷大纲 | `/volume-outline` |
| 写开篇 | `/opening` |
| 写章节 | `/write-chapter` |
| 审查章节 | `/review-chapter` |
| 精修章节 | `/polish-chapter` |
| 修复剧情逻辑 | `/revise-plot` |
| 修复人物一致性 | `/revise-character` |
| 检测项目状态 | `/project-stage-detect` |
| 阶段门检查 | `/gate-check` |