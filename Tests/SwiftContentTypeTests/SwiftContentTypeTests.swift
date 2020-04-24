import XCTest
import SwiftContentType

final class SwiftContentTypeTests: XCTestCase {
	func testContentType() {
		XCTAssertEqual(AnyContentType.json.value, "application/json")
		XCTAssertEqual(AnyContentType.urlEncode.value, "application/x-www-form-urlencoded")
//		XCTAssertEqual(ContentType.formData.value, "multipart/formdata")
		XCTAssertEqual(AnyContentType.plainText.value, "text/plain")
	}
	func testAttritubeContentType() {
		XCTAssertEqual(AnyContentType.json("utf-8").value, "application/json ;charset=UTF-8")
	}
	static var allTests = [
		("testContentType", testContentType),
		("testAttritubeContentType",testAttritubeContentType)
	]
}
