# 上下文管理指南

## 核心原则

**文件是记忆，对话是短暂的。**

在长篇小说创作过程中，上下文窗口会被迅速填满。所有关键信息必须持久化到文件，确保压缩或新会话后可以恢复。

## 活检查点：session-state/active.md

`production/session-state/active.md` 是当前创作的活检查点，必须在每次关键操作后更新。

### 必须包含的信息

```markdown
# Session State

## 当前阶段
[概念确立 / 结构设计 / 写作准备 / 开篇试写 / 批量生产 / 精修打磨 / 发布交付]

## 当前工作
- 卷号：volume-XX
- 章号：chapter-XXX
- 状态：[草稿 / 审查中 / 已批准 / 已修改]

## 活跃角色
- 主角：[名称]
- 当前章节涉及人物：[列表]

## 待解决问题
1. [问题描述] — 优先级：高/中/低
2. ...

## 最近完成
1. [已完成的工作]
2. ...

## 下一步计划
1. [下一步工作]
2. ...
```

### 更新时机

- 完成一个章节的写作后
- 完成审查后
- 用户做出重大决策后
- 上下文压缩前（由 pre-compact.sh 自动触发）

## 上下文分层

### Layer 1：项目级（始终加载）

- `CLAUDE.md`（根级）
- `production/review-mode.txt`
- `production/session-state/active.md`

### Layer 2：设计级（按需加载）

- `design/novel/concept.md`
- `design/novel/pillars.md`
- `design/novel/worldbuilding/*.md`
- `design/novel/characters/*.md`

### Layer 3：大纲级（当前卷/章）

- `outlines/master-outline.md`
- `outlines/volume-XX-outline.md`
- `outlines/chapter-outlines/volXX-chapter-XXX.md`

### Layer 4：正文级（当前章+上下文章）

- `manuscript/volume-XX/chapter-XXX.md`（当前章）
- `manuscript/volume-XX/chapter-(XXX-1).md`（前一章，用于衔接）
- `manuscript/volume-XX/chapter-(XXX+1).md`（后一章，如果已存在）

## 压缩策略

### 安全压缩（已持久化到文件）

以下信息可以安全从对话上下文中移除：
- 已写入文件的章节内容
- 已批准的审查记录
- 已确认的设计决策（只要写入了 design/）

### 不可压缩（仅在对话中）

以下信息必须保留在对话中直到持久化：
- 用户刚提出的新想法（尚未写入文件）
- 当前正在起草的章节内容（尚未写入文件）
- 未解决的讨论/争论

### 压缩前检查清单

在上下文压缩前，pre-compact.sh 钩子会自动执行：
1. 当前章节的草稿是否已保存到文件？
2. active.md 是否已更新？
3. 是否有未持久化的用户决策？

## 长对话管理

### 单章节写作对话

建议在完成一个章节后：
1. 将章节内容写入文件
2. 更新 active.md
3. 运行 review-chapter 完成审查
4. 如果上下文紧张，压缩对话并继续下一章

### 跨章节上下文

为了保持跨章节的连贯性：
- 关键人物状态变化必须写入人物档案
- 关键剧情进展必须更新总大纲
- 伏笔和回收标记必须在 outline 中维护

## 恢复会话

### 新会话启动时

session-start.sh 钩子会自动：
1. 读取 `production/session-state/active.md`
2. 显示当前阶段、卷/章、状态
3. 列出最近完成的章节
4. 提示下一步建议

### 用户手动恢复

如果自动恢复不完整，用户可以：
- 运行 `/project-stage-detect` 让生产总编检测当前状态
- 运行 `/help` 获取上下文感知的帮助
- 直接询问当前创作进度
