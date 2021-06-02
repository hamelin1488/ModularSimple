//
//  LoginRouter.swift
//  Login
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import FacebookProfile

protocol LoginRouterInterface {
  func navigateToSomewhere()
}

class LoginRouter: LoginRouterInterface {
  weak var viewController: LoginViewController!

  // MARK: - Navigation

  func navigateToSomewhere() {
    let bundle = Bundle(for: FacebookProfileViewController.self)
    let storyBoard: UIStoryboard = UIStoryboard(name: "FacebookProfile", bundle: bundle)
    guard let newViewController = storyBoard.instantiateViewController(withIdentifier: "facebookProfile") as? FacebookProfileViewController else { return }
    viewController.navigationController?.pushViewController(newViewController, animated: true)
  }

  // MARK: - Communication

  func passDataToNextScene(segue: UIStoryboardSegue) {
    // NOTE: Teach the router which scenes it can communicate with

    if segue.identifier == "ShowSomewhereScene" {
      passDataToSomewhereScene(segue: segue)
    }
  }

  func passDataToSomewhereScene(segue: UIStoryboardSegue) {
    // NOTE: Teach the router how to pass data to the next scene

    // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
    // someWhereViewController.interactor.model = viewController.interactor.model
  }
}
