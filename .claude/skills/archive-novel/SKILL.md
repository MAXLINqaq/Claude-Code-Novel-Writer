---
name: archive-novel
description: "完结归档——将当前小说的所有设计稿、大纲、正文、审查记录等归档至 archives/，清理创作目录为新小说腾出空间。当你完成了一部小说、想要开始新小说、或提到归档/完结/封存/小说写完了等词时使用此技能。"
argument-hint: "[--name 小说名称]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

当此技能被调用时：

1. **提取小说名称**：从 `design/novel/concept.md` 读取书名作为归档文件夹名。
2. **确认归档范围**：列出将要归档的所有文件和目录，请用户确认。
3. **执行归档**：将所有小说内容移至 `archives/<小说名>/`。
4. **重置创作目录**：在原位置重建空的目录结构，放置 .gitkeep。
5. **询问 git 提交**：询问用户是否创建归档提交。

---

## 归档范围

### 需要归档的目录

| 源目录 | 归档位置 | 说明 |
|--------|---------|------|
| `design/novel/` | `archives/<名称>/design/novel/` | 概念、支柱、世界观、人物档案 |
| `manuscript/` | `archives/<名称>/manuscript/` | 全部卷章正文 |
| `outlines/` | `archives/<名称>/outlines/` | 总大纲、分卷大纲、章纲 |
| `production/reviews/` | `archives/<名称>/production/reviews/` | 审查记录 |
| `production/sprints/` | `archives/<名称>/production/sprints/` | 创作冲刺计划 |
| `production/milestones/` | `archives/<名称>/production/milestones/` | 里程碑记录 |
| `production/session-state/` | `archives/<名称>/production/session-state/` | 会话状态快照 |
| `production/session-logs/` | `archives/<名称>/production/session-logs/` | 会话日志 |
| `references/` | `archives/<名称>/references/` | 参考资料（如非空） |

### 不归档的内容（项目基础设施，必须保留）

- `CLAUDE.md`、`README.md`、`LICENSE`、`.gitignore`
- `.claude/`（技能、智能体、钩子、规则、文档）
- `.git/`
- `production/review-mode.txt`（审查模式配置，跨小说共用）
- `.gitkeep` 文件（目录占位标记，归档后原位置重建即可）

---

## 执行步骤

### 步骤 1：提取书名

读取 `design/novel/concept.md`，从 `**书名**: 《...》` 行提取书名。

如果 `concept.md` 不存在或无法提取书名，使用 `AskUserQuestion` 询问用户手动输入小说名称。

### 步骤 2：确认归档

列出以下信息并使用 `AskUserQuestion` 请用户确认：

- 小说名称
- 将要归档的目录列表及其文件数量
- 归档目标路径：`archives/<小说名>/`
- 将要清理并重建空目录的源目录

只有用户明确批准后才执行文件操作。

### 步骤 3：处理冲突

检查 `archives/<小说名>/` 是否已存在：

- 如果不存在：正常继续
- 如果已存在：使用 `AskUserQuestion` 警告用户，提供选项：
  - **覆盖**：删除旧归档，重新归档
  - **重命名**：使用备选名称（如 `<小说名>-v2`）
  - **取消**：中止操作

### 步骤 4：移动文件至归档

创建归档目录结构：

```bash
mkdir -p "archives/<小说名>"
```

对每个源目录，移动内容到对应的归档位置：

- 对于 git 跟踪的文件：使用 `git mv` 保留版本历史
- 对于 gitignored 的文件（`session-state/`、`session-logs/`）：使用 `mv` 直接移动
- 不移动 `.gitkeep` 文件（它们是基础设施标记，不是小说内容）

操作后验证：
- 确认归档目录中存在文件
- 确认源目录中除 `.gitkeep` 外无其他文件

### 步骤 5：重建空目录结构

在源位置重建空的目录结构，每个叶目录放置 `.gitkeep` 文件：

```
design/novel/.gitkeep
design/novel/characters/.gitkeep
design/novel/characters/supporting/.gitkeep
design/novel/worldbuilding/.gitkeep
manuscript/.gitkeep
outlines/.gitkeep
outlines/chapter-outlines/.gitkeep
production/reviews/.gitkeep
production/milestones/.gitkeep
production/sprints/.gitkeep
production/session-state/.gitkeep
production/session-logs/.gitkeep
references/.gitkeep
```

### 步骤 6：询问 git 提交

使用 `AskUserQuestion` 询问用户是否创建 git commit。

如果用户同意：

```bash
git add -A
git commit -m "$(cat <<'EOF'
archive: 《<小说名>》完成归档

将设计稿、大纲、正文、审查记录等归档至 archives/<小说名>/
清理创作目录，准备开始新小说创作

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

### 步骤 7：更新会话状态

更新 `production/session-state/active.md`，重置为初始状态：

```markdown
# Session State

## 当前阶段
概念确立

## 当前工作
- 状态：上一部小说《<名称>》已归档至 archives/<名称>/
- 准备开始新小说创作

## 最近完成
1. /archive-novel → 《<名称>》归档完成

## 下一步计划
/start 或 /brainstorm → 开始新小说创意脑暴
```

---

## 安全规则

- **文件操作前必须获得用户确认**——不得跳过确认直接操作
- **先验证再清理**——确认归档目录中有内容后再删除源文件
- **绝不触碰基础设施**——`.claude/`、`CLAUDE.md`、`.git/`、`production/review-mode.txt` 不可修改
- **session-state/ 和 session-logs/ 是 gitignored**——使用 `mv` 而非 `git mv` 处理这些目录
- **归档完成后验证**——检查归档目录非空、源目录已清空（除 .gitkeep）
- **不支持撤销**——归档操作不可逆（git 历史可恢复跟踪文件，但 gitignored 文件无法恢复），确认时提醒用户

---

## 参考：目录清理对比

归档前 → 归档后：

```
设计稿:  design/novel/concept.md      → archives/<名称>/design/novel/concept.md
         design/novel/pillars.md       → archives/<名称>/design/novel/pillars.md
         design/novel/characters/*.md  → archives/<名称>/design/novel/characters/*.md

正文:    manuscript/volume-*/chapter-*.md → archives/<名称>/manuscript/volume-*/chapter-*.md

大纲:    outlines/*.md                 → archives/<名称>/outlines/*.md
         outlines/chapter-outlines/*.md → archives/<名称>/outlines/chapter-outlines/*.md

生产:    production/reviews/*          → archives/<名称>/production/reviews/*
         production/sprints/*          → archives/<名称>/production/sprints/*
         production/milestones/*       → archives/<名称>/production/milestones/*
         production/session-state/*    → archives/<名称>/production/session-state/*
         production/session-logs/*     → archives/<名称>/production/session-logs/*
```

---

## 下一步

归档完成后，建议：

1. `/start` — 引导式创作流程，从零开始规划新小说
2. `/brainstorm` — 直接进入创意脑暴阶段
3. 手动编辑 `production/review-mode.txt` 如需调整审查模式
