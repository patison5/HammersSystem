//
//  AppDelegate.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//		UITabBar.appearance().tintColor = Token.redDark.color
//		UITabBar.appearance().barTintColor = Token.redDark.color
//		UITabBar.appearance().selectedItem?.badgeColor = Token.redDark.color
//		UITabBar.appearance().unselectedItemTintColor = Token.greyLight2.color
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

