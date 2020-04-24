public  protocol _ContentType {
  var type:String {get set}
  var subType:String {get set}
  var attritube:[String:CustomStringConvertible] {get set}
 }
 
 
 
 /// The standards tree does not use any tree prefix:
 /// type "/" subtype ["+" suffix] *[";" parameter]
 /// - See also: https://en.wikipedia.org/wiki/Media_type
 ///
 public struct AnyContentType {
  
  public var type:String
  public var subType:String
  public var attritube:[String:CustomStringConvertible] = [:]
  
  public init(type: String, subType: String, attritube: [String : CustomStringConvertible] = [:]) {
    self.type = type
    self.subType = subType
    self.attritube = attritube
  }
 }
 // MARK: - Getter
 public
 extension AnyContentType {
  var value:String {
    let flags = attritube.count > 0 ?  attritube.reduce(into:" ;", {$0 += "\($1.key)=\($1.value)" }
      ) : ""
    return type+"/"+subType + flags
  }
  var key:String {Self.headerFaild}
 }
 // MARK: - Mutating func
 public
 extension AnyContentType {
  func set(_ key:String,_ value: CustomStringConvertible) -> Self{
    var copied = attritube
    copied[key] = value
    return  Self(type: type, subType: subType, attritube: copied)
  }
 }
 
 
 
 
 
 public
 extension AnyContentType {
  init?(by value: String?) {
    
    guard
      var splited = value?.split(separator: ";")
      else {return nil}
    let typeList = splited.removeFirst().split(separator: "/")
    guard
      let type = typeList.first
      else {return nil}
    let subType = typeList.last
    self.type = String(type)
    self.subType = String(subType ?? "")
    let atttributesplited = splited
      .map{$0.trimmingCharacters(in: .whitespacesAndNewlines)}
    var attritube:[String:String] = [:]
    for ele in atttributesplited  {
      let splitedAttribute = ele.split(separator: "=").map(String.init)
      attritube[splitedAttribute[0]] = splitedAttribute[1]
    }
    self.attritube = attritube
  }
 }
