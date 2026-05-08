# 环境要求

## 必需

- **Claude Code CLI** — 最新版本
- **Git** — 用于版本控制
- **Bash** — 用于 hooks 脚本（Windows 用户需安装 Git Bash 或 WSL）

## 可选

- **Markdown 编辑器** — 用于直接编辑文件（VS Code、Typora 等）
- **字数统计工具** — 可选，hooks 会提供基础统计

## 初始设置

### 1. 审查模式

编辑 `production/review-mode.txt`，选择以下之一：

```
lean
```

选项：
- `full` — 每个工作流步骤都有主管审查（适合新手或重要项目）
- `lean` — 仅在阶段门控处审查（推荐默认）
- `solo` — 无审查，最大速度（适合经验丰富的用户）

### 2. 本地配置

如有需要，创建 `.claude/settings.local.json` 覆盖全局设置：

```json
{
  "permissions": {
    "allow": ["Bash(custom-command *)"]
  }
}
```

### 3. Git 忽略

确保 `.gitignore` 包含：

```
production/session-state/
production/session-logs/
*.local.json
```

## 首次启动

在 Claude Code 中打开本仓库后：

1. 运行 `/start` 开始引导式初始化
2. 或手动创建 `design/novel/concept.md` 开始创作

## 平台适配

本架构为中文网络小说设计，默认创作语言为中文。

如需切换到其他语言，修改 `CLAUDE.md` 中的技术栈声明，并更新各 agent 的语言要求。
