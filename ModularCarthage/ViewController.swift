//
//  ViewController.swift
//  ModularCarthage
//
//  Created by THAMMANOON WETHANYAPORN on 28/5/2564 BE.
//

import UIKit
import Login

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func navigate(_ sender: Any) {
        let bundle = Bundle(for: LoginViewController.self)
      let storyBoard: UIStoryboard = UIStoryboard(name: "LoginFacebook", bundle: bundle)
      guard let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginFacebook") as? LoginViewController else { return }
          navigationController?.pushViewController(newViewController, animated: true)
        }
}

public struct Data: Decodable, Encodable {
  let data: String
}
