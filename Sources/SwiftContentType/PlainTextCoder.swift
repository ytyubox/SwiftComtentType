import Foundation
import Combine


public
class PlainTextDecoder: TopLevelDecoder {
	public init(encoding: String.Encoding = .utf8) {
		self.encoding = encoding
	}
	
	public let encoding: String.Encoding
	
	public func decode<T>(_ type: T.Type, from: Data) throws -> T where T : Decodable {
		assert(T.self is String.Type)
		return String(data: from, encoding: self.encoding)! as! T
	}
	
	public typealias Input = Data
}

public
class PlainTextEncoder: TopLevelEncoder {
	public func encode<T>(_ value: T) throws -> Data where T : Encodable {
		assert(T.self is CustomStringConvertible)
		let s = value as! CustomStringConvertible
		return s.description.data(using: self.encoding) ?? Data()
	}
	
	public typealias Output = Data
	
	public init(encoding: String.Encoding = .utf8) {
		self.encoding = encoding
	}
	
	public let encoding: String.Encoding
	
	
}
