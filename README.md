## EasyAnchor
EasyAnchor is a small extension that save time when anchoring view using **AutoLayout**.

## Usage
It's a small and one line of code, but it's annoy that we need to specify **translatesAutoresizingMaskIntoConstraints = false** every time to use **AutoLayout**.
With **EasyAnchor**, we resolve that annoying issue by using:
```swift 
button.layout { 
    view.addSubview($0)
    $0.setWidth(100)
    $0.setHeight(50)
    $0.left()
    $0.bottom(constraint: redView.bottomAnchor, 0)
}
```
or with chaining:
```swift 
button.layout { 
    view.addSubview($0)
    $0.top().left().right().bottom()
}
```
or fill superview:
```swift 
button.layout { 
    view.addSubview($0)
    $0.fill()
}
```
or fill superview with insets:
```swift 
button.layout { 
    view.addSubview($0)
    $0.fill(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
}
```
or center superview:
```swift 
button.layout { 
    view.addSubview($0)
    $0.center()
}
```
 or center vertically:
 ```swift 
button.layout { 
    view.addSubview($0)
    $0.centerY()
}
   
// With some padding
button.layout { 
    view.addSubview($0)
    $0.centerY(50)
}
   
// With some padding from specific constraint
button.layout { 
    view.addSubview($0)
    $0.centerY(constraint: redView.centerYAnchor, 10)
}
```
or center horizontally:
```swift 
button.layout { 
    view.addSubview($0)
    $0.centerX()
}
   
// With some padding
button.layout { 
    view.addSubview($0)
    $0.centerX(50)
}
   
// With some padding from specific constraint
button.layout { 
    view.addSubview($0)
    $0.centerX(constraint: redView.centerXAnchor, 10)
}
```

## Closure based building block
A class based building block, enable the shorthand syntax just after the object is initialized.
It's common that we create some view and configure it with default closure like this:
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
let okButton = UIButton().decorate { 
    $0.backgroundColor = .blue
    $0.setTitleColor(.white, for: .normal) 
    $0.setTitle("OK", for: .normal)
    $0.layer.cornerRadius = 8
}
```

## AutoLayout
To enable or disable AutoLayout for specific view:
```swift 
button.useAutoLayout = true // enable
button.useAutoLayout = false // disable
```

## Installation
Copy `EasyAnchor.swift` and `Config.swift` to your project, or
### Swift Package Manager
From Xcode menu bar:

 1. File
 2. Swift Packages
 3. Add Package Dependency...
 4. Paste the repo url `https://github.com/PhanithNY/EasyAnchor.git`
