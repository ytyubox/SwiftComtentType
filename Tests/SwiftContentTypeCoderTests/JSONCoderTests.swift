import XCTest
import SwiftContentTypeCoder

class JSONCoderTests: XCTestCase{
  private struct JSON:Codable {let a:String}
  func testDecodingJSON() {
    let json = #"{"a":"A"}"#.data(using: .utf8)!
    let contentType = AnyContentType.applictaionJson
    var decoded:JSON?
    XCTAssertNoThrow(
      decoded = try contentType.decoder.decode(JSON.self, from: json)
    )
    XCTAssertEqual(decoded?.a, "A")
  }
  func testEncodingJSON() {
    let json = JSON(a: "A")
    let contentType = AnyContentType.applictaionJson
    var encoded:Data?
    XCTAssertNoThrow(
      encoded = try contentType.encoder.encode(json)
    )
    XCTAssertNotNil(encoded)
    let jsonUTF8 = String(data: encoded!, encoding: .utf8)
    XCTAssertNotNil(jsonUTF8)
    XCTAssertEqual(jsonUTF8, #"{"a":"A"}"#)
  }
  
}

