import Foundation
import SwiftcontentTypeCore
import SwiftContentType
public
protocol  ConstructByStringLiteral {
  init(_ string: String)
}

extension String:ConstructByStringLiteral {
  
}

public
class PlainTextDecoder: MIMEDecoder {
  public init(encoding: String.Encoding = .utf8) {
    self.encoding = encoding
  }
  
  public let encoding: String.Encoding
  
  public func decode<T>(_ type: T.Type, from: Data) throws -> T where T : Decodable {
    assert(type is ConstructByStringLiteral.Type, "if you are using custom type, please make the type a ConstructByStringLiteral, otherwise fire an issue on GitHub: https://github.com/ytyubox/SwiftContentType")
    let TYPE = type as! ConstructByStringLiteral
    String(data: from, encoding: self.encoding)
  }
}

public
class PlainTextEncoder: MIMEEncoder {
  public func encode<T>(_ value: T) throws -> Data where T : Encodable {
    assert(T.self is CustomStringConvertible)
    let s = value as! CustomStringConvertible
    return s.description.data(using: self.encoding) ?? Data()
  }
  
  public init(encoding: String.Encoding = .utf8) {
    self.encoding = encoding
  }
  
  public let encoding: String.Encoding
  
  
}
