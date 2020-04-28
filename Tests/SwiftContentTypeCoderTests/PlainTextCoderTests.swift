import XCTest
import SwiftContentTypeCoder

class PlainTextCoderTests: XCTestCase {
  struct TEXT:CustomStringConvertible,ConstructByStringLiteral,Codable {
    init(_ string: String) {
      self.value = string
    }
    var description: String {value}
    
    let value:String
  }
  func testDecodingPlainText() {
    let text = "some thing".data(using: .utf8)!
    let contentType = AnyContentType.plainText
    let decoded:TEXT? =  try? contentType.decoder
      .decode(
        TEXT.self,
        from: text)
    XCTAssertNotNil(decoded)
    XCTAssertEqual(decoded?.value, "some thing")
  }
  func testEncodingPlainText() {
    
  }
}
