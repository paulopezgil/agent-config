# Skill: Writing Tests

**Objective**: Implement robust, maintainable tests for the codebase. You must follow these directives strictly when generating test files.

## Directives
- **File Naming**: Match the source file name with a test-specific prefix or suffix. For Python, use `test_<module>.py`. For TypeScript, use `<module>.spec.ts`.
- **Structure**: Group related tests logically using classes or describe blocks. Always use the Arrange-Act-Assert pattern.
- **Coverage Requirement**: You MUST write tests for both the "happy path" (expected behavior) and the "error path" (exceptions, invalid inputs, boundary conditions).
- **Prohibitions**: DO NOT mock internal implementation details; only mock external system boundaries (network calls, DB queries, OS interactions). DO NOT write complex logic (loops/conditionals) inside tests.

## Python / Pytest Specifics
- Use `pytest` fixtures for setup and teardown instead of standard class methods.
- Use `pytest.raises` for testing exceptions and error paths.
- Parameterize repetitive test cases using `@pytest.mark.parametrize` to avoid duplicated code.

## Concrete Example: Python/Pytest

```python
import pytest
from myapp.calculator import divide

# Happy Path
@pytest.mark.parametrize("a, b, expected", [
    (10, 2, 5.0),
    (9, 3, 3.0),
    (-4, 2, -2.0)
])
def test_divide_success(a, b, expected):
    # Act
    result = divide(a, b)
    # Assert
    assert result == expected

# Error Path
def test_divide_by_zero():
    # Arrange / Act / Assert
    with pytest.raises(ValueError, match="Cannot divide by zero"):
        divide(10, 0)
```