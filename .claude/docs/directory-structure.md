# 目录结构说明

## 根级文件

| 文件 | 说明 |
|------|------|
| `CLAUDE.md` | Claude Code 主入口配置，轻量级引用模式 |
| `README.md` | 项目对外说明 |

## `.claude/` — Claude Code 配置目录

| 目录 | 说明 |
|------|------|
| `settings.json` | Claude Code 核心配置（hooks、permissions、skills 映射） |
| `settings.local.json` | 本地覆盖配置（不提交到 git） |
| `agents/` | 智能体定义（YAML Frontmatter + Markdown 正文） |
| `skills/` | 技能定义（每个 skill 一个子目录，内含 `SKILL.md`） |
| `hooks/` | 自动化钩子脚本（Bash，跨平台兼容） |
| `rules/` | 路径级规则文件（编辑匹配路径的文件时自动生效） |
| `docs/` | 内部文档与模板 |
| `docs/templates/` | 文档模板 |

## `design/novel/` — 小说设计文档（只读参考，不直接产出正文）

| 目录/文件 | 说明 |
|-----------|------|
| `concept.md` | 小说概念文档（由 brainstorm/concept-plan 产出） |
| `pillars.md` | 核心支柱文档 |
| `worldbuilding/` | 世界观设计 |
| `worldbuilding/rules.md` | 世界规则 |
| `worldbuilding/factions.md` | 势力/组织 |
| `worldbuilding/locations.md` | 地点 |
| `worldbuilding/timeline.md` | 时间线 |
| `characters/` | 人物设计 |
| `characters/protagonist.md` | 主角档案 |
| `characters/supporting/` | 配角档案 |
| `characters/antagonist.md` | 反派档案 |

## `manuscript/` — 正文产出

```
manuscript/
├── volume-01/
│   ├── chapter-001.md
│   ├── chapter-002.md
│   └── ...
├── volume-02/
└── ...
```

## `outlines/` — 大纲文档

| 文件 | 说明 |
|------|------|
| `master-outline.md` | 总大纲 |
| `volume-01-outline.md` | 第一卷大纲 |
| `chapter-outlines/` | 章纲 |

## `production/` — 生产管理

| 目录/文件 | 说明 |
|-----------|------|
| `review-mode.txt` | 审查模式：full / lean / solo |
| `sprints/` | 创作冲刺计划 |
| `milestones/` | 里程碑定义 |
| `session-state/` | 会话状态（活检查点，gitignored） |
| `session-logs/` | 会话日志（gitignored） |
| `reviews/` | 审查记录 |

## `references/` — 参考资料

用户自行维护的参考资料、灵感素材、竞品分析等。

## 文件分工原则

- **设计文档** (`design/`) 是"蓝图"，回答"要写什么"
- **大纲文档** (`outlines/`) 是"施工计划"，回答"怎么写"
- **正文** (`manuscript/`) 是"建筑成品"，直接面向读者
- **生产管理** (`production/`) 是"项目管理"，追踪进度与质量

**规则**: 设计文档的变更必须通过审查才能同步到正文；正文不得反向修改设计文档。
