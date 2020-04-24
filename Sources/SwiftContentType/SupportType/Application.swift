//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation


public extension AnyContentType {


  static func applictaion(_ type:String) -> AnyContentType {
    AnyContentType(type: "application",subType:  type)
  }
  static var applictaionJson:AnyContentType  {applictaion("json")}

  static var applictaionUrlEncode:AnyContentType { applictaion("x-www-form-urlencoded")}
  
  static func applictaionJson(_ encoding: String) -> Self {
    applictaionJson.set("charset", encoding.uppercased())
  }
  
	
}
