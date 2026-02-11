# Todo List Template

Use this format when creating todo lists for implementation tasks.

## Template

```
## Task: [Brief Description]

### Requirements (confirmed)
- [Requirement 1]
- [Requirement 2]

### Todos
1. [ ] [Setup/preparation step]
2. [ ] [Implementation step 1]
3. [ ] [Implementation step 2]
4. [ ] [Write tests for steps 1-2]
5. [ ] [Integration/wiring step]
6. [ ] [Write integration tests]
7. [ ] [Run full test suite]
8. [ ] [Self-review with Reviewer agent]
9. [ ] [Verify end-to-end]

### Notes
- [Any relevant context or gotchas]
```

## Guidelines

- Keep todos atomic — each should be completable in one focused effort
- Include the target file/module in the todo description
- Always include testing todos after implementation todos
- End with a verification todo
- Maximum 15 todos per task — split into multiple tasks if larger
