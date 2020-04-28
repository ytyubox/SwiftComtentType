import Foundation

@_exported import SwiftcontentTypeCore
@_exported import SwiftContentType



public protocol DefaultMaker {
  static func `default`() -> Self
}
public protocol SigntonObject: AnyObject {
  static var global: Self {get set}
}
public typealias SigntonWithDefault = SigntonObject & DefaultMaker

public struct AnyError: Error {
  public init(_ message: String) {
    self.message = message
  }
  
  let message: String
}

