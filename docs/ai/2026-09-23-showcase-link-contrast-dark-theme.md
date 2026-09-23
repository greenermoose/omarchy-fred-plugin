# 2026-09-23 — Showcase Link Readability & Contrast on Dark Theme

- **Tool:** Antigravity CLI (`agy`) `1.2.9`
- **Model:** Gemini 3.8 Flash (High) (`gemini-3.8-flash-high`)
- **Session:** `aee97cdc-9ba8-4632-ab2c-0815cb66686c`
- **User prompt:**
  > On plugin-fred-tamlinux I edited the docs/index.html page to link to my tamlinux repo. But the visited link color on a black background makes it hard to read. Fix the CSS so that there is still a difference between unvisited and visited links, but the unvisited link color is more readable on the black background.

## Key Decisions & Implementation Notes

- **Dark Theme Link Styling**: Default browser links on dark backgrounds default to `#0000ee` (unvisited blue) and `#551a8b` (visited purple), both of which suffer from severe contrast deficiency against the `--bg: #0f1117` background.
- **Color Selection**:
  - Unvisited links (`a`): Styled with `--accent` (`#38bdf8`, light sky blue), yielding a contrast ratio of >8.6:1 against `#0f1117` (exceeding WCAG AAA).
  - Visited links (`a:visited`): Styled with `--purple` (`#c084fc`, light lavender purple matching `.badge-purple`), yielding a contrast ratio of ~7.0:1 (exceeding WCAG AA).
  - Hover state (`a:hover`): Uses `--accent-hover` (`#0ea5e9`).
  - Added subtle underline offset (`text-underline-offset: 3px`) for clear text legibility.
- **Component Isolation**: Added `:visited` selectors to interactive components (`.repo-link`, `.badge-*`, `.btn-primary`, `.btn-secondary`) so that visiting repository, documentation, or marketplace links does not bleed the visited purple color onto button backgrounds and badge borders.
- **Showcase Content Link**: Updated line 521 in `docs/index.html` to point to `https://github.com/greenermoose/tamlinux` with `rel="noopener noreferrer"`.
