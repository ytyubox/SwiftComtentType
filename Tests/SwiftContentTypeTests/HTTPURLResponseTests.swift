//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation
import XCTest
import SwiftContentType

class HTTPURLResponseTests: XCTestCase {
	func testHTTPURLResponseWithContentType() {
		let url = URL(string: "http://SOMEURL.com")!
		let header = ["Content-Type":"application/json"]
		let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: header)
		XCTAssertNotNil(response)
		XCTAssertEqual(response?.contentType, ContentType.json)
	}
}
