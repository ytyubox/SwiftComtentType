//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation
import URLEncodedForm

// MARK: - Static member
extension URLEncodedFormEncoder: DataEncoder {
	
}
extension URLEncodedFormDecoder: DataDecoder {
}

public extension ContentType {
	static let headerFaild:String = "Content-Type"
	static let json = applictaion("json",encoder: JSONEncoder(),decoder: JSONDecoder())
	static let urlEncode = applictaion("x-www-form-urlencoded",encoder: URLEncodedFormEncoder(),decoder: URLEncodedFormDecoder())
	//	static let formData = multipart("formdata")
	static let plainText = text("plain")
}

// MARK: - dot func
public extension ContentType {
	static func applictaion(_ type:String,encoder: DataEncoder, decoder: DataDecoder) -> ContentType {
		ContentType(type: "application",subType:  type,decoder: decoder, encoder: encoder)
	}
	//	static func multipart(_ type: String) -> ContentType {
	//		ContentType(type: "multipart",subType: type)
	
	static func text(_ type: String) -> Self {
		ContentType(type: "text", subType: type,decoder: PlainTextDecoder(),encoder: PlainTextEncoder())
	}
	static func json(_ encoding: String) -> Self {
		json.set("charset", encoding.uppercased())
	}
	
}
