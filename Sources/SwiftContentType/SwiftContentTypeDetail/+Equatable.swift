//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

extension AnyContentType: Equatable {
  public static func == (lhs: AnyContentType, rhs: AnyContentType) -> Bool {
    lhs.type == rhs.type && lhs.subType == rhs.subType
  }
  
}
