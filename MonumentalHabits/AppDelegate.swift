//
//  AppDelegate.swift
//  MonumentalHabits
//
//  Created by Rafael Ahmedov on 12.08.21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        let defaults = UserDefaults.standard
        let introShowed = defaults.bool(forKey: Utils.userDefaultsKey)
        
        var viewController: UIViewController?
        if introShowed {
            viewController = LoginViewController()
        } else {
            viewController = IntrodactionController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }
        let navigationController = UINavigationController(rootViewController: viewController!)
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
        self.window = window
        return true
    }
    
    static func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
extension UIViewController {
func setAsRoot(from viewController: UIViewController = UIViewController()) {
    if let window = AppDelegate.getAppDelegate().window {
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: self)
    }
  }
}
