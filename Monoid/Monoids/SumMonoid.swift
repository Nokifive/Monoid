//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Sum<T: NumberType> {
  public let value: T
  public init(_ v: T) { value = v }
}

extension Sum: Monoid {
  public static var mempty: Sum {
    return Sum(T.zero)
  }
  
  public static func mappend(a: Sum, _ b: Sum) -> Sum {
    return Sum(a.value + b.value)
  }
}

extension Sum: Equatable, Comparable, Orderable {}

public func == <N: NumberType>(rhs: Sum<N>, lhs: Sum<N>) -> Bool {
  return rhs.value == lhs.value
}

public func < <N: NumberType>(rhs: Sum<N>, lhs: Sum<N>) -> Bool {
  return rhs.value < lhs.value
}