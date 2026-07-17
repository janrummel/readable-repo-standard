"""tidymark CLI: tidy a Markdown file."""
import argparse

from normalize import normalize_whitespace, normalize_bullets, fix_headings


def tidy(text, headings=False):
    text = normalize_whitespace(text)
    text = normalize_bullets(text)
    if headings:
        text = fix_headings(text)
    return text


def main():
    parser = argparse.ArgumentParser(description="Tidy a Markdown file.")
    parser.add_argument("file")
    parser.add_argument("--headings", action="store_true",
                        help="also normalize heading levels")
    args = parser.parse_args()
    with open(args.file, encoding="utf-8") as fh:
        text = fh.read()
    result = tidy(text, headings=args.headings)
    with open(args.file, "w", encoding="utf-8") as fh:
        fh.write(result)


if __name__ == "__main__":
    main()
