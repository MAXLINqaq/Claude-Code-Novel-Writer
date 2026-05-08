---
name: revise-plot
description: "剧情逻辑修复——修动机、触发、决策、后果、兑现五层因果链。"
argument-hint: "[章节文件路径] [问题描述] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
---

当此技能被调用时：

1. **读取问题章节**和关联上下文。
2. **逐层诊断五层因果链**。
3. **识别断裂点**。
4. **提出修复方案**。
5. **执行修复**。

---

### 五层诊断

**1. 动机层**：角色为什么想做？
**2. 触发层**：什么事件促使行动？
**3. 决策层**：选择是否合理？
**4. 后果层**：结果是否与决策相关？
**5. 兑现层**：预期是否实现？

---

### 修复后

建议重新运行 `/review-chapter` 验证修复效果。
