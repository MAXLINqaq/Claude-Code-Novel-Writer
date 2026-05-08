---
name: review-chapter
description: "完稿审查——六种一致性统一复查。任意两项不稳，不回对应专项模块修，不交稿。"
argument-hint: "[章节文件路径] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Task, AskUserQuestion
---

当此技能被调用时：

1. **读取章节文件**和关联上下文（人物档案、前章、世界观）。
2. **运行六种一致性检查**。
3. **给出 verdict** 和修复建议。

---

### 六种一致性检查

**1. 剧情逻辑一致性**
- 事件前提、决定触发、变化后果

**2. 人物目标一致性**
- 主角这章到底想做什么

**3. 情绪与关系一致性**
- 情绪来路、关系温度对接

**4. 身体与信息状态一致性**
- 伤势、秘密、已知信息不丢

**5. 场景与转场一致性**
- 读者不迷路、余力带过去

**6. 章末承接一致性**
- 收在变化上、下一章能接住

---

### Verdict 标准

| Verdict | 条件 | 行动 |
|---------|------|------|
| **APPROVED** | 0-1 项有问题 | 标记完成 |
| **MINOR REVISION** | 1-2 项有问题 | 当前对话修复 |
| **MAJOR REVISION** | 2+ 项有问题 | 路由到 revise-* |

**任意两项不稳 = MAJOR REVISION**

---

### 修复路由

| 问题类型 | 路由 |
|---------|------|
| 剧情逻辑 | `/revise-plot` |
| 人物一致性 | `/revise-character` |
| 对白问题 | `/revise-dialogue` |
| 转场问题 | `/revise-transition` |
| 风格/AI味 | `/polish-chapter` |

---

### 输出

生成审查报告：`production/reviews/chapter-XXX-review.md`。

更新 `production/session-state/active.md`。
