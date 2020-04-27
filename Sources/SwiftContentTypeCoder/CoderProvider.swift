import Foundation
import URLEncodedForm
import SwiftContentType


public protocol DefaultMaker {
  static func `default`() -> Self
}
public protocol SigntonObject: AnyObject {
  static var global: Self {get}
}

public typealias SigntonWithDefault = SigntonObject & DefaultMaker

final
public class DecoderConfiguration: SigntonWithDefault {
  public init(with registDecoder: [AnyContentType : DataDecoder.Type] = [:]) {
    self.registedDecoder = registDecoder
  }
  public static let global: DecoderConfiguration = DecoderConfiguration.default()
  public static func `default`() -> DecoderConfiguration {
    DecoderConfiguration(
      with: [
        .applictaionJson:JSONDecoder.self,
        .applictaionUrlEncode: URLEncodedFormDecoder.self,
        .plainText:PlainTextDecoder.self,
      ]
    )
    
  }
  public fileprivate(set)
  var registedDecoder:[AnyContentType:DataDecoder.Type] = [:]
  public func register(contentType: AnyContentType, coder:DataDecoder.Type) {
    registedDecoder[contentType] = coder
  }
}

final
public class EncoderConfiguration:SigntonWithDefault {
  public static let global: EncoderConfiguration = .default()
  
  internal init(with registedEncoder: [AnyContentType : DataEncoder.Type] = [:]) {
    self.registedEncoder = registedEncoder
  }
  
  public static func `default`() -> EncoderConfiguration {
    EncoderConfiguration(with: [
      .applictaionJson:JSONEncoder.self,
      .applictaionUrlEncode: URLEncodedFormEncoder.self,
      .plainText:PlainTextEncoder.self,
    ])
  }
  fileprivate var registedEncoder:[AnyContentType:DataEncoder.Type]
  public func register(contentType: AnyContentType, coder:DataEncoder.Type) {
    registedEncoder[contentType] = coder
  }
}

extension AnyContentType: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(text)
  }
}
