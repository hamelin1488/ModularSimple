//
//  FacebookProfileViewController.swift
//  FacebookProfile
//
//  Created by THAMMANOON WETHANYAPORN on 1/6/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Facebook
import Common

protocol FacebookProfileViewControllerInterface: class {
  func displaySomething(viewModel: FacebookProfile.Something.ViewModel)
}

public class FacebookProfileViewController: UIViewController, FacebookProfileViewControllerInterface {
  var interactor: FacebookProfileInteractorInterface!
  var router: FacebookProfileRouterInterface!

  // MARK: - Object lifecycle

    public override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: FacebookProfileViewController) {
    let router = FacebookProfileRouter()
    router.viewController = viewController

    let presenter = FacebookProfilePresenter()
    presenter.viewController = viewController

    let interactor = FacebookProfileInteractor()
    interactor.presenter = presenter

    viewController.interactor = interactor
    viewController.router = router
  }

  func displaySomething(viewModel: FacebookProfile.Something.ViewModel) {
    updateProfile()
  }
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var facebookButton: UIButton!
   
    public override func viewDidLoad() {
      super.viewDidLoad()
      let login = UIImage(named: "fb_login")
      facebookButton.setImage(login, for: .normal)
      let logout = UIImage(named: "fb_logout")
      facebookButton.setImage(logout, for: .selected)
      let request = FacebookProfile.Something.Request()
      interactor.doSomething(request: request)
    }
      
    public func updateProfile() {
      if FacebookManager.isLogined {
        facebookButton.isSelected = true
      } else {
        facebookButton.isSelected = false
      }
      guard let profile = FacebookManager.getProfile else {
        idLabel.text = "Null"
        nameLabel.text = "Null"
        return
      }
      idLabel.text = profile.userID
      emailLabel.text = profile.email
      nameLabel.text = unwrapped(profile.name, with: "")
    }
      
    @IBAction func loginButtonTapped(_ sender: Any) {
//      FacebookManager.login(viewController: self) {
//        self.updateProfile()
//      }
    }
      
    @IBAction func shareContentTapped(_ sender: Any) {
      let text = "https://static.robinhood.in.th/share_link.html?utm_source=consumerapp&utm_medium=sharefavshopbutton&utm_campaign=sharefavshop&utm_content=992974&URI=robinhoodth://merchantlanding/id/992974"
      FacebookManager.getLinkSharingContent(url: text)
    }
      
    @IBAction func shareImageTapped(_ sender: Any) {
      guard let login = UIImage(named: "fb_login"), let logout = UIImage(named: "fb_logout") else { return }
      let image = [login, logout]
      FacebookManager.getPhotoSharingContent(photos: image)
    }
      
    @IBAction func shareStoryTapped(_ sender: Any) {
      FacebookManager.shareBackgroundImageStory()
    }
}
