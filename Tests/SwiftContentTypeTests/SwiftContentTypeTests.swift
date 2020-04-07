import XCTest
@testable import SwiftContentType

final class SwiftContentTypeTests: XCTestCase {
	func testContentType() {
		XCTAssertEqual(ContentType.json.value, "application/json")
		XCTAssertEqual(ContentType.urlEncode.value, "application/x-www-form-urlencoded")
		XCTAssertEqual(ContentType.formData.value, "multipart/formdata")
		XCTAssertEqual(ContentType.plainText.value, "text/plain")
	}
	func testAttritubeContentType() {
		XCTAssertEqual(ContentType.json("utf-8").value, "application/json ;charset=UTF-8")
	}
	static var allTests = [
		("testContentType", testContentType),
		("testAttritubeContentType",testAttritubeContentType)
	]
}
