# 1.1.0 (01-03-2026)

### Fixed

- **index.html path concatenation** — Paths like `/blog` (without trailing slash) now correctly resolve to `blog/index.html` instead of `blogindex.html`
- **Port argument parsing** — Fixed logic that incorrectly used the last argument when multiple were passed; now correctly uses the first positional argument
- **Server startup in tests** — Replaced `at_exit` with `ENV["ENV"] == "test"` check so the server does not start when running specs

### Added

- **E2E tests** — Full end-to-end tests for static file serving, index redirects, and 404 handling
- **GitHub Actions CI** — Replaced Travis CI with GitHub Actions workflow (build, test, format check)
- **CHANGELOG** — This file
