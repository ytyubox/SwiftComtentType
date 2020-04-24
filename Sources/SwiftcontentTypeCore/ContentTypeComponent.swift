//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/24.
//

import Foundation
public
struct ContentTypeComponents {
  public init(type: String = "", subType: String = "", attribute: [String : CustomStringConvertible] = [:]) {
    self.type = type
    self.subType = subType
    self.attribute = attribute
  }
  
  
  public var type:String = ""
  public var subType:String = ""
  public var attribute:[String:CustomStringConvertible] = [:]
  
  public init(by value: String?) {
    /// Example:
    ///   Content-Type:
    ///   message/external-body;    <---- type/subType
    ///   access-type=URL;   <---- attritubeKey:value
    ///   URL*0="ftp://";
    ///   URL*1="cs.utk.edu/pub/moore/bulk-mailer/bulk-mailer.tar"
    
    guard
      var splited = value?.split(separator: ";")
      else {return}
    let typeList = splited.removeFirst().split(separator: "/")
    guard
      let type = typeList.first
      else {return}
    let subType = typeList.last
    self.type = String(type)
    self.subType = String(subType ?? "")
    
    let atttributesplited = splited
      .map{$0.trimmingCharacters(in: .whitespacesAndNewlines)}
    var attribute:[String:String] = [:]
    for ele in atttributesplited  {
      let splitedAttribute = ele.split(separator: "=").map(String.init)
      attribute[splitedAttribute[0]] = splitedAttribute[1]
    }
    self.attribute = attribute
  }
}
