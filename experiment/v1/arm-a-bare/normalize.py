"""Core text-normalization helpers for tidymark. Pure functions, stdlib only."""


def normalize_whitespace(text):
    """Strip trailing whitespace from every line."""
    return "\n".join(line.rstrip() for line in text.splitlines())


def normalize_bullets(text):
    # Convert '* ' and '+ ' list bullets to '- '.
    # FIXME: this global replace also rewrites '*emphasis* ' spans in prose,
    #        e.g. "an *important* note" -> "an -important- note".
    #        The replacement needs to be anchored to the start of a line.
    #        Reported, not yet fixed.
    return text.replace("* ", "- ").replace("+ ", "- ")


def fix_headings(text):
    # TODO: finish heading-level normalization
    raise NotImplementedError("heading normalization not implemented yet")
