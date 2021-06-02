//
//  Unwrapped.swift
//  Common
//
//  Created by THAMMANOON WETHANYAPORN on 31/5/2564 BE.
//

import Foundation

public func unwrapped<T: OptionalType, U>(_ wrapped: T, with castValue: U) -> T.WrappedType where T.WrappedType == U {
  if let unwrapped = wrapped.value {
    return unwrapped
  } else {
    return castValue
  }
}

public protocol OptionalType: ExpressibleByNilLiteral {
  associatedtype WrappedType
  var value: WrappedType? { get }
}

extension Optional: OptionalType {
  public var value: Wrapped? { return self }
}
