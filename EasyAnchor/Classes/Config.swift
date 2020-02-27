//
//  Config.swift
//  
//
//  Created by PhanithNY on 1/10/20.
//

import UIKit

public protocol Config { }
extension NSObject: Config { }

extension Config where Self: NSObject {
  /// Makes it available to set properties with closures just after initializing.
  ///
  ///     let label = UILabel().decorate {
  ///       $0.textAlignment = .Center
  ///       $0.textColor = .black
  ///       $0.text = "Hi There!"
  ///     }
  public func decorate(_ closure: (Self) -> Void) -> Self {
    closure(self)
    return self
  }
}

prefix operator ..
infix operator ..: MultiplicationPrecedence
public func .. <T>(object: T, closure: (inout T) -> Void) -> T {
  var object = object
  closure(&object)
  return object
}
