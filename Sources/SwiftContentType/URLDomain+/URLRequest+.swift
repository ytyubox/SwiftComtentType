//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

extension URLRequest {
  public mutating func set(_ contentType:AnyContentType?) {
    guard let contentType = contentType else {return}
    addValue(contentType.text, forHTTPHeaderField: contentType.key)
    setValue(contentType.text, forHTTPHeaderField: contentType.key)
  }
}
