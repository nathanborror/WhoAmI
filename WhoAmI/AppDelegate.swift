//
//  AppDelegate.swift
//

import UIKit

let SafariRedirectNotification = Notification.Name("SafariRedirectNotification")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let sourceApplication = options[.sourceApplication] else {
            return false
        }
        guard String(describing: sourceApplication) == "com.apple.SafariViewService" else {
            return false
        }
        NotificationCenter.default.post(name: SafariRedirectNotification, object: url)
        return true
    }
}
