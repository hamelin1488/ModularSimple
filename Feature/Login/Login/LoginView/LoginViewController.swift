//
//  LoginViewController.swift
//  Login
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginViewControllerInterface: class {
  func displaySomething(viewModel: Login.Something.ViewModel)
}

public class LoginViewController: UIViewController, LoginViewControllerInterface {
  var interactor: LoginInteractorInterface!
  var router: LoginRouterInterface!

  // MARK: - Object lifecycle

  public override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: LoginViewController) {
    let router = LoginRouter()
    router.viewController = viewController

    let presenter = LoginPresenter()
    presenter.viewController = viewController

    let interactor = LoginInteractor()
    interactor.presenter = presenter

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  public override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
  }

  // MARK: - Event handling

  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work

    let request = Login.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: Login.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

    @IBAction func navigate(_ sender: Any) {
        router.navigateToSomewhere()
    }
}
