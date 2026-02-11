# Coding Standards

## General Principles

1. **Readability over cleverness** — Code is read far more than it is written
2. **Consistency over preference** — Follow existing patterns in the codebase
3. **Simplicity over abstraction** — Don't abstract until you have 3+ duplications
4. **Explicit over implicit** — Make behavior obvious from the code

## Naming Conventions

### Variables and Functions
- Use `camelCase` for variables and functions (JS/TS)
- Use `snake_case` for variables and functions (Python)
- Use descriptive names: `getUserById` not `getUser` or `fetch`
- Boolean variables start with `is`, `has`, `should`, `can`: `isActive`, `hasPermission`
- Avoid single-letter names except in short loops (`i`, `j`) or lambdas

### Files and Directories
- Use `kebab-case` for file names: `user-service.ts`, `auth-middleware.py`
- Group by feature/domain, not by type (prefer `users/controller.ts` over `controllers/users.ts`)
- Test files mirror source files: `user-service.ts` -> `user-service.test.ts`

### Constants
- Use `UPPER_SNAKE_CASE` for true constants: `MAX_RETRIES`, `API_BASE_URL`
- Use regular naming for configuration objects that happen to be const

## Code Structure

### Functions
- Maximum ~30 lines per function (excluding setup/config)
- Single responsibility — one function does one thing
- Maximum 4 parameters; use an options object for more
- Return early for guard clauses instead of deep nesting

### Files
- Maximum ~300 lines per file
- One primary export per file
- Imports ordered: external libraries -> internal modules -> relative imports
- Group related functions together

### Error Handling
- Handle errors at the appropriate level (not everywhere)
- Use typed/specific errors, not generic strings
- Log errors with context (what operation failed, with what inputs)
- Never silently swallow errors

## Language-Specific

### JavaScript/TypeScript
- Use TypeScript for all new files
- Use `const` by default, `let` when reassignment is needed, never `var`
- Use async/await over raw promises
- Use optional chaining (`?.`) and nullish coalescing (`??`)
- Prefer `interface` over `type` for object shapes

### Python
- Follow PEP 8
- Use type hints for function signatures
- Use dataclasses or Pydantic for data structures
- Use pathlib for file operations
- Use context managers for resource handling

### Go
- Follow standard Go conventions (gofmt, golint)
- Use meaningful receiver names (not single letters)
- Handle errors explicitly — no blank identifier for errors
- Use table-driven tests
