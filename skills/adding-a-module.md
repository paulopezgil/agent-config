# Skill: Adding a Module

**Objective**: Introduce a new module to an existing project cleanly and consistently. Follow these directives when instructed to add a new module.

## Directives
1. **Location**: Create the new module file in the appropriate domain directory (e.g., `src/myapp/new_module.py`).
2. **Public API Wiring**: Expose the module's public components through the package's main entry point (e.g., `__init__.py` in Python, or `index.ts` in TS).
3. **Test File**: IMMEDIATELY create a corresponding test file in the `tests/` directory mirroring the source file's location.
4. **Documentation**: Update module-level docstrings and any relevant architecture documentation to reflect the new addition.

## Concrete Example: Python

**Task**: Add `text_parser` module to `utils`.

**Step 1: Create `src/utils/text_parser.py`**
```python
def parse_text(text: str) -> list[str]:
    """Parses text into tokens. Returns a list of words."""
    return text.split()
```

**Step 2: Wire `src/utils/__init__.py`**
```python
# BEFORE
from .math_utils import add

__all__ = ["add"]

# AFTER
from .math_utils import add
from .text_parser import parse_text

__all__ = ["add", "parse_text"]
```

**Step 3: Create `tests/utils/test_text_parser.py`** (Implement tests per testing skill)
```python
from utils import parse_text

def test_parse_text():
    assert parse_text("hello world") == ["hello", "world"]
```