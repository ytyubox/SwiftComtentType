import XCTest
import SwiftContentTypeCoder



/**
 ```swift
 func testDecoding<#MIMEType#>() {
 
 }
 func testEncoding<#MIMEType#>() {
 
 }
 ```
 */

final class SwiftContentTypeCoderTests: XCTestCase {
  func testDefaultIsUnique() {
    let default1 = DecoderConfiguration.default()
    let default2 = DecoderConfiguration.default()
    XCTAssertFalse(default1 === default2)
  }
}
