# Project Overview

## Purpose

This is a **Claude Code project template** designed to provide automated, structured development workflows when opened in Claude Code. It ensures every task follows a consistent process: clarify requirements, plan with todos, implement following rules, test, and review.

## How It Works

1. **CLAUDE.md** is the entry point — Claude Code automatically reads it at session start
2. **Agents** define specialized roles (clarifier, planner, implementer, tester, reviewer)
3. **Rules** define coding standards, security policies, and workflow conventions
4. **Docs** provide project context and architectural decisions
5. **Templates** provide consistent formats for PRs, issues, and todos

## Workflow

```
User Request
    |
    v
[Clarifier Agent] -- Ask questions, confirm requirements
    |
    v
[Planner Agent] -- Break into todos, get approval
    |
    v
[Implementer Agent] -- Code each todo, following rules
    |
    v
[Tester Agent] -- Write and run tests
    |
    v
[Reviewer Agent] -- Review code, flag issues
    |
    v
Complete -- Commit and summarize
```

## Customization

This template is designed to be adapted to your specific project:

- **Add your tech stack** to `rules/coding-standards.md`
- **Define your architecture** in `rules/architecture.md` and `docs/architecture.md`
- **Add project-specific agents** in `agents/` for domain-specific tasks
- **Update templates** in `templates/` to match your team's conventions
- **Document your API** in `docs/api-reference.md`
- **Add setup instructions** in `docs/setup.md`
