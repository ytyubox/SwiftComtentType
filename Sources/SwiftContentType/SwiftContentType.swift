import Foundation
/// The standards tree does not use any tree prefix:
/// type "/" subtype ["+" suffix] *[";" parameter]
/// - See also: https://en.wikipedia.org/wiki/Media_type
///
public struct ContentType {
	public init(type: String, subType: String, attritube: [String : CustomStringConvertible] = [:]) {
		self.type = type
		self.subType = subType
		self.attritube = attritube
	}
	
	
	public var type:String
	public var subType:String
	public var attritube:[String:CustomStringConvertible] = [:]
	public var value:String {
		let flags = attritube.count > 0 ?  attritube.reduce(into:" ;", {$0 += "\($1.key)=\($1.value)" }
			) : ""
		return type+"/"+subType + flags
	}
	public var key:String {Self.headerFaild}
	public func set(_ key:String,_ value: CustomStringConvertible) -> Self{
		Self(type: type, subType: subType, attritube: [key:value])
	}
}
extension ContentType: Equatable {
	public static func == (lhs: ContentType, rhs: ContentType) -> Bool {
		lhs.type == rhs.type && lhs.subType == rhs.subType
	}
	
}

// MARK: - Static member

public extension ContentType {
	static let headerFaild:String = "Content-Type"
	static let json = applictaion("json")
	static let urlEncode = applictaion("x-www-form-urlencoded")
	static let formData = multipart("formdata")
	static let plainText = text("plain")
}

// MARK: - dot func
public extension ContentType {
	static func applictaion(_ type:String) -> ContentType {
		ContentType(type: "application",subType:  type)
	}
	static func multipart(_ type: String) -> ContentType {
		ContentType(type: "multipart",subType: type)
	}
	
	static func text(_ type: String) -> Self {
		ContentType(type: "text", subType: type)
	}
	static func json(_ encoding: String) -> Self {
		json.set("charset", encoding.uppercased())
	}
}

// MARK: - know content-type list

extension ContentType:CaseIterable {
	public static var allCases: [ContentType] {
		[
			.json,
			.plainText,
			.formData,
			.urlEncode,
		]
	}
	init?(by value: String) {
		for type in ContentType.allCases {
			if type.value == value {
				self = type
				return
			}
		}
		return nil
	}
	init?(by value:String?) {
		guard let value = value else {return nil}
		self.init(by: value)
	}
}


extension URLRequest {
	public mutating func set(_ contentType:ContentType?) {
		guard let contentType = contentType else {return}
		setValue(contentType.value, forHTTPHeaderField: contentType.key)
	}
}
