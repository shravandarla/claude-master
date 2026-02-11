# Architecture Rules

## Design Principles

1. **Separation of Concerns** — Each module has a single, well-defined responsibility
2. **Dependency Inversion** — Depend on abstractions, not concrete implementations
3. **Interface Segregation** — Small, focused interfaces over large, general ones
4. **Don't Repeat Yourself** — But only abstract after 3+ duplications
5. **Fail Fast** — Validate inputs early, return errors immediately

## Project Structure

### Layered Architecture
```
src/
  config/          # Configuration loading and validation
  routes/          # HTTP route definitions (thin layer)
  controllers/     # Request handling, validation, response formatting
  services/        # Business logic (core of the application)
  repositories/    # Data access layer (DB queries, external APIs)
  models/          # Data models and type definitions
  middleware/      # Cross-cutting concerns (auth, logging, errors)
  utils/           # Pure utility functions (no side effects)
```

### Layer Rules
| Layer | Can Depend On | Cannot Depend On |
|-------|--------------|-------------------|
| Routes | Controllers, Middleware | Services, Repositories |
| Controllers | Services, Models | Repositories directly |
| Services | Repositories, Models, other Services | Controllers, Routes |
| Repositories | Models, Config | Services, Controllers |
| Models | Nothing (pure data) | Everything else |
| Utils | Nothing (pure functions) | Everything else |

### Key Rules
- **No circular dependencies** between modules
- **No business logic in controllers** — delegate to services
- **No direct DB access from controllers** — go through services and repositories
- **No HTTP concepts in services** — services should be framework-agnostic
- **No side effects in utils** — pure functions only

## API Design

### REST Conventions
- Use plural nouns for resources: `/users`, `/orders`
- Use HTTP methods correctly: GET (read), POST (create), PUT (replace), PATCH (update), DELETE (remove)
- Return appropriate status codes: 200, 201, 204, 400, 401, 403, 404, 500
- Use consistent response envelope:
```json
{
  "data": {},
  "error": null,
  "meta": { "page": 1, "total": 100 }
}
```

### Error Responses
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email format is invalid",
    "details": [
      { "field": "email", "message": "Must be a valid email address" }
    ]
  }
}
```

## Database

- Use migrations for all schema changes (never modify DB manually)
- Index columns used in WHERE clauses and JOINs
- Use transactions for operations that modify multiple tables
- Use connection pooling for production environments

## Adding New Dependencies

Before adding a new dependency:
1. Check if the functionality can be implemented with existing dependencies
2. Evaluate the package: maintenance activity, security history, bundle size
3. Prefer well-maintained packages with active communities
4. Pin exact versions in package.json / requirements.txt
5. Document why the dependency was added in the commit message
