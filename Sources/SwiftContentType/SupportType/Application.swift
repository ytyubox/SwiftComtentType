//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation


public extension ContentType {


  static func applictaion(_ type:String) -> ContentType {
    ContentType(type: "application",subType:  type)
  }
  static let json = applictaion("json")

  static let urlEncode = applictaion("x-www-form-urlencoded")
  
  static func json(_ encoding: String) -> Self {
    json.set("charset", encoding.uppercased())
  }
  
	
}
