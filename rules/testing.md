# Testing Rules

## Test Requirements

- Every new feature MUST have tests
- Every bug fix MUST have a regression test
- Minimum test coverage for new code: core logic must be covered
- Tests MUST pass before marking implementation complete

## Test Structure

### Arrange-Act-Assert Pattern
```
test("should return user when valid ID is provided", () => {
  // Arrange - set up test data and dependencies
  const userId = "user-123";
  const expectedUser = { id: userId, name: "Alice" };
  mockDb.users.findById.mockResolvedValue(expectedUser);

  // Act - execute the function under test
  const result = await getUserById(userId);

  // Assert - verify the expected outcome
  expect(result).toEqual(expectedUser);
});
```

### Test Naming
Use descriptive names that explain the scenario:
- `should [expected behavior] when [condition]`
- `returns [result] for [input description]`
- `throws [error] if [invalid condition]`

### Test Organization
```
describe("ModuleName", () => {
  describe("functionName", () => {
    it("should handle the happy path", () => { ... });
    it("should handle edge case X", () => { ... });
    it("should throw for invalid input", () => { ... });
  });
});
```

## Test Categories

### Unit Tests
- Test individual functions/methods in isolation
- Mock all external dependencies
- Fast execution (< 100ms per test)
- Located next to source files: `module.test.ts`

### Integration Tests
- Test interactions between modules
- Use real dependencies where practical (test DB, etc.)
- Located in `tests/integration/`

### End-to-End Tests
- Test complete user workflows
- Run against a full application instance
- Located in `tests/e2e/`

## What to Test

### Always Test
- Core business logic
- Input validation and error handling
- Edge cases (empty, null, boundary values)
- State transitions
- API contracts (request/response shapes)

### Don't Test
- Third-party library internals
- Simple getters/setters with no logic
- Framework boilerplate
- Private methods (test through public API)

## Mocking Guidelines

- Mock at the boundary (external APIs, databases, file system)
- Don't mock what you own — prefer real objects for internal code
- Verify mock interactions only when the interaction IS the behavior
- Reset mocks between tests to prevent state leakage

## Running Tests

```bash
# Run all tests
npm test          # JavaScript/TypeScript
pytest            # Python
go test ./...     # Go

# Run specific test file
npm test -- path/to/file.test.ts
pytest path/to/test_file.py
go test ./path/to/package

# Run with coverage
npm test -- --coverage
pytest --cov
go test -cover ./...
```
