# 智能体名册

以下智能体均可用。每个智能体有独立的定义文件在 `.claude/agents/` 中。根据任务选择最合适的智能体。跨领域任务由协调智能体（通常是 `production-editor` 或领域主管）委托给专家。

## Tier 1 -- 领导层 (Opus)

| Agent | 领域 | 何时使用 |
|-------|------|---------|
| `creative-director` | 最高创意权威 | 重大创意决策、支柱冲突、题材方向、开篇裁定 |
| `story-architect` | 宏观叙事结构 | 分卷规划、长篇结构、长线伏笔、高潮排布、节奏曲线 |
| `production-editor` | 生产管理 | 冲刺计划、里程碑追踪、质量门控、工作流协调 |

## Tier 2 -- 部门主管 (Sonnet)

| Agent | 领域 | 何时使用 |
|-------|------|---------|
| `plot-director` | 剧情主管 | 因果链、动机、触发、决策、后果、兑现五层结构 |
| `character-director` | 人物主管 | 人物目标、情绪、关系、身体、声音五类连续性 |
| `style-director` | 风格主管 | 文风统一、去AI味、对白风格、叙事腔调 |
| `genre-specialist` | 题材主管 | 题材诊断、平台适配、消费点分析、竞品定位 |

## Tier 3 -- 写作流程专家 (Sonnet)

| Agent | 领域 | 何时使用 |
|-------|------|---------|
| `opening-specialist` | 开篇专家 | 前300-3000字成交：抓手、卖点、异常局面、主角亮相 |
| `outline-specialist` | 大纲/章纲专家 | 黄金三章、分卷、前10-20章章纲、卷末兑现 |
| `plot-logic-specialist` | 剧情逻辑专家 | 动机、触发、决策、后果、兑现五层因果链 |
| `character-consistency-specialist` | 人物一致性专家 | 目标、情绪、关系、身体、声音五类连续性 |
| `transition-specialist` | 转场专家 | 时间跳切、空间切换、情绪承接、视角切换、章末接下章 |
| `dialogue-specialist` | 对白专家 | 关系压力、人物声音、信息嵌入、对白刀口 |
| `chapter-ending-specialist` | 章末收束专家 | 章末拉力、余韵、回钩、下章承接 |
| `anti-ai-voice-specialist` | 去AI味专家 | 清理空泛总结、套话氛围、说明书式对白、统一腔调 |
| `consistency-reviewer` | 一致性审查专家 | 六种一致性统一复查（剧情逻辑、人物目标、情绪关系、身体信息、场景转场、章末承接） |

## Tier 3 -- 大类网文专家 (Sonnet)

| Agent | 领域 | 何时使用 |
|-------|------|---------|
| `xuanhuan-specialist` | 玄幻专家 | 升级体系、世界规则、战斗描写、势力博弈、地图探索 |
| `urban-specialist` | 都市专家 | 职场规则、社会关系、金钱权力、日常张力、现实锚点 |
| `romance-specialist` | 言情专家 | 情感推进、CP张力、甜虐节奏、关系升温/破裂、心动描写 |
| `scifi-specialist` | 科幻专家 | 科学设定、未来推演、技术细节、硬软科幻平衡、概念可视化 |
| `suspense-specialist` | 悬疑专家 | 谜题设计、信息控制、误导与揭示、紧张氛围、推理链条 |
| `history-specialist` | 历史/古言专家 | 时代背景、礼仪制度、历史事件融合、古风语感 |

## 使用指南

### 选择智能体的优先级

1. **明确任务类型** → 选择对应专家
2. **跨领域任务** → 选择主管智能体协调
3. **重大决策** → 选择领导层
4. **不确定** → 选择 `production-editor` 或运行 `/help`

### 典型任务路由

| 你想做什么 | 推荐的 Agent / Skill |
|-----------|---------------------|
| 我有一个点子，不知道写什么 | `/brainstorm` → creative-director + genre-specialist |
| 确定题材和核心卖点 | `/concept-plan` → creative-director + genre-specialist |
| 设计分卷和章纲 | `/volume-outline` → story-architect + outline-specialist |
| 写第一章 | `/opening` → opening-specialist + creative-director |
| 写普通章节 | `/write-chapter` → production-editor 编排多个专家 |
| 这章感觉不对 | `/review-chapter` → consistency-reviewer |
| 剧情逻辑断裂 | `/revise-plot` → plot-logic-specialist |
| 人物崩了 | `/revise-character` → character-consistency-specialist |
| 对白太尬 | `/revise-dialogue` → dialogue-specialist |
| 有AI味 | `/polish-chapter` → anti-ai-voice-specialist + style-director |
| 我的玄幻升级体系 | creative-director + xuanhuan-specialist |
| 我的言情甜虐节奏 | creative-director + romance-specialist |
