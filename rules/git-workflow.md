# Git Workflow Rules

## Branch Strategy

### Branch Naming
- Features: `feat/<short-description>`
- Bug fixes: `fix/<short-description>`
- Documentation: `docs/<short-description>`
- Refactoring: `refactor/<short-description>`
- Hotfixes: `hotfix/<short-description>`

### Branch Rules
- Never commit directly to `main` or `master`
- Create a feature branch for every task
- Keep branches short-lived (merge within a few days)
- Delete branches after merging

## Commit Conventions

### Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `test` | Adding or updating tests |
| `chore` | Build process, tooling, or dependency changes |
| `style` | Formatting, semicolons, etc. (no code change) |
| `perf` | Performance improvement |

### Rules
- Subject line: imperative mood, lowercase, no period, under 72 characters
- Body: explain **what** and **why**, not **how**
- Reference issue numbers in footer: `Closes #123`
- One logical change per commit

### Examples
```
feat(auth): add password reset flow

Implement forgot-password and reset-password endpoints with
email verification token. Tokens expire after 1 hour.

Closes #45
```

```
fix(api): handle null response from payment gateway

The payment gateway occasionally returns null instead of an
error object. Added null check to prevent unhandled exception.

Fixes #112
```

## Pull Requests

### Before Creating a PR
- [ ] All tests pass
- [ ] Code follows coding standards
- [ ] Branch is up to date with base branch
- [ ] Self-review completed (run the Reviewer agent)

### PR Description
Use the template in `templates/pr-template.md`

### Merging
- Squash and merge for feature branches
- Rebase and merge for long-running branches
- Never force-push to shared branches
