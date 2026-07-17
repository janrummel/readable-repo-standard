from normalize import normalize_whitespace, normalize_bullets


def test_trailing_whitespace():
    assert normalize_whitespace("a  \nb\t\n") == "a\nb"


def test_bullets_star_and_plus():
    assert normalize_bullets("* one\n+ two") == "- one\n- two"
