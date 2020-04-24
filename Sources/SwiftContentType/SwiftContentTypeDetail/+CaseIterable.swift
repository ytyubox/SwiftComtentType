//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

extension AnyContentType:CaseIterable {
  public static var allCases: [AnyContentType] {
    [
      .json,
      .plainText,
      .urlEncode,
    ]
  }
}
