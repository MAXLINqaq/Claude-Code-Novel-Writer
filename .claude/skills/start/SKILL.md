---
name: start
description: "首次引导——检测项目状态，路由到正确的工作流起点。不做假设。"
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

# 引导式初始化

此技能写入一个文件：`production/review-mode.txt`。

此技能是新用户的入口点。它不假设你已有小说概念或任何先前经验。先提问，再路由。

---

## Phase 1: 检测项目状态

在提问前，先静默收集上下文：

- **已有概念？** 检查 `design/novel/concept.md` 是否存在。
- **已有正文？** 检查 `manuscript/` 下是否有 `chapter-*.md` 文件。
- **已有大纲？** 检查 `outlines/` 下是否有 `.md` 文件。
- **已有设计文档？** 检查 `design/novel/` 下是否有其他文件。

将这些发现存储在内部，用于验证用户的自我评估。

---

## Phase 2: 询问用户当前状态

使用 `AskUserQuestion`：

- **Prompt**: "欢迎使用 Claude Code Novel Writer！在开始之前，我想了解你目前的创作状态。你现在处于哪个阶段？"
- **Options**:
  - `A) 没有想法` — 完全没有小说概念，想从零开始探索。
  - `B) 有模糊想法` — 有一个大概的主题、感觉或类型，但 nothing concrete。
  - `C) 有清晰概念` — 知道核心创意——类型、卖点、基本情节——但还没有写成文档。
  - `D) 已有作品` — 已经有设计文档、大纲或正文。想继续或整理。

等待用户选择。不要在他们回应前继续。

---

## Phase 3: 根据回答路由

#### 如果 A: 没有想法

1. 确认从零开始完全没问题
2. 简要解释 `/brainstorm` 做什么（引导式创意探索）
3. 推荐运行 `/brainstorm`
4. 展示推荐路径：
   **概念阶段：**
   - `/brainstorm` — 探索创意
   - `/concept-plan` — 将创意结构化
   **结构设计：**
   - `/create-character` — 创建人物档案
   - `/volume-outline` — 设计分卷和章纲
   - `/review-outline` — 审查大纲质量
   **开篇：** → `/opening` — 写开篇
   **生产阶段：** → 用 `/write-chapter` + `/review-chapter` 逐章写作+审查

#### 如果 B: 有模糊想法

1. 请他们分享模糊想法——哪怕几个字也足够
2. 验证这个想法作为起点
3. 推荐运行 `/brainstorm [他们的想法]`
4. 展示推荐路径（同上）

#### 如果 C: 有清晰概念

1. 请他们用一句话描述概念
2. 使用 `AskUserQuestion` 提供两个路径：
   - `正式化` — 运行 `/brainstorm [概念]` 将其结构化为概念文档
   - `直接开始` — 直接运行 `/concept-plan`

#### 如果 D: 已有作品

1. 分享 Phase 1 的发现："我看到你有 [X 个设计文件 / Y 章正文 / Z 个大纲文件]..."
2. 推荐运行 `/project-stage-detect` 进行缺口检测

---

## Phase 3b: 设置审查模式

检查 `production/review-mode.txt` 是否已存在。

**如果存在**：读取并显示当前模式。

**如果不存在**：使用 `AskUserQuestion`：

- **Prompt**: "一个设置选择：你希望多大的审查强度？"
- **Options**:
  - `Full` — 每个工作流步骤都有主管审查。适合学习流程或重要项目。
  - `Lean (推荐)` — 仅在阶段门控处审查。平衡效率和质量。
  - `Solo` — 无审查，最大速度。适合经验丰富的用户。

写入选择到 `production/review-mode.txt`。

---

## Phase 4: 确认下一步

使用 `AskUserQuestion` 询问用户想从哪一步开始。永远不要自动运行下一个技能。

---

## Phase 5: 交接

用户确认后，简短回应："输入 `[skill 命令]` 开始。" 不要重新解释技能。

---

## 边界情况

- **用户选 D 但项目为空**：温和重定向到 Path A 或 B。
- **用户已有概念和正文**：跳过引导，显示当前状态并推荐下一步。
