//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

extension ContentType: Equatable {
  public static func == (lhs: ContentType, rhs: ContentType) -> Bool {
    lhs.type == rhs.type && lhs.subType == rhs.subType
  }
  
}
