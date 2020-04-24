//
//  File 2.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation

struct MultipartFormData:ContentType {
  let type: String = "mutlipart"
  
  let subType: String = "formdata"
  
  var bondary = ""
  
  var attritube: [String : CustomStringConvertible] = [:]
  
}

public extension AnyContentType {
  //  static let formData = multipart("formdata")
  //  static func multipart(_ type: String) -> ContentType {
  //    ContentType(type: "multipart",subType: type)
}
