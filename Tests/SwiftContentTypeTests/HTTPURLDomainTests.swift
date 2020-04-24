
import Foundation
import XCTest
import SwiftContentType

class HTTPURLDomainTests: XCTestCase {
	func testHTTPURLResponseWithContentType() {
		let url = URL(string: "http://SOMEURL.com")!
		let header = ["Content-Type":"application/json"]
		let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: header)
		XCTAssertNotNil(response)
		XCTAssertEqual(response?.contentType, AnyContentType.applictaionJson)
	}
  func testURLRequest() {
    let url = URL(string: "http://SOMEURL.com")!
    var request = URLRequest(url: url)
    let contentType = AnyContentType(type: "someType", subType: "someSubtype", attritube: ["chrset":"UTF-8"])
    request.set(contentType)
    XCTAssertEqual(request.allHTTPHeaderFields?["Content-Type"], "someType/someSubtype; chrset=UTF-8")
  }
}
