//
//  File 2.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

extension ContentType {
  static func text(_ type: String) -> Self {
    ContentType(type: "text", subType: type)
  }
  
  static let plainText = text("plain")
}
