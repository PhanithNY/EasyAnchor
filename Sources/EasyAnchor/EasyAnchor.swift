import UIKit

public extension UIView {
  
  var useAutoLayout: Bool {
    get {
      return !translatesAutoresizingMaskIntoConstraints
    }
    set {
      translatesAutoresizingMaskIntoConstraints = !newValue
    }
  }
  
  final func layout(using closure: ((UIView) -> Void)) {
    translatesAutoresizingMaskIntoConstraints = false
    closure(self)
  }
  
  final func removeSubviews() {
    subviews.forEach { $0.removeFromSuperview() }
  }
  
  @discardableResult
  final func setHeight(_ constant: CGFloat) -> Self {
    heightAnchor.constraint(equalToConstant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func setHeight(dimension: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
    heightAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
    return self
  }
  
  @discardableResult
  final func height(_ constant: CGFloat) -> Self {
    heightAnchor.constraint(equalToConstant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func height(dimension: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
    heightAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
    return self
  }
  
  @discardableResult
  final func setWidth(_ constant: CGFloat) -> Self {
    widthAnchor.constraint(equalToConstant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func setWidth(dimension: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
    widthAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
    return self
  }
  
  @discardableResult
  final func width(_ constant: CGFloat) -> Self {
    widthAnchor.constraint(equalToConstant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func width(dimension: NSLayoutDimension, multiplier: CGFloat = 1) -> Self {
    widthAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
    return self
  }
  
  @discardableResult
  final func top(constraint: NSLayoutYAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    topAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.topAnchor : constraint.unsafelyUnwrapped, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func left(constraint: NSLayoutXAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    leftAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.leftAnchor : constraint.unsafelyUnwrapped, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func leading(constraint: NSLayoutXAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    leadingAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.leadingAnchor : constraint.unsafelyUnwrapped, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func bottom(constraint: NSLayoutYAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    bottomAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.bottomAnchor : constraint.unsafelyUnwrapped, constant: -constant).isActive = true
    return self
  }
  
  @discardableResult
  final func right(constraint: NSLayoutXAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    rightAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.rightAnchor : constraint.unsafelyUnwrapped, constant: -constant).isActive = true
    return self
  }
  
  @discardableResult
  final func trailing(constraint: NSLayoutXAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    trailingAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.trailingAnchor : constraint.unsafelyUnwrapped, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func fill(insets: UIEdgeInsets = .zero) -> Self {
    topAnchor.constraint(equalTo: superview.unsafelyUnwrapped.topAnchor, constant: insets.top).isActive = true
    leftAnchor.constraint(equalTo: superview.unsafelyUnwrapped.leftAnchor, constant: insets.left).isActive = true
    bottomAnchor.constraint(equalTo: superview.unsafelyUnwrapped.bottomAnchor, constant: -insets.bottom).isActive = true
    rightAnchor.constraint(equalTo: superview.unsafelyUnwrapped.rightAnchor, constant: -insets.right).isActive = true
    return self
  }
  
  @discardableResult
  final func centerX(constraint: NSLayoutXAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    centerXAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.centerXAnchor : constraint.unsafelyUnwrapped, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func centerY(constraint: NSLayoutYAxisAnchor? = nil, _ constant: CGFloat = 0) -> Self {
    centerYAnchor.constraint(equalTo: constraint == nil ? superview.unsafelyUnwrapped.centerYAnchor : constraint.unsafelyUnwrapped, constant: constant).isActive = true
    return self
  }
  
  @discardableResult
  final func center(in view: UIView? = nil) -> Self {
    centerXAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.centerXAnchor : view.unsafelyUnwrapped.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.centerYAnchor : view.unsafelyUnwrapped.centerYAnchor).isActive = true
    return self
  }
  
  @discardableResult
  final func topLeft(_ view: UIView? = nil, top: CGFloat = 0, left: CGFloat = 0) -> Self {
    topAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.topAnchor : view.unsafelyUnwrapped.topAnchor, constant: top).isActive = true
    leftAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.leftAnchor : view.unsafelyUnwrapped.leftAnchor, constant: left).isActive = true
    return self
  }
  
  @discardableResult
  final func bottomLeft(_ view: UIView? = nil, bottom: CGFloat = 0, left: CGFloat = 0) -> Self {
    bottomAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.bottomAnchor : view.unsafelyUnwrapped.bottomAnchor, constant: -bottom).isActive = true
    leftAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.leftAnchor : view.unsafelyUnwrapped.leftAnchor, constant: left).isActive = true
    return self
  }
  
  @discardableResult
  final func topRight(_ view: UIView? = nil, top: CGFloat = 0, right: CGFloat = 0) -> Self {
    topAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.topAnchor : view.unsafelyUnwrapped.topAnchor, constant: top).isActive = true
    rightAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.rightAnchor : view.unsafelyUnwrapped.rightAnchor, constant: -right).isActive = true
    return self
  }
  
  @discardableResult
  final func bottomRight(_ view: UIView? = nil, bottom: CGFloat = 0, right: CGFloat = 0) -> Self {
    bottomAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.bottomAnchor : view.unsafelyUnwrapped.bottomAnchor, constant: -bottom).isActive = true
    rightAnchor.constraint(equalTo: view == nil ? superview.unsafelyUnwrapped.rightAnchor : view.unsafelyUnwrapped.rightAnchor, constant: -right).isActive = true
    return self
  }
}
