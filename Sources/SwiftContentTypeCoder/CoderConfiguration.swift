import Foundation
import URLEncodedForm
import SwiftContentType


public protocol DefaultMaker {
  static func `default`() -> Self
}
public protocol SigntonObject: AnyObject {
  static var global: Self {get set}
}

public struct AnyError: Error {
  public init(_ message: String) {
    self.message = message
  }
  
  let message: String
}

public typealias SigntonWithDefault = SigntonObject & DefaultMaker

final
public class DecoderConfiguration: SigntonWithDefault {
  public init(with registDecoder: [AnyContentType : DataDecoder] = [:]) {
    self.registedDecoder = registDecoder
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
  public fileprivate(set)
  var registedDecoder:[AnyContentType:DataDecoder] = [:]
  public func register(contentType: AnyContentType, coder:DataDecoder) {
    registedDecoder[contentType] = coder
  }
}

final
public class EncoderConfiguration:SigntonWithDefault {
  public static var global: EncoderConfiguration = .default()
  
  internal init(with registedEncoder: [AnyContentType : DataEncoder] = [:]) {
    self.registedEncoder = registedEncoder
  }
  
  public static func `default`() -> EncoderConfiguration {
    EncoderConfiguration(with: [
      .applictaionJson:JSONEncoder(),
      .applictaionUrlEncode: URLEncodedFormEncoder(),
      .plainText:PlainTextEncoder(),
    ])
  }
  fileprivate var registedEncoder:[AnyContentType:DataEncoder]
  public func register(contentType: AnyContentType, coder:DataEncoder) {
    registedEncoder[contentType] = coder
  }
}

extension AnyContentType: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(text)
  }
}


public
extension AnyContentType {
  var encoder:DataEncoder {
    guard
      let encoder = EncoderConfiguration.global.registedEncoder[self]
      else {
        fatalError("trying to get Encoder of \(text), but global EncoderConfiguation didn't have relative Encoder")
    }
    return encoder
  }
  func encoder(from config: EncoderConfiguration) throws -> DataEncoder {
    guard
      let encoder = config.registedEncoder[self]
      else {
         throw AnyError("trying to get Encoder of \(text), but the giving EncoderConfiguation didn't have relative Encoder")
    }
    return encoder
  }
  
  var decoder: DataDecoder {
    guard
      let decoder = DecoderConfiguration.global.registedDecoder[self]
      else {
        fatalError("trying to get Decoder of \(text), but global DecoderConfiguation didn't have relative Decoder")
    }
    return decoder
  }
  
  func decoder(from config: DecoderConfiguration) throws -> DataDecoder {
     guard
       let decoder = config.registedDecoder[self]
       else {
         throw AnyError("trying to get Decoder of \(text), but the giving DecoderConfiguation didn't have relative Decoder")
     }
     return decoder
   }
}
