//
//  File 2.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation
public
struct MultipartFormData:ContentType {
  public var type: String { "mutlipart" }
  public var subType: String { "formdata"}
  public var bondary = ""
  public var attritube: [String : CustomStringConvertible] = [:]
  
}

public extension AnyContentType {
  //  static let formData = multipart("formdata")
  //  static func multipart(_ type: String) -> ContentType {
  //    ContentType(type: "multipart",subType: type)
}
