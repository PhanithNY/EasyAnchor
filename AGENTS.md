# Repository Guidelines

## Project Structure & Module Organization
- `Sources/EasyAnchor/` holds the library code (`EasyAnchor.swift`, `Config.swift`).
- `Tests/EasyAnchorTests/` contains the XCTest suite.
- `Package.swift` defines the Swift Package Manager (SPM) module and targets.
- `EasyAnchor.podspec` supports CocoaPods distribution.

## Build, Test, and Development Commands
- `swift build` — build the EasyAnchor library with SPM.
- `swift test` — run the XCTest suite in `Tests/`.
- `swift package describe` — inspect the package manifest and targets.

## Coding Style & Naming Conventions
- Swift, UIKit-first API. Indentation is 2 spaces in existing files; keep it consistent.
- Methods use lowerCamelCase (e.g., `centerX`, `useAutoLayout`).
- Prefer fluent, chainable helpers returning `Self` and mark result-ignoring APIs with `@discardableResult`.
- Use `config { ... }` for closure-based setup; treat `decorate { ... }` as legacy.
- Keep extension-based APIs in `Sources/EasyAnchor/EasyAnchor.swift` and configuration in `Sources/EasyAnchor/Config.swift`.
- The layout helpers unwrap `superview`, so ensure the view is added to a superview before applying constraints.
- For trailing and bottom, the helpers invert the constant for readability.
- Utility helpers like `removeSubviews()` and `squircle(...)` live in `Sources/EasyAnchor/EasyAnchor.swift`.

## Testing Guidelines
- Tests use XCTest (see `Tests/EasyAnchorTests/EasyAnchorTests.swift`).
- Name test methods with `test...` to follow XCTest discovery conventions.
- The current test target is empty; add coverage when changing behavior.
- Run the full suite with `swift test` before opening a PR.

## Commit & Pull Request Guidelines
- Commit messages in history are short, imperative, and sentence-cased (e.g., "Update README.md", "Added config method"). Follow this pattern; no prefixing required.
- PRs should include a short description of the change, the motivation, and any API impact.
- If behavior changes, add or update tests in `Tests/EasyAnchorTests/` and mention how to verify.

## Security & Configuration Notes
- This is a lightweight layout helper; no external services or secrets are expected.
- When adding new APIs, keep defaults safe and document edge cases in `README.md`.
