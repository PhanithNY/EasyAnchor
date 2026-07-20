import XCTest
@testable import EasyAnchor

#if canImport(UIKit)
import UIKit
private typealias PlatformView = UIView
#elseif canImport(AppKit)
import AppKit
private typealias PlatformView = NSView
#endif

final class EasyAnchorTests: XCTestCase {
  func testBottomAndTrailingConstantsInvert() {
    let container = PlatformView()
    let view = PlatformView()
    container.addSubview(view)

    _ = view.bottom(10).trailing(8)

    let bottom = container.constraints.first { constraint in
      constraint.firstItem === view && constraint.firstAttribute == .bottom
    }
    let trailing = container.constraints.first { constraint in
      constraint.firstItem === view && constraint.firstAttribute == .trailing
    }

    XCTAssertEqual(bottom?.constant, -10)
    XCTAssertEqual(trailing?.constant, -8)
  }

  func testTopRelationUsesLessThanOrEqual() {
    let container = PlatformView()
    let view = PlatformView()
    container.addSubview(view)

    _ = view.top(constraint: container.topAnchor, 12, priority: .lessThanOrEqual)

    let top = container.constraints.first { constraint in
      constraint.firstItem === view && constraint.firstAttribute == .top
    }

    XCTAssertEqual(top?.relation, .lessThanOrEqual)
    XCTAssertEqual(top?.constant, 12)
  }

  func testLayoutAndFillUsePlatformNativeTypes() {
    let container = PlatformView()
    let view = PlatformView()

    view.layout {
      container.addSubview($0)
      $0.fill(insets: EasyAnchorEdgeInsets(top: 1, left: 2, bottom: 3, right: 4))
    }

    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    XCTAssertEqual(container.constraints.count, 4)
    XCTAssertTrue(container.constraints.contains { $0.firstAttribute == .top && $0.constant == 1 })
    XCTAssertTrue(container.constraints.contains { $0.firstAttribute == .left && $0.constant == 2 })
    XCTAssertTrue(container.constraints.contains { $0.firstAttribute == .bottom && $0.constant == -3 })
    XCTAssertTrue(container.constraints.contains { $0.firstAttribute == .right && $0.constant == -4 })
  }

  func testSquircleConfiguresBackingLayer() {
    let view = PlatformView()

    view.squircle(12)

#if canImport(UIKit)
    XCTAssertEqual(view.layer.cornerRadius, 12)
    XCTAssertTrue(view.layer.masksToBounds)
#elseif canImport(AppKit)
    XCTAssertTrue(view.wantsLayer)
    XCTAssertEqual(view.layer?.cornerRadius, 12)
    XCTAssertEqual(view.layer?.masksToBounds, true)
#endif
  }
}
