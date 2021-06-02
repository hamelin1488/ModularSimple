//
//  LoginInteractor.swift
//  Login
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Networking

protocol LoginInteractorInterface {
  func doSomething(request: Login.Something.Request)
}

class LoginInteractor: LoginInteractorInterface {
  var presenter: LoginPresenterInterface!

  // MARK: - Business logic

  func doSomething(request: Login.Something.Request) {
    
    getTesting() { result in
    switch result {
    case.success:
      print("success")
    case.failure:
      print("fail")
      }
   }
      let response = Login.Something.Response()
      presenter.presentSomething(response: response)
    }
    
    private func getTesting(completion: @escaping (Result<OptionalDataResponse<Data>, Error>) -> Void) {
      ProductService.get(path: "", completion: completion)
    }
  }
