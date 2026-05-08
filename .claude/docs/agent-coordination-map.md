# 智能体协调地图

## 组织架构图

```
                              [user]
                                |
                                | 最高决策权
                                v
+-------------------------------------------------------------+
|                       creative-director                      |
|                      (创作总监 / 总编)                        |
|              最高创意权威 · 重大决策裁定 · 跨域冲突仲裁          |
+-------------------------------------------------------------+
       |                           |                           |
       v                           v                           v
+-------------+          +-------------------+          +-------------+
|story-architect|         | production-editor  |          |[其他Tier1]  |
|故事架构师    |          | (生产总编)          |          |             |
|宏观叙事结构   |          | 进度·质量·协调      |          |             |
+-------------+          +-------------------+          +-------------+
       |                           |
       |       +-------------------+-------------------+
       |       |                   |                   |
       v       v                   v                   v
  +--------+ +--------+      +--------+      +--------+
  |plot-   | |character|     | style  |      | genre  |
  |director| |director |     |director|      |specialist
  |剧情主管 | |人物主管  |     |风格主管  |      |题材主管  |
  +--------+ +--------+      +--------+      +--------+
       |           |              |              |
       |   +-------+------+       |              |
       |   |              |       |              |
       v   v              v       v              v
  +----+----+  +----+----+  +----+----+  +----+----+
  |opening  |  |plot-logic|  |transition|  |xuanhuan|
  |specialist| |specialist|  |specialist|  |specialist
  +---------+  +---------+  +---------+  +---------+
  |outline  |  |character-|  |dialogue |  |urban   |
  |specialist| |consistency| |specialist|  |specialist
  +---------+  +---------+  +---------+  +---------+
  |chapter- |  |anti-ai-  |  |consistency| |romance |
  |ending   |  |voice     |  |reviewer  |  |specialist
  |specialist| |specialist|  +---------+  +---------+
  +---------+  +---------+                |scifi   |
                                          |specialist
                                          +---------+
                                          |suspense|
                                          |specialist
                                          +---------+
                                          |history |
                                          |specialist
                                          +---------+
```

## 委托矩阵

| 任务 | 主协调者 | 参与专家 |
|------|---------|---------|
| 概念脑暴 | creative-director | genre-specialist |
| 前置规划 | creative-director | genre-specialist, story-architect |
| 世界观设计 | story-architect | genre-specialist, [类型专家] |
| 人物设计 | character-director | creative-director, genre-specialist |
| 分卷大纲 | story-architect | outline-specialist, plot-director |
| 章纲编写 | outline-specialist | plot-director, character-director |
| 开篇写作 | opening-specialist | creative-director, style-director |
| 逐章写作 | production-editor | plot-director, character-director, transition-specialist, dialogue-specialist, chapter-ending-specialist |
| 完稿审查 | consistency-reviewer | plot-director, character-director, style-director |
| 剧情修复 | plot-logic-specialist | plot-director |
| 人物修复 | character-consistency-specialist | character-director |
| 对白修复 | dialogue-specialist | style-director |
| 转场修复 | transition-specialist | style-director |
| 去AI味 | anti-ai-voice-specialist | style-director |
| 类型咨询 | genre-specialist | [对应类型专家] |
| 里程碑回顾 | production-editor | creative-director, story-architect |
| 阶段门检查 | creative-director | story-architect, production-editor |

## 冲突解决路径

```
专家之间分歧
    |
    v
部门主管裁定
    |
    +-- 能解决 --> 执行
    |
    +-- 跨部门 --> Tier 1 裁定
                    |
                    +-- 能解决 --> 执行
                    |
                    +-- 仍分歧 --> 用户决策
```

## 信息流向

### 设计阶段（自上向下）

```
concept.md --> pillars.md --> worldbuilding/ --> characters/ --> outlines/
    |              |               |                   |              |
    v              v               v                   v              v
 creative-    story-architect   genre-specialist   character-   outline-
 director                                          director     specialist
```

### 写作阶段（横向协作）

```
chapter-outline.md --> [production-editor 协调] --> manuscript/chapter-XXX.md
                            |
                            +-- plot-director (因果链)
                            +-- character-director (人物一致性)
                            +-- transition-specialist (转场)
                            +-- dialogue-specialist (对白)
                            +-- chapter-ending-specialist (章末)
```

### 审查阶段（自下向上反馈）

```
manuscript/chapter-XXX.md --> consistency-reviewer --> [问题分类]
                                                      |
                                                      +-- 逻辑问题 --> plot-logic-specialist
                                                      +-- 人物问题 --> character-consistency-specialist
                                                      +-- 对白问题 --> dialogue-specialist
                                                      +-- 转场问题 --> transition-specialist
                                                      +-- 风格问题 --> anti-ai-voice-specialist
```
