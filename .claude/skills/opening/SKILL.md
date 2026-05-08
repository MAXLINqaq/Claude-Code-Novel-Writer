---
name: opening
description: "开篇写作——前300-3000字成交：抓手、卖点、异常局面、主角亮相。"
argument-hint: "[章纲或概念文件路径] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Task, AskUserQuestion
---

当此技能被调用时：

1. **读取上下文**：读取 `design/novel/concept.md`、相关人物档案、章纲（如果有）。
2. **确定开篇策略**：根据概念确定最适合的成交方式。
3. **写作开篇**：生成第一章正文。

---

### 开篇策略选择

使用 `AskUserQuestion` 让用户选择或确认开篇方式：

- **危机压身** — 一上来就让主角处在要付代价的局里
- **身份反差** — 主角身份本身就是冲突
- **信息外挂** — 外来信息改写主角对现实的理解
- **关系炸点** — 直接从关系里最危险的刀口切入

---

### 硬指标检查

写作时确保：
- [ ] 前300-500字有抓手
- [ ] 前1500-3000字呈现卖点
- [ ] 前6000字完成黄金三章：读者知道主角是谁、遇到什么、卖点是什么、接下来想看什么
- [ ] 主角在第一页出现或即将出现
- [ ] 异常局面已建立
- [ ] 读者想知道接下来会发生什么
- [ ] 章末有明确落点（余韵 / 反打一刀 / 判决 / 轻喜回钩），不收在总结句

---

### 输出

生成 `manuscript/volume-01/chapter-001.md`。

使用 `AskUserQuestion` 请求写入批准。

---

### 下一步

1. `/write-chapter 1 2` — 继续写第二章
2. `/review-chapter manuscript/volume-01/chapter-001.md` — 审查开篇
