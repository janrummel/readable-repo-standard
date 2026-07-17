"""Core text-normalization helpers for tidymark. Pure functions."""


def normalize_whitespace(text):
    """Strip trailing whitespace from every line."""
    return "\n".join(line.rstrip() for line in text.splitlines())


def normalize_bullets(text):
    """Convert '* ' and '+ ' list bullets to '- '."""
    return text.replace("* ", "- ").replace("+ ", "- ")


def fix_headings(text, base_level=1):
    """Normalize heading levels so the top-most heading sits at `base_level`.

    Every ATX heading is shifted by the same delta as the first heading found.
    """
    lines = text.splitlines()
    first = None
    for line in lines:
        if line.startswith("#"):
            first = len(line) - len(line.lstrip("#"))
            break
    if first is None:
        return text
    delta = base_level - first
    out = []
    for line in lines:
        if line.startswith("#"):
            level = len(line) - len(line.lstrip("#"))
            new_level = max(1, level + delta)
            out.append("#" * new_level + line.lstrip("#"))
        else:
            out.append(line)
    # TODO: skip fenced code blocks (``` ... ```) so a '#' inside code is not shifted
    return "\n".join(out)
