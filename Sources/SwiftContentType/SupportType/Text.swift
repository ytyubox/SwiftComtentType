public
extension AnyContentType {
  static func text(_ type: String) -> Self {
    AnyContentType(type: "text", subType: type)
  }
  
  static var plainText:AnyContentType  {text("plain")}
}
