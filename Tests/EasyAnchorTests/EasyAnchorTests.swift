import XCTest
@testable import EasyAnchor

final class EasyAnchorTests: XCTestCase {
  func testBottomAndTrailingConstantsInvert() {
    let container = UIView()
    let view = UIView()
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
    let container = UIView()
    let view = UIView()
    container.addSubview(view)

    _ = view.top(constraint: container.topAnchor, 12, priority: .lessThanOrEqual)

    let top = container.constraints.first { constraint in
      constraint.firstItem === view && constraint.firstAttribute == .top
    }

    XCTAssertEqual(top?.relation, .lessThanOrEqual)
    XCTAssertEqual(top?.constant, 12)
  }

  func testNoSuperviewDoesNotCrash() {
    let view = UIView()

    _ = view.top(4).left(4).bottom(4).right(4)

    XCTAssertTrue(view.constraints.isEmpty)
  }
}
