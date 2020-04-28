//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/4/9.
//

import Foundation
import SwiftcontentTypeCore
import SwiftContentType
import URLEncodedForm
import Combine  


public protocol TopLevelDataDecoder: TopLevelDecoder {
  associatedtype Input = Data
}
public protocol TopLevelDataEncoder: TopLevelEncoder {
}


public protocol MIMEDecoder: URLEncodedForm.DataDecoder{
  
}
public protocol MIMEEncoder: URLEncodedForm.DataEncoder{
  
}

extension AnyContentType:MIMEDecoder {
  public func decode<D>(_ decodable: D.Type, from data: Data) throws -> D where D : Decodable {
    try decoder.decode(decodable, from: data)
  }
}

extension AnyContentType: MIMEEncoder {
  public func encode<E>(_ encodable: E) throws -> Data where E : Encodable {
    try encoder.encode(encodable)
  }
  
  
}
