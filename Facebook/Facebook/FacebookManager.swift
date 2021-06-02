//
//  FacebookManager.swift
//  Facebook
//
//  Created by THAMMANOON WETHANYAPORN on 29/5/2564 BE.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

public final class FacebookManager {
  public init() {}
  static let loginManager = LoginManager()
  public static func setupFacebook(application: UIApplication,
                            launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  public static func openUrl(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    ApplicationDelegate.shared.application(app, open: url, options: options)
  }
    
  public static func login(viewController: UIViewController?, completion: @escaping () -> Void) {
    if isLogined {
      FacebookManager.loginManager.logOut()
      completion()
    } else {
      FacebookManager.loginManager.logIn(permissions: [.publicProfile, .email], viewController: viewController) { result in
        switch result {
        case .success(granted: let granted, declined: let declined, token: let token):
          print("===\(granted)")
          print("===\(declined)")
          print("===\(token as Any)")
          completion()
        case .cancelled:
          completion()
        case .failed(_):
          completion()
        }
      }
    }
  }
    
  public static var getProfile: Profile? {
    return Profile.current
  }
    
  public static var token: String? {
    return AccessToken.current?.tokenString
  }
    
  public static var isLogined: Bool {
    guard let token = AccessToken.current else { return false }
    return !token.isExpired
  }
    
  public static func shareBackgroundImageStory() {
    guard let image = UIImage(named: "fb_logout") else { return }
    if let pngImage = image.pngData() {
      backgroundImage(pngImage, appId: "480426483266855")
    }
  }

  private static func backgroundImage(_ backgroundImage: Data, appId: String) {
    // Verify app can open custom URL scheme, open if able
    guard let urlScheme = URL(string: "facebook-stories://share"),
      UIApplication.shared.canOpenURL(urlScheme) else {
        // Handle older app versions or app not installed case
        return
      }
    let pasteboardItems = [["com.facebook.sharedSticker.backgroundImage": backgroundImage,
                            "com.facebook.sharedSticker.appID": appId]]
    let pasteboardOptions: [UIPasteboard.OptionsKey: Any] = [.expirationDate: Date().addingTimeInterval(60 * 5)]
    // This call is iOS 10+, can use 'setItems' depending on what versions you support
    UIPasteboard.general.setItems(pasteboardItems, options: pasteboardOptions)
    UIApplication.shared.open(urlScheme)
  }
    
    public static func getPhotoSharingContent(photos: [UIImage]) {
    // Create `SharePhoto` object
    let contentPhoto: [SharePhoto] = photos.map {
      return SharePhoto(image: $0, userGenerated: true)
    }
    
    // Add data to `SharePhotoContent`
    let photoContent = SharePhotoContent()
    photoContent.photos = contentPhoto
    // Optional:
    photoContent.hashtag = Hashtag("#rbhHashTag")
    showDialog(content: photoContent)
  }
    
  public static func getLinkSharingContent(url: String) {
    let shareLinkContent = ShareLinkContent()
    guard let url = URL(string: url) else { return }
    shareLinkContent.contentURL = url
    // Optional:
    shareLinkContent.hashtag = Hashtag("#rbhHashTag")
    shareLinkContent.quote = "rbhQuote"
    showDialog(content: shareLinkContent)
  }
    
  private static func showDialog(content: SharingContent, mode: ShareDialog.Mode = .feedWeb) {
    let dialog = ShareDialog()
    let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    if var topController = keyWindow?.rootViewController {
      while let presentedViewController = topController.presentedViewController {
        topController = presentedViewController
      }
      dialog.shareContent = content
      dialog.mode = mode
      dialog.fromViewController = topController
    }
    dialog.show()
  }
}
