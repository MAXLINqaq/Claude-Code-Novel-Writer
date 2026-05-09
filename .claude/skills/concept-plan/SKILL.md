---
name: concept-plan
description: "前置规划——将简介压成题材、消费点、hook、premise、故事引擎、长度判断。"
argument-hint: "[简介或概念文件路径] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Task, AskUserQuestion
---

当此技能被调用时：

1. **解析参数**：如果有参数，读取指定文件或将其视为简介。
2. **检查现有概念**：读取 `design/novel/concept.md`（如果存在）。
3. **运行规划流程**，回答6个核心问题。

---

### 核心6问

**1. 题材和消费点是什么？**
- 主题材：
- 子标签：
- 核心消费点（读者来吃什么）：

**2. 卖点和异常局面亮不亮？**
- 一句话卖点：
- 异常局面：
- 为什么现在必须看：

**3. 主角眼前最紧迫的问题？**
- 开局问题：
- 不解决的代价：
- 时限：

**4. 故事引擎能不能跑过前10-20章？**
- 故事引擎类型（五选一：升级 / 调查 / 身份反打 / 关系拉扯 / 倒计时逼迫）：
- 核心冲突类型：
- 推进机制：
- 持续性来源：

**5. 目标长度合不合理？**
- 预估字数：
- 支撑依据：
- 风险：

**6. 能否压成最小产物？**
- Hook：
- Premise：
- 主角目标：
- 阻力源：
- 引擎说明：
- 第一卷目标：

---

### 输出

生成 `design/novel/concept.md`，使用模板 `.claude/docs/templates/novel-concept.md`。

同时生成 `design/novel/pillars.md`，使用模板 `.claude/docs/templates/novel-pillars.md`。

使用 `AskUserQuestion` 请求写入批准。

---

### 下一步建议

1. `/create-character` — 创建人物档案（推荐先做人物，再排章纲）
2. `/volume-outline` — 设计分卷和章纲
3. `/opening` — 直接开始写开篇（如果想先试写手感）
