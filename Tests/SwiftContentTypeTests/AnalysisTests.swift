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
  func testAnalysisSingle() {
    do {
      let contentTypeValue = "text/plain; charset=UTF-8"
      let result = AnyContentType(by: contentTypeValue)
      XCTAssertEqual(result?.type,
                     "text")
      XCTAssertEqual(result?.subType,
                     "plain")
      XCTAssertEqual(
        "UTF-8",
        result?.attribute["charset"]?.description
      )
      
    }
  }
  func testAnalysisMutiple() {
    do {
      let contentTypeValue = #"""
message/external-body; access-type=URL;URL*0="ftp://"; URL*1="cs.utk.edu/pub/moore/bulk-mailer/bulk-mailer.tar"
"""#
      let result = AnyContentType(by: contentTypeValue)
      XCTAssertEqual(result?.type,
                     "message")
      XCTAssertEqual(result?.subType,
                     "external-body")
      XCTAssertEqual(result?.attribute["access-type"]?.description,
                     "URL")
      XCTAssertEqual(result?.attribute["URL*0"]?.description,
                     #""ftp://""#)
      XCTAssertEqual(result?.attribute["URL*1"]?.description,
                     #""cs.utk.edu/pub/moore/bulk-mailer/bulk-mailer.tar""#)
    }
  }
}
