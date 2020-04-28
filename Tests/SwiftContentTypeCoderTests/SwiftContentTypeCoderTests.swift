import XCTest
import SwiftContentTypeCoder



/**
 
**test function sample**
 
 
 ```swift
 import XCTest
 import SwiftContentTypeCoder

 class <#MIMEType#>CoderTests: XCTestCase {

   func testDecoding<#MIMEType#>() {
 
   }
   func testEncoding<#MIMEType#>() {
 
   }
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
