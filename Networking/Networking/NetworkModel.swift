//
//  NetworkModel.swift
//  Networking
//
//  Created by THAMMANOON WETHANYAPORN on 29/5/2564 BE.
//

import Foundation
import Alamofire

public struct Product: Codable {
  let name: String
  let price: Double
}

public enum RestError: Error {
  case missing(String)
  case invalid(String, Any)
  case invalidJSON
}

public struct OptionalDataResponse<T: Codable>: Codable {
  let status: Status
  let data: T?
}

public struct Status: Codable, Equatable {
  let code: Int
  let header: String?
  let description: String
  
  init(code: Int, header: String?, description: String) {
    self.code = code
    self.header = header
    self.description = description
  }
}
