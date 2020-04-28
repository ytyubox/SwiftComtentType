import Foundation
import URLEncodedForm
import SwiftContentType


final
public class DecoderConfiguration: SigntonWithDefault {
  public init(
    with registed: [AnyContentType : MIMEDecoder] = [:]) {
    self.registedDecoder = registed
  }
  public static var global: DecoderConfiguration = DecoderConfiguration.default()
  public static func `default`() -> DecoderConfiguration {
    DecoderConfiguration(
      with: [
        .applictaionJson:JSONDecoder(),
        .applictaionUrlEncode: URLEncodedFormDecoder(),
        .plainText:PlainTextDecoder(),
      ]
    )
    
  }
  public internal(set)
  var registedDecoder:[AnyContentType:MIMEDecoder] = [:]
  public func register(
    contentType: AnyContentType,
    coder:MIMEDecoder) {
    registedDecoder[contentType] = coder
  }
  public func set(_ coder: MIMEDecoder, for type: AnyContentType) {
    self.registedDecoder[type] = coder
  }
}

final
public class EncoderConfiguration:SigntonWithDefault {
  public static var global: EncoderConfiguration = .default()
  
  internal init(
    with registed: [AnyContentType : MIMEEncoder] = [:]) {
    self.registedEncoder = registed
  }
  
  public static func `default`() -> EncoderConfiguration {
    EncoderConfiguration(with: [
      .applictaionJson:JSONEncoder(),
      .applictaionUrlEncode: URLEncodedFormEncoder(),
      .plainText:PlainTextEncoder(),
    ])
  }
  internal var registedEncoder:[AnyContentType:MIMEEncoder]
  public func register(
    contentType: AnyContentType,
    coder:MIMEEncoder) {
    registedEncoder[contentType] = coder
  }
  public func set(_ coder: MIMEEncoder, for type: AnyContentType) {
    self.registedEncoder[type] = coder
  }
}
