# EasyAnchor
EasyAnchor is a tiny `UIView` extension that reduces Auto Layout boilerplate with fluent, chainable helpers.

## Usage
Auto Layout requires `translatesAutoresizingMaskIntoConstraints = false` on each view. `layout { ... }` handles that for you.
Make sure the view is inside a superview before applying constraints (the helpers unwrap `superview`).
```swift
button.layout {
  view.addSubview($0)
  $0.width(100)
    .height(50)
    .leading()
    .bottom(constraint: redView.bottomAnchor, 0)
}
```

or with size:
```swift
button.layout {
  view.addSubview($0)
  $0.size(equalTo: 50)
    .leading()
    .bottom(constraint: redView.bottomAnchor, 0)
}
```

For trailing and bottom, the helpers invert the constant for readability:
```swift
button.layout {
  view.addSubview($0)
  $0.trailing(16) // Offset 16 from trailing.
    .bottom(16)   // Offset 16 from bottom.
}
```

More helpers:
```swift
button.layout {
  view.addSubview($0)
  $0.top().leading().trailing().bottom()
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.fill()
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.fill(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.center()
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.centerY()
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.centerY(50)
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.centerY(constraint: redView.centerYAnchor, 10)
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.centerX()
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.centerX(50)
}
```
```swift
button.layout {
  view.addSubview($0)
  $0.centerX(constraint: redView.centerXAnchor, 10)
}
```

## Priorities and Relative Constraints
Some helpers accept priorities or constraint types:
```swift
button.layout {
  view.addSubview($0)
  $0.width(200, priority: .defaultHigh)
    .height(.lessThanOrEqual, 44)
    .top(priority: .greaterThanOrEqual)
}
```

## Closure Based Building Block
A class based building block enables shorthand setup right after initialization.
It's common to create a view and configure it with a closure like this:
```swift
let okButton: UIButton = {
  let button = UIButton()
  button.backgroundColor = UIColor.blue
  button.setTitleColor(UIColor.white, for: .normal)
  button.setTitle("OK", for: .normal)
  button.layer.cornerRadius = 8
  return button
}()
```
Here is shorthand syntax for above code.
```swift
let okButton = UIButton().config {
  $0.backgroundColor = .blue
  $0.setTitleColor(.white, for: .normal)
  $0.setTitle("OK", for: .normal)
  $0.layer.cornerRadius = 8
}
```
`decorate { ... }` is available for legacy code, but prefer `config { ... }`.

## AutoLayout
Enable or disable Auto Layout on a specific view:
```swift
button.useAutoLayout = true // enable
button.useAutoLayout = false // disable
```

## Utilities
```swift
view.removeSubviews()
```
```swift
avatarView.squircle(12)
```

## Installation
Copy `EasyAnchor.swift` and `Config.swift` to your project, or

### Cocoapods
`pod 'EasyAnchor', :git => 'https://github.com/PhanithNY/EasyAnchor.git'`

### Swift Package Manager
From Xcode menu bar:

1. File
2. Swift Packages
3. Add Package Dependency...
4. Paste the repo url `https://github.com/PhanithNY/EasyAnchor.git`


## Author

PhanithNY, phanith.ny@icloud.com

## License

EasyAnchor is available under the MIT license. See the LICENSE file for more info.
