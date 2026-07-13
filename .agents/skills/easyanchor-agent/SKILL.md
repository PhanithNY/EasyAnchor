---
name: easyanchor-agent
description: Implement, review, test, debug, or document changes in the EasyAnchor Swift package. Use for work involving its UIKit layout helpers, configuration APIs, XCTest suite, Package.swift manifest, CocoaPods podspec, or README examples.
---

# EasyAnchor Agent

Follow the repository's applicable `AGENTS.md` instructions as the source of truth for detailed API, style, documentation, and verification rules.

## Workflow

1. Inspect the worktree and the relevant source, tests, and README examples before editing.
2. Preserve unrelated user changes and keep the implementation focused.
3. Add or update XCTest coverage for behavior changes.
4. Update `README.md` when a public API or documented behavior changes.
5. Build and test in proportion to the change, reporting any verification that could not run.

## Repository map

- Keep extension-based APIs in `Sources/EasyAnchor/EasyAnchor.swift`.
- Keep closure-based configuration in `Sources/EasyAnchor/Config.swift`.
- Keep XCTest coverage in `Tests/EasyAnchorTests/`.
- Treat `Package.swift` and `EasyAnchor.podspec` as the SPM and CocoaPods distribution definitions.

## API invariants

- Preserve the UIKit-first, fluent API and 2-space indentation.
- Return `Self` from chainable helpers and use `@discardableResult` where callers may ignore the result.
- Prefer `config { ... }`; treat `decorate { ... }` as legacy.
- Add a view to its superview before calling helpers that unwrap `superview`.
- Accept readable positive constants for trailing and bottom helpers; those helpers negate constants internally.
- Keep README examples consistent with `layout { ... }`, `size(equalTo:)`, `fill()`, centering overloads, and zero-value defaults.

## Verification

- Inspect targets with `swift package describe` when manifest context is needed.
- Build with:
  `xcodebuild -scheme EasyAnchor -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build`
- Discover installed test destinations with:
  `xcodebuild -scheme EasyAnchor -showdestinations`
- Run the full suite on an installed simulator with:
  `xcodebuild -scheme EasyAnchor -destination 'platform=iOS Simulator,name=<installed simulator name>' test`
