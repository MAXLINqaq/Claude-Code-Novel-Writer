# Claude-Code-Novel-Writer

一个用于 Claude Code 的网文创作辅助库。

## 架构概览

通过分层智能体协作，辅助网文的规划、写作、审查与迭代。覆盖前置规划、开篇执行、分卷结构、逐章写作、完稿审查全流程。

## 快速开始

在 Claude Code 中打开本仓库后，运行：

```
/start
```

这会检测项目状态并引导你进入正确的起点。

## 核心工作流

| 阶段 | 技能 | 说明 |
|------|------|------|
| 概念确立 | `/brainstorm` → `/concept-plan` | 从点子到完整概念 |
| 结构设计 | `/volume-outline` | 分卷、章纲、伏笔系统 |
| 开篇试写 | `/opening` | 黄金三章 |
| 批量生产 | `/write-chapter` | 逐章写作 |
| 完稿审查 | `/review-chapter` | 六种一致性检查 |
| 精修打磨 | `/polish-chapter` | 去AI味、风格统一 |

## 智能体层级

- **Tier 1（领导层）**: creative-director, story-architect, production-editor
- **Tier 2（部门主管）**: plot-director, character-director, style-director, genre-specialist
- **Tier 3（专家）**: opening-specialist, outline-specialist, plot-logic-specialist, character-consistency-specialist, transition-specialist, dialogue-specialist, chapter-ending-specialist, anti-ai-voice-specialist, consistency-reviewer
- **Tier 3（大类专家）**: xuanhuan-specialist, urban-specialist, romance-specialist, scifi-specialist, suspense-specialist, history-specialist

## 目录结构

```
├── CLAUDE.md              # 根级入口
├── .claude/
│   ├── agents/            # 22个智能体
│   ├── skills/            # 16个技能
│   ├── hooks/             # 7个自动化钩子
│   ├── rules/             # 6个路径规则
│   └── docs/              # 文档与11个模板
├── design/novel/          # 设计文档（概念、世界观、人物）
├── manuscript/            # 正文产出
├── outlines/              # 大纲
├── production/            # 生产管理（冲刺、里程碑、审查）
└── references/            # 参考资料
```

## 设计参考

- **仓库结构参考**: [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) — Claude Code 游戏开发库
- **创作流程参考**: [Chinese-WebNovel-Skill](https://github.com/Tomsawyerhu/Chinese-WebNovel-Skill) — Codex 网络小说技能库（10个专项模块、三层创作链路）
