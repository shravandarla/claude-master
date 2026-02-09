# Project Conventions

## File Naming

| Type | Convention | Example |
|------|-----------|---------|
| Source files | kebab-case | `user-service.ts` |
| Test files | kebab-case + `.test` | `user-service.test.ts` |
| Components (React) | PascalCase | `UserProfile.tsx` |
| Constants files | kebab-case | `error-codes.ts` |
| Config files | kebab-case | `database-config.ts` |
| Type/Interface files | kebab-case | `user-types.ts` |

## Directory Structure

- Group by feature/domain first, then by type
- Keep related files close together
- Tests live next to the code they test

```
src/
  users/
    user-service.ts
    user-service.test.ts
    user-repository.ts
    user-controller.ts
    user-types.ts
```

## Naming Conventions

### Variables
- Descriptive names: `userEmail` not `ue`
- Booleans: `isActive`, `hasPermission`, `shouldRetry`
- Collections: plural nouns: `users`, `orderItems`
- Counts: `userCount`, `retryCount`

### Functions
- Verb + noun: `getUser`, `createOrder`, `validateEmail`
- Event handlers: `onSubmit`, `handleClick`, `onUserCreated`
- Predicates: `isValid`, `hasAccess`, `canDelete`

### Constants
- `UPPER_SNAKE_CASE`: `MAX_RETRIES`, `DEFAULT_TIMEOUT`

### Types/Interfaces
- PascalCase: `User`, `OrderItem`, `ApiResponse`
- Prefix interfaces with `I` only if the project already does this

## Import Order

1. External/third-party libraries
2. Internal shared modules (from `@/` or `~/`)
3. Relative imports from parent directories
4. Relative imports from current/child directories

Separate each group with a blank line.

## Comment Conventions

- **Don't comment what** — the code should be self-explanatory
- **Do comment why** — explain non-obvious reasoning
- Use `TODO:` for planned improvements (include ticket number if available)
- Use `FIXME:` for known issues that need attention
- Use `HACK:` for intentional workarounds (explain why)
- Remove commented-out code — use git history instead
