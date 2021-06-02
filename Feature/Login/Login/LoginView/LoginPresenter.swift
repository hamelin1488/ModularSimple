//
//  LoginPresenter.swift
//  Login
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginPresenterInterface {
  func presentSomething(response: Login.Something.Response)
}

class LoginPresenter: LoginPresenterInterface {
  weak var viewController: LoginViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: Login.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = Login.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
