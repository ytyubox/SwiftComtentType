import Foundation
public  protocol ContentType {
  var text: String {get}
}

public protocol MIMETypeDetail {
  var type:String {get}
  var subType:String {get}
  var attribute:[String:CustomStringConvertible] {get set}
  
}
public extension ContentType where Self : MIMETypeDetail {
  var text:String {
    let flags =
      self.attribute.count > 0
      ? attribute.reduce(into:"; ", {$0 += "\($1.key)=\($1.value)" })
      : ""
    return type + "/" + subType + flags
  }
  var key:String {Self.headerFaild}
}
