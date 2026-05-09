---
name: volume-outline
description: "分卷/章纲——黄金三章、分卷、前10-20章章纲、卷末兑现。"
argument-hint: "[概念文档路径] [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Task, AskUserQuestion
---

当此技能被调用时：

1. **读取上下文**：读取 `design/novel/concept.md`、人物档案、世界观。
2. **设计分卷结构**：确定全书的分卷规划。
3. **设计章纲**：至少完成第一卷前10-20章的章纲。

---

### 分卷设计

每卷必须包含：
- 卷目标
- 卷核心冲突
- 卷高潮
- 卷末变化

### 黄金三章

前三章必须完成五个亮相：
- 主角亮相
- 卖点亮相
- 第一冲突亮相
- 阶段目标亮相
- 追更理由亮相

**字数硬指标**：前300-500字有抓手；前1500-3000字呈现卖点；前6000字让读者知道主角是谁、遇到什么、卖点是什么、接下来想看什么。

### 章四件套（每章章纲必备）

- 本章目标：主角这章想做什么
- 本章冲突：谁/什么阻止他
- 本章新信息：读者/主角新知道了什么
- 本章章末拉力：为什么读者还要往下看（落点类型：余韵 / 反打一刀 / 判决 / 轻喜回钩）

### 前10章最小计划

规划前10章时必须回答：
1. 第一卷最核心要解决什么？
2. 最强冲突是谁或什么？
3. 卷末局面必须怎样变化？
4. 前10章里至少哪三次升级或反打不能缺？
5. 哪几章最容易水，提前怎么防？

---

### 输出

生成：
- `outlines/master-outline.md`（总大纲）
- `outlines/volume-01-outline.md`（第一卷大纲）
- `outlines/chapter-outlines/vol01-chapter-XXX.md`（前10章章纲）

使用模板 `.claude/docs/templates/volume-outline.md` 和 `.claude/docs/templates/chapter-outline.md`。

使用 `AskUserQuestion` 请求写入批准。

---

### 下一步

1. `/review-outline` — 审查大纲质量（推荐在写作前完成）
2. `/opening` — 开始写开篇
3. `/write-chapter 1 1` — 直接开始写第一章（如果已有章纲）
