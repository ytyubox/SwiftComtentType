import XCTest
import Combine
import SwiftContentTypeCoder

class JSONCoderTests: XCTestCase{
  private struct JSON:Codable {let a:String}
  func testDecodingJSON() {
    let json = #"{"a":"A"}"#.data(using: .utf8)!
    let contentType = AnyContentType.applictaionJson
    var decoded:JSON?
    XCTAssertNoThrow(
      decoded = try contentType.decoder.decode(JSON.self, from: json)
    )
    XCTAssertEqual(decoded?.a, "A")
  }
  func testEncodingJSON() {
    let json = JSON(a: "A")
    let contentType = AnyContentType.applictaionJson
    var encoded:Data?
    XCTAssertNoThrow(
      encoded = try contentType.encoder.encode(json)
    )
    XCTAssertNotNil(encoded)
    let jsonUTF8 = String(data: encoded!, encoding: .utf8)
    XCTAssertNotNil(jsonUTF8)
    XCTAssertEqual(jsonUTF8, #"{"a":"A"}"#)
  }
  func testFakeURLResponseAndBody() {
    struct Jsonplaceholder: Codable {
      let userID, id: Int
      let title: String
      let completed: Bool
      
      enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
      }
    }
    
    let await = XCTestExpectation()
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    let json:Data = #"""
    {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
    }
    """#.data(using: .utf8)!
    let urlResponse = HTTPURLResponse(url: url, mimeType: "application/json", expectedContentLength: 123, textEncodingName: "UTF-8")
    let sink =
//      URLSession.shared.dataTaskPublisher(for: url)
      Just<(Data,HTTPURLResponse)>((json,urlResponse))
        .tryMap({ (d,r) -> Jsonplaceholder in
          let contentType = r.contentType!
          return try contentType.decoder.decode(Jsonplaceholder.self, from: d)
        })
        .sink(receiveCompletion: {_ in}) { (m) in
          dump(m)
          await.fulfill()
    }
    wait(for: [await], timeout: 10)
  }
}

