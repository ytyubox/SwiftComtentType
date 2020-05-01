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
    let value = mimeType
    let contentTypeComponents = ContentTypeComponents(by: value)
    return contentTypeComponents.contentType
  }
  enum HttpResponseError:Error {
    case notHttpResponse
  }
}

import Combine
extension URLSession.DataTaskPublisher {
  public func mapToHttpURLResponse() ->  Publishers.TryMap<URLSession.DataTaskPublisher, (Data, HTTPURLResponse)> {
    self.tryMap({ (arg0) -> (Data, HTTPURLResponse) in
      
      let (d, r) = arg0
      guard let res = r as? HTTPURLResponse else {
        throw HTTPURLResponse.HttpResponseError.notHttpResponse
      }
      return (d, res)
    })
  }
}


