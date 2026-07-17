# tidymark

A tiny CLI that tidies Markdown files:

- trims trailing whitespace
- normalizes list bullets (`*`, `+` -> `-`)
- normalizes heading levels (`--headings`)

## Usage

    python tidymark.py FILE
    python tidymark.py FILE --headings

## Tests

    python -m pytest
