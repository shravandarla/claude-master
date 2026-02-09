# Project Instructions for Claude Code

> This file is automatically loaded by Claude Code at the start of every session.
> It defines the rules, agents, workflows, and conventions for this project.

---

## 1. Session Startup Behavior

When a session starts:

1. **Read all rules** from `rules/` directory
2. **Read all agent definitions** from `agents/` directory
3. **Read project docs** from `docs/` directory
4. **Ask clarifying questions** before starting any work (see Clarification Workflow below)
5. **Break the task into a todo list** using the TodoWrite tool
6. **Execute todos sequentially**, following the relevant agent and rules for each step

---

## 2. Clarification Workflow

**BEFORE writing any code**, always follow this process:

1. Read the user's request carefully
2. Identify ambiguities, missing details, or assumptions
3. Ask targeted clarifying questions such as:
   - What is the expected input/output?
   - Are there edge cases to handle?
   - Which existing modules or patterns should be followed?
   - What are the acceptance criteria?
   - Are there any constraints (performance, compatibility, etc.)?
4. Wait for the user's response before proceeding
5. Summarize the confirmed requirements back to the user
6. Only then create the todo list and begin implementation

**Exception**: If the task is unambiguous and fully specified, skip to todo creation.

---

## 3. Todo-Driven Workflow

Every task MUST follow this workflow:

1. **Plan** - Break the task into small, concrete todos using TodoWrite
2. **Execute** - Work through todos one at a time, marking each `in_progress` before starting
3. **Verify** - After completing a todo, verify it works before marking `completed`
4. **Report** - After all todos are done, summarize what was accomplished

Rules:
- Only ONE todo should be `in_progress` at any time
- Never skip a todo — complete them in order
- If a todo is blocked, create a sub-todo to resolve the blocker first
- Mark todos `completed` immediately after finishing, not in batches

---

## 4. Rules (auto-loaded from `rules/`)

The following rule files are loaded at session start:

| File | Purpose |
|------|---------|
| `rules/coding-standards.md` | Language-specific coding conventions |
| `rules/git-workflow.md` | Branch, commit, and PR conventions |
| `rules/testing.md` | Testing requirements and patterns |
| `rules/security.md` | Security checklist and guidelines |
| `rules/architecture.md` | Architectural patterns and constraints |

**To add a new rule**: Create a `.md` file in `rules/` and reference it here.

---

## 5. Agents (auto-loaded from `agents/`)

Specialized agents are defined in the `agents/` directory. Each agent has a specific role:

| Agent | File | Role |
|-------|------|------|
| Clarifier | `agents/clarifier.md` | Asks clarifying questions before work begins |
| Planner | `agents/planner.md` | Breaks tasks into structured todo lists |
| Implementer | `agents/implementer.md` | Writes code following rules and patterns |
| Reviewer | `agents/reviewer.md` | Reviews code for quality, security, standards |
| Tester | `agents/tester.md` | Writes and runs tests for implemented code |

**Agent execution order for new features**:
`Clarifier -> Planner -> Implementer -> Tester -> Reviewer`

**Agent execution order for bug fixes**:
`Clarifier -> Planner -> Implementer -> Tester`

---

## 6. Documentation (from `docs/`)

| File | Purpose |
|------|---------|
| `docs/project-overview.md` | High-level project description and goals |
| `docs/architecture.md` | System architecture and design decisions |
| `docs/conventions.md` | Naming, file structure, and style conventions |
| `docs/api-reference.md` | API endpoints and data models |
| `docs/setup.md` | Development environment setup instructions |

---

## 7. Templates (from `templates/`)

Use these templates when creating standardized artifacts:

- `templates/todo-template.md` — Standard todo list format
- `templates/pr-template.md` — Pull request description template
- `templates/issue-template.md` — Issue report template

---

## 8. Key Conventions

### File Structure
```
project-root/
  CLAUDE.md              # This file — master instructions
  .claude/               # Claude Code settings and hooks
    settings.json        # Project-level Claude settings
  agents/                # Agent prompt definitions
  rules/                 # Coding and workflow rules
  docs/                  # Project documentation
  templates/             # Reusable templates
  scripts/               # Helper scripts
  src/                   # Source code (created per project)
  tests/                 # Test files (created per project)
```

### Commit Messages
- Use conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`
- Keep the subject line under 72 characters
- Reference issue numbers when applicable

### Branch Naming
- Features: `feat/<description>`
- Fixes: `fix/<description>`
- Docs: `docs/<description>`

---

## 9. Quality Gates

Before marking any implementation task as complete, verify:

- [ ] Code follows `rules/coding-standards.md`
- [ ] No security issues per `rules/security.md`
- [ ] Tests written and passing per `rules/testing.md`
- [ ] Architecture aligns with `rules/architecture.md`
- [ ] Git conventions followed per `rules/git-workflow.md`
