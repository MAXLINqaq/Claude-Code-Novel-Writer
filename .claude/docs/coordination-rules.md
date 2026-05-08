# 智能体协调规则

## 组织架构

```
                    creative-director
                   (创作总监/总编)
                          |
        +-----------------+-----------------+
        |                 |                 |
  story-architect   production-editor   [user]
 (故事架构师)        (生产总编)          (用户 — 最高决策权)
        |                 |
   +----+----+       +----+----+
   |    |    |       |    |    |
  plot character style genre [其他Tier2]
```

## 委托规则

### 垂直委托

**Tier 1 -> Tier 2 -> Tier 3**

1. 领导层（Tier 1）做战略决策：题材方向、核心定位、重大创意选择
2. 部门主管（Tier 2）做战术规划：具体系统设计、资源分配、工作流编排
3. 专家（Tier 3）做具体执行：章节写作、逻辑修复、风格润色

### 委托路径

| 任务类型 | 委托路径 |
|---------|---------|
| 概念/题材决策 | creative-director -> genre-specialist |
| 分卷/长线结构 | story-architect -> outline-specialist |
| 逐章写作 | production-editor 编排 plot-director + character-director + transition-specialist + dialogue-specialist + chapter-ending-specialist |
| 完稿审查 | production-editor -> consistency-reviewer |
| 风格润色 | style-director -> anti-ai-voice-specialist |
| 类型专家咨询 | genre-specialist -> [xuanhuan/urban/romance/scifi/suspense/history]-specialist |

## 协作模式

### 模式 A：串行委托（默认）

一个智能体完成任务后，结果传递给下一个智能体。

适用场景：
- 概念规划 -> 大纲设计 -> 章纲编写
- 写作 -> 审查 -> 修复 -> 再审

### 模式 B：并行咨询

多个同级智能体同时工作，各自提供专业意见。

适用场景：
- 章节审查：plot-director 检查逻辑 + character-director 检查人物 + style-director 检查文风
- 类型诊断：genre-specialist + 对应类型专家同时分析

### 模式 C：会审（Round Table）

多个智能体讨论后达成共识，由领导层做最终裁定。

适用场景：
- 重大创意分歧
- 跨领域冲突（如剧情需要 vs 人物性格冲突）

## 上报路径

当智能体遇到以下情况时必须上报：

| 情况 | 上报对象 |
|------|---------|
| 发现与上级决策冲突 | 直接上级 |
| 同级专家意见不一致 | 共同的部门主管 |
| 涉及多个部门主管的冲突 | creative-director |
| 进度/资源问题 | production-editor |
| 需要用户决策 | 直接询问用户 |

## 用户介入点

用户可以在以下节点随时介入：

1. **概念确立后** — 确认/修改核心创意
2. **大纲完成后** — 确认/修改故事结构
3. **每章写作前** — 确认章纲
4. **每章写作后** — 确认/修改正文
5. **审查后** — 确认/驳回审查意见
6. **任何阶段** — 直接修改任何文件

## 智能体通信协议

### 智能体之间传递信息时：

1. **引用来源**：说明信息来自哪个文件（如 "根据 design/novel/characters/protagonist.md"）
2. **标记状态**：说明信息是最新/已确认/待验证/推测
3. **提出假设**：如果信息不完整，明确标注假设条件
4. **建议行动**：如果不确定，建议下一步该做什么

### 智能体向用户汇报时：

1. **摘要优先**：先给结论，再给细节
2. **选项呈现**：提供 2-4 个可行方案
3. **风险提醒**：指出潜在问题或风险
4. **明确请求**：清楚说明需要什么决策或批准

## 冲突解决优先级

当不同智能体的建议冲突时：

1. 用户明确指示 > 一切
2. creative-director 的创意裁定
3. story-architect 的结构裁定
4. production-editor 的进度裁定
5. 专业领域内：对应主管的裁定
6. 同级冲突：会审讨论，由上级裁定

## 禁止行为

- 智能体不得绕过用户直接修改已批准的文档
- 智能体不得在没有审查的情况下跳过质量门
- 智能体不得替用户做创意决策（可以提供建议，但必须等待确认）
- 智能体不得在对话中声称已写入文件（必须实际执行 Write/Edit 操作）
