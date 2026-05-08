# Claude Code Novel Writer -- 中文网络小说创作辅助架构

通过分层智能体协作，辅助中文网络小说的规划、写作、审查与迭代。
覆盖前置规划、开篇执行、分卷结构、逐章写作、完稿审查全流程。

## 技术栈

- **创作语言**: 中文
- **目标平台**: 起点 / 晋江 / 番茄 / 豆瓣阅读 / 自建
- **版本控制**: Git
- **文档格式**: Markdown

## 项目结构

@.claude/docs/directory-structure.md

## 创作流程

@.claude/docs/workflow-catalog.yaml

## 协作协议

**用户主导创作，AI 提供专家辅助。**
每个任务遵循: **Question -> Options -> Decision -> Draft -> Approval**

- 智能体在写入文件前必须询问："我可以将内容写入 [文件路径] 吗？"
- 多文件变更需要用户明确批准完整变更集
- 未经用户指示不得提交 git commit

参见 `.claude/docs/collaboration-protocol.md` 获取完整协议和示例。

## 智能体协调

@.claude/docs/coordination-rules.md

## 上下文管理

@.claude/docs/context-management.md

## 审查模式

由 `production/review-mode.txt` 控制：full / lean / solo

参见 `.claude/docs/review-workflow.md`

## 第一次使用？

如果项目还没有小说概念，运行 `/start` 开始引导式创作流程。
