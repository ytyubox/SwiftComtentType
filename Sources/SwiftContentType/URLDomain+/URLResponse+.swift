//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation
public
extension HTTPURLResponse {
	var contentType: AnyContentType? {
		let value = allHeaderFields[AnyContentType.headerFaild] as? String
//		let type = value?.split(separator: ";").first?.trimmingCharacters(in: .whitespacesAndNewlines)
		return AnyContentType(by: value)
	}
}
