//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import XCTest
import SwiftContentType
final
class
AnalysisTests: XCTestCase {
  func testAnalysis() {
    do {
      let contentTypeValue = "text/plain; charset=UTF-8"
      let result = AnyContentType(by: contentTypeValue)
      XCTAssertEqual(result?.type,
                          "text")
      XCTAssertEqual(result?.attritube["charset"]?.description,
                     "UTF-8")
      XCTAssertEqual(result?.subType, "plain")
      
    }
  }
}
