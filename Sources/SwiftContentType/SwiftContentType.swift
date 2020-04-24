import SwiftcontentTypeCore


/// The standards tree does not use any tree prefix:
/// type "/" subtype ["+" suffix] *[";" parameter]
/// - See also: https://en.wikipedia.org/wiki/Media_type
///


public struct AnyContentType:ContentTypeDetail {

  public var type:String
  public var subType:String
  public var attribute:[String:CustomStringConvertible] = [:]
  
  public init(type: String, subType: String, attritube: [String : CustomStringConvertible] = [:]) {
    self.type = type
    self.subType = subType
    self.attribute = attritube
  }
}
extension AnyContentType: ContentType { }
// MARK: - Getter


// MARK: - Mutating func
public
extension AnyContentType {
  func set(_ key:String,_ value: CustomStringConvertible) -> Self{
    var copied = attribute
    copied[key] = value
    return  Self(type: type, subType: subType, attritube: copied)
  }
}


extension ContentTypeComponents {
  public var contentType:AnyContentType {
    AnyContentType(type: "", subType: "")
  }
}
