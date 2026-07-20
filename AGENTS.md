# Repository Guidelines

## Project Structure & Module Organization
- `Sources/EasyAnchor/` holds the library code (`EasyAnchor.swift`, `Config.swift`).
- `Tests/EasyAnchorTests/` contains the XCTest suite.
- `Package.swift` defines the Swift Package Manager (SPM) module and targets.
- `EasyAnchor.podspec` supports CocoaPods distribution.

## Build, Test, and Development Commands
- `swift test` — build the AppKit variant and run the XCTest suite on macOS.
- `xcodebuild -scheme EasyAnchor -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build` — build the UIKit variant for iOS Simulator.
- `xcodebuild -scheme EasyAnchor -showdestinations` — list available test destinations before running simulator tests.
- `xcodebuild -scheme EasyAnchor -destination 'platform=iOS Simulator,name=<installed simulator name>' test` — run the XCTest suite on an installed iOS Simulator; replace the placeholder with a destination from `-showdestinations`.
- `swift package describe` — inspect the package manifest and targets.
- `pod lib lint EasyAnchor.podspec --allow-warnings` — validate CocoaPods integration for both iOS and macOS after changing source or pod metadata.

## Coding Style & Naming Conventions
- Swift, UIKit/AppKit API with matching fluent behavior on both platforms. Indentation is 2 spaces in existing files; keep it consistent.
- Methods use lowerCamelCase (e.g., `centerX`, `useAutoLayout`).
- Prefer fluent, chainable helpers returning `Self` and mark result-ignoring APIs with `@discardableResult`.
- Use `config { ... }` for closure-based setup; treat `decorate { ... }` as legacy.
- Keep extension-based APIs in `Sources/EasyAnchor/EasyAnchor.swift` and configuration in `Sources/EasyAnchor/Config.swift`.
- Preserve the compile-time mappings between `UIView`/`NSView`, `UIEdgeInsets`/`NSEdgeInsets`, and UIKit/AppKit constraint priorities.
- Use `Foundation` rather than a platform UI framework in shared configuration code when UIKit or AppKit types are not required.
- The layout helpers unwrap `superview`, so ensure the view is added to a superview before applying constraints.
- For trailing and bottom, the helpers invert the constant for readability.
- Utility helpers like `removeSubviews()` and `squircle(...)` live in `Sources/EasyAnchor/EasyAnchor.swift`; AppKit layer helpers must enable a backing layer when needed.

## README Sample API Patterns
- Prefer README-style examples that call `layout { ... }`, add the view to its superview inside the closure, then chain constraints:
  ```swift
  button.layout {
    view.addSubview($0)
    $0.width(100)
      .height(50)
      .leading()
      .bottom(constraint: redView.bottomAnchor)
  }
  ```
- Use `size(equalTo:)` for square dimensions and `fill()` or `fill(insets:)` for pinning all edges:
  ```swift
  button.layout {
    view.addSubview($0)
    $0.size(equalTo: 50)
      .leading()
      .bottom(constraint: redView.bottomAnchor)
  }
  ```
  ```swift
  button.layout {
    view.addSubview($0)
    $0.fill(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
  }
  ```
- For equivalent macOS examples, use native AppKit types without changing the fluent calls:
  ```swift
  button.layout {
    view.addSubview($0)
    $0.fill(insets: NSEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
  }
  ```
- Keep trailing and bottom examples readable with positive constants; the helpers apply negative constraint constants internally:
  ```swift
  button.layout {
    view.addSubview($0)
    $0.trailing(16)
      .bottom(16)
  }
  ```
- Centering helpers should mirror README usage: `center()`, `centerX()`, `centerY()`, and anchor-specific overloads like `centerX(constraint: redView.centerXAnchor, 10)`.
- Omit the constant argument when it is `0`; prefer defaults like `bottom(constraint: redView.bottomAnchor)` over `bottom(constraint: redView.bottomAnchor, 0)`.
- For priority and relative constraints, use existing overloads such as:
  ```swift
  button.layout {
    view.addSubview($0)
    $0.width(200, priority: .defaultHigh)
      .height(.lessThanOrEqual, 44)
      .top(priority: .greaterThanOrEqual)
  }
  ```
- For closure-based property setup, prefer `config { ... }`:
  ```swift
  let okButton = UIButton().config {
    $0.backgroundColor = .blue
    $0.setTitleColor(.white, for: .normal)
    $0.setTitle("OK", for: .normal)
    $0.layer.cornerRadius = 8
  }
  ```
- README utility examples include `button.useAutoLayout = true`, `view.removeSubviews()`, and `avatarView.squircle(12)`.

## Testing Guidelines
- Tests use XCTest (see `Tests/EasyAnchorTests/EasyAnchorTests.swift`).
- Name test methods with `test...` to follow XCTest discovery conventions.
- Add or update tests when changing behavior, using native `UIView` and `NSView` types selected with conditional compilation.
- Run the full suite with both `swift test` on macOS and the iOS Simulator `xcodebuild ... test` command before opening a PR.

## Commit & Pull Request Guidelines
- Commit messages in history are short, imperative, and sentence-cased (e.g., "Update README.md", "Added config method"). Follow this pattern; no prefixing required.
- PRs should include a short description of the change, the motivation, and any API impact.
- If behavior changes, add or update tests in `Tests/EasyAnchorTests/` and mention how to verify.

## Security & Configuration Notes
- This is a lightweight cross-platform layout helper; no external services or secrets are expected.
- When adding new APIs, keep defaults safe and document edge cases in `README.md`.
