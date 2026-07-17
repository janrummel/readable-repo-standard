# tidymark

A tiny, dependency-free CLI that tidies Markdown files:

- trims trailing whitespace
- normalizes list bullets (`*`, `+` -> `-`)

## Usage

    python tidymark.py FILE            # tidy a file in place
    python tidymark.py FILE --headings # also normalize heading levels (WIP)

## Status

Whitespace and bullet normalization work and are tested.
Heading normalization (`--headings`) is in progress.

## Tests

    python -m pytest
