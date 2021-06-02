//
//  NetworkingManager.swift
//  Networking
//
//  Created by THAMMANOON WETHANYAPORN on 29/5/2564 BE.
//

import Foundation
import Alamofire

public final class ProductService {
  public init() { }
  @discardableResult
  public class func get<T: Codable>(path: String,
                                    body: [String: Any]? = nil,
                                    completion: @escaping (Result<T, Error>) -> Void) -> RestRequest? {
      return RestRequest(with: connect(method: .get,
                                       path: path,
                                       body: body,
                                       completion: completion))
  }

  @discardableResult
  public class func connect<T: Codable>(method: HTTPMethod,
                                         path: String,
                                         body: [String: Any]? = nil,
                                         completion: @escaping (Result<T, Error>) -> Void) -> DataRequest? {
      let headers: HTTPHeaders = []
      let apiURL: String = path
      let endcoding: Alamofire.ParameterEncoding = JSONEncoding.default
      let dataRequest = AF.request(apiURL, method: method, parameters: body, encoding: endcoding, headers: headers)
      dataRequest.validate()
        .responseDecodable(of: T.self) { response in
          guard let result = response.value else {
            completion(Result.failure(RestError.invalidJSON))
            return
          }
          completion(Result.success(result))
      }
      return dataRequest
    }
}

public final class RestRequest {
  let dataRequest: DataRequest

  init?(with dataRequest: DataRequest?) {
    guard let dataRequest = dataRequest else { return nil }
    self.dataRequest = dataRequest
  }

  func cancel() {
    dataRequest.cancel()
  }
}
