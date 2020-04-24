import Foundation
import Combine
/// The standards tree does not use any tree prefix:
/// type "/" subtype ["+" suffix] *[";" parameter]
/// - See also: https://en.wikipedia.org/wiki/Media_type
///
public struct ContentType {
	internal init(type: String, subType: String, attritube: [String : CustomStringConvertible] = [:]) {
		self.type = type
		self.subType = subType

		self.attritube = attritube
	}

	public var type:String
	public var subType:String
	public var attritube:[String:CustomStringConvertible] = [:]
	
}
// MARK: - Getter
public
extension ContentType {
	var value:String {
		let flags = attritube.count > 0 ?  attritube.reduce(into:" ;", {$0 += "\($1.key)=\($1.value)" }
			) : ""
		return type+"/"+subType + flags
	}
	var key:String {Self.headerFaild}
}
// MARK: - Mutating func
public
extension ContentType {
	func set(_ key:String,_ value: CustomStringConvertible) -> Self{
		var copied = attritube
		copied[key] = value
		return  Self(type: type, subType: subType, attritube: copied)
	}
}



extension URLRequest {
	public mutating func set(_ contentType:ContentType?) {
		guard let contentType = contentType else {return}
		setValue(contentType.value, forHTTPHeaderField: contentType.key)
	}
}
