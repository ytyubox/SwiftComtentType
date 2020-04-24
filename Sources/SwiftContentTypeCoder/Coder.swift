//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation
import Combine
public protocol DataDecoder {
	func decode<T>(_: T.Type, from: Data) throws -> T where T: Decodable
}

public protocol DataEncoder {
	func encode<T>(_: T) throws -> Data where T: Encodable
}

extension JSONDecoder: DataDecoder{
}
extension JSONEncoder: DataEncoder{
}
