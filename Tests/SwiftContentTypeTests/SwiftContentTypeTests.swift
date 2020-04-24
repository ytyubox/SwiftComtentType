import XCTest
import SwiftContentType

final class SwiftContentTypeTests: XCTestCase {
	func testContentType() {
    XCTAssertEqual(AnyContentType.headerFaild, "Content-Type")
		XCTAssertEqual(AnyContentType.applictaionJson.text, "application/json")
		XCTAssertEqual(AnyContentType.applictaionUrlEncode.text, "application/x-www-form-urlencoded")
		XCTAssertEqual(AnyContentType.plainText.text, "text/plain")
	}
	func testAttritubeContentType() {
		XCTAssertEqual(AnyContentType.applictaionJson("utf-8").text, "application/json; charset=UTF-8")
	}
	static var allTests = [
		("testContentType", testContentType),
		("testAttritubeContentType",testAttritubeContentType)
	]
}
