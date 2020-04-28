import SwiftContentType

extension AnyContentType: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(text)
  }
}


public
extension AnyContentType {
  var encoder:MIMEEncoder {
    guard
      let encoder = EncoderConfiguration.global.registedEncoder[self]
      else {
        fatalError("trying to get Encoder of \(text), but global EncoderConfiguation didn't have relative Encoder")
    }
    return encoder
  }
  func encoder(from config: EncoderConfiguration) throws -> MIMEEncoder {
    guard
      let encoder = config.registedEncoder[self]
      else {
         throw AnyError("trying to get Encoder of \(text), but the giving EncoderConfiguation didn't have relative Encoder")
    }
    return encoder
  }
  
  var decoder: MIMEDecoder {
    guard
      let decoder = DecoderConfiguration.global.registedDecoder[self]
      else {
        fatalError("trying to get Decoder of \(text), but global DecoderConfiguation didn't have relative Decoder")
    }
    return decoder
  }
  
  func decoder(from config: DecoderConfiguration) throws -> MIMEDecoder {
     guard
       let decoder = config.registedDecoder[self]
       else {
         throw AnyError("trying to get Decoder of \(text), but the giving DecoderConfiguation didn't have relative Decoder")
     }
     return decoder
   }
}

