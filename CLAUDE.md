# Luthien Development Guide

## Core Commands
- **Install Dependencies**: `cd luthien_demo && poetry install`
- **Run Tests**: `cd luthien_demo && poetry run pytest`
- **Run Single Test**: `cd luthien_demo && poetry run pytest tests/test_file.py::test_function -v`
- **Format Code**: `cd luthien_demo && poetry run black . && poetry run isort .`
- **Type Check**: `cd luthien_demo && poetry run mypy .`
- **Lint Code**: `cd luthien_demo && poetry run ruff check .`
- **Website Dev Server**: `cd luthien_site && npm start`
- **Build Website**: `cd luthien_site && npm run build`

## Code Style Guidelines
- **Python**: Use Python 3.13+ with strict type hints
- **Formatting**: Black (88 chars), isort for imports (profile=black)
- **Linting**: Ruff with rules E, F, B, I, N, UP, PL, RUF
- **Type Checking**: Strict mypy settings with all warnings enabled
- **Imports**: Group standard lib, third-party libs, local modules
- **Naming**: Classes=PascalCase, functions/vars=snake_case, constants=UPPER_SNAKE_CASE
- **Error Handling**: Catch specific exceptions, add context, use type annotations
- **Documentation**: All public functions/classes need docstrings with types
- **Markdown**: Use standard formatting, specify language in code blocks

## Repository Structure
- **luthien_demo/**: Main Python framework (Poetry project)
- **luthien_site/**: Website using Eleventy (npm project)
- Both are git submodules in the main repository