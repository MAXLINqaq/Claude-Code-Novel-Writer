---
name: revise-character
description: "人物一致性修复——修目标、情绪、关系、身体、声音五类连续性。"
argument-hint: "[章节文件路径] [人物名] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
---

当此技能被调用时：

1. **读取问题章节**和人物档案。
2. **逐类检查五类连续性**。
3. **识别不一致点**。
4. **提出修复方案**。
5. **执行修复**。

---

### 五类检查

**1. 目标连续性**
**2. 情绪连续性**
**3. 关系连续性**
**4. 身体连续性**
**5. 声音连续性**

---

### 修复后

建议重新运行 `/review-chapter` 验证修复效果。
