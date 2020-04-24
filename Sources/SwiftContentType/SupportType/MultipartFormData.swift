//
//  File 2.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import SwiftcontentTypeCore
public
struct MultipartFormData:ContentTypeDetail {
  public var attribute: [String : CustomStringConvertible]
  
  
  public var type: String { "mutlipart" }
  public var subType: String { "formdata"}
  public var bondary = ""
  private var _attritube: [String: CustomStringConvertible] = [:]
  
  public var attritube: [String : CustomStringConvertible] {
    get {
      var copy = _attritube
      copy["bondary"] = bondary
      return copy
      
    }
    set {
      _attritube = newValue
    }
  }
  
}
extension MultipartFormData: ContentType {
  
}

public extension AnyContentType {
  //  static let formData = multipart("formdata")
  //  static func multipart(_ type: String) -> ContentType {
  //    ContentType(type: "multipart",subType: type)
}

