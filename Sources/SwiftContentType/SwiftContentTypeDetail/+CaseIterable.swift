//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

extension ContentType:CaseIterable {
  public static var allCases: [ContentType] {
    [
      .json,
      .plainText,
      .urlEncode,
    ]
  }
  init?(by value: String) {
    for type in ContentType.allCases {
      if type.value == value {
        self = type
        return
      }
    }
    return nil
  }
  init?(by value:String?) {
    guard let value = value else {return nil}
    self.init(by: value)
  }
}
