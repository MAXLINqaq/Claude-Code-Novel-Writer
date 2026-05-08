---
name: milestone-review
description: "里程碑回顾——检查里程碑达成情况，评估进度和质量。"
argument-hint: "[里程碑名] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

当此技能被调用时：

1. **读取里程碑定义**。
2. **检查达成情况**。
3. **评估质量**。
4. **提出改进建议**。

---

### 检查内容

- 里程碑目标是否达成？
- 成功标准是否满足？
- 章节清单是否完成？
- 质量门是否通过？
- 与预期的偏差？

---

### 输出

生成里程碑回顾报告。