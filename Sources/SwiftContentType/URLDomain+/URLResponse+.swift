//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import SwiftcontentTypeCore
import Foundation
public
extension HTTPURLResponse {
	var contentType: AnyContentType? {
		let value = allHeaderFields[AnyContentType.headerFaild] as? String
    let contentTypeComponents = ContentTypeComponents(by: value)
    return contentTypeComponents.contentType
	}
}
