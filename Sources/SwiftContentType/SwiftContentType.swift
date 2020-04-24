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
  public init?(string: String) {
    let component = ContentTypeComponents(by: string)
    guard
    let it = component.contentType else { return nil}
    self = it
  }
}
extension AnyContentType: ContentType {}

public
extension AnyContentType {
  func set(_ key:String,_ value: CustomStringConvertible) -> Self{
    var copied = attribute
    copied[key] = value
    return  Self(type: type, subType: subType, attritube: copied)
  }
}


extension ContentTypeComponents {
  public var contentType:AnyContentType? {
    AnyContentType(type: type, subType: subType,attritube: attribute)
  }
}
