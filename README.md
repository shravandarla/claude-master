# Claude Code Project Template

A ready-to-use project structure for Claude Code that automatically loads rules, agents, and documentation — providing a structured, todo-driven development workflow.

## What This Does

When you open this project with Claude Code:

1. **CLAUDE.md** is loaded automatically with all project instructions
2. **Agents** (clarifier, planner, implementer, tester, reviewer) define the workflow
3. **Rules** (coding standards, security, testing, git, architecture) enforce quality
4. **Docs** provide project context and conventions
5. **Templates** ensure consistent PRs, issues, and todo lists
6. **SessionStart hook** verifies the environment on startup

## Workflow

Every task follows this pipeline:

```
Request --> Clarify --> Plan (todos) --> Implement --> Test --> Review --> Done
```

- The **Clarifier** asks questions before work begins
- The **Planner** breaks tasks into a numbered todo list
- The **Implementer** executes todos one-by-one following all rules
- The **Tester** writes and runs tests for each change
- The **Reviewer** performs a final quality and security check

## Project Structure

```
.
├── CLAUDE.md                  # Master instructions (auto-loaded by Claude Code)
├── .claude/
│   └── settings.json          # Claude Code settings and hooks
├── agents/
│   ├── clarifier.md           # Asks clarifying questions
│   ├── planner.md             # Breaks tasks into todos
│   ├── implementer.md         # Writes code following rules
│   ├── tester.md              # Writes and runs tests
│   └── reviewer.md            # Reviews code quality and security
├── rules/
│   ├── coding-standards.md    # Language and style conventions
│   ├── git-workflow.md        # Branch, commit, PR conventions
│   ├── testing.md             # Test requirements and patterns
│   ├── security.md            # Security checklist
│   └── architecture.md        # Architectural constraints
├── docs/
│   ├── project-overview.md    # Project description
│   ├── architecture.md        # System architecture
│   ├── conventions.md         # Naming and file conventions
│   ├── api-reference.md       # API documentation
│   └── setup.md               # Dev environment setup
├── templates/
│   ├── todo-template.md       # Standard todo list format
│   ├── pr-template.md         # Pull request template
│   └── issue-template.md      # Issue report template
├── scripts/
│   └── load-context.sh        # Environment verification script
└── README.md                  # This file
```

## Getting Started

### 1. Clone and Customize

```bash
git clone <this-repo-url> my-project
cd my-project
```

### 2. Customize for Your Project

- Edit `rules/coding-standards.md` with your language and style preferences
- Update `rules/architecture.md` with your project's architecture
- Fill in `docs/architecture.md` with your system design
- Add your tech stack to `docs/setup.md`
- Update `docs/api-reference.md` as you build endpoints

### 3. Add Your Source Code

Create your `src/` and `tests/` directories and start building. Claude Code will follow all the rules and agents defined in this template.

### 4. Add Custom Agents (Optional)

Create new `.md` files in `agents/` for domain-specific roles:
- `agents/database-expert.md` — for migration and query optimization tasks
- `agents/api-designer.md` — for API design decisions
- `agents/performance-optimizer.md` — for performance-related tasks

Reference them in `CLAUDE.md` to activate them.

### 5. Add Custom Rules (Optional)

Create new `.md` files in `rules/` for project-specific standards:
- `rules/accessibility.md` — for UI accessibility requirements
- `rules/performance.md` — for performance budgets
- `rules/i18n.md` — for internationalization rules

Reference them in `CLAUDE.md` to activate them.

## How the Todo System Works

1. You describe what you want
2. Claude asks clarifying questions (if needed)
3. Claude creates a numbered todo list
4. Each todo is executed in order:
   - Marked `in_progress` before starting
   - Marked `completed` immediately after finishing
   - Only one todo is active at a time
5. After all todos complete, Claude summarizes what was done

## Customization Checklist

After cloning, go through these items:

- [ ] Update `rules/coding-standards.md` for your language
- [ ] Update `rules/architecture.md` for your project structure
- [ ] Fill in `docs/project-overview.md`
- [ ] Fill in `docs/architecture.md`
- [ ] Fill in `docs/setup.md`
- [ ] Update `.claude/settings.json` permissions for your tools
- [ ] Add project-specific agents if needed
- [ ] Add project-specific rules if needed
