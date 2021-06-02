//
//  FacebookProfileInteractor.swift
//  FacebookProfile
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FacebookProfileInteractorInterface {
  func doSomething(request: FacebookProfile.Something.Request)
}

class FacebookProfileInteractor: FacebookProfileInteractorInterface {
  var presenter: FacebookProfilePresenterInterface!

  // MARK: - Business logic

  func doSomething(request: FacebookProfile.Something.Request) {

  }
}
