//
//  FacebookProfilePresenter.swift
//  FacebookProfile
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FacebookProfilePresenterInterface {
  func presentSomething(response: FacebookProfile.Something.Response)
}

class FacebookProfilePresenter: FacebookProfilePresenterInterface {
  weak var viewController: FacebookProfileViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: FacebookProfile.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = FacebookProfile.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
