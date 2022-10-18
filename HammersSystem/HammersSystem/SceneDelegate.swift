//
//  SceneDelegate.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

		let vc1 = UINavigationController(rootViewController: HomeAssembly.controller())
		let vc2 = UINavigationController(rootViewController: HomeAssembly.controller())
		let vc3 = UINavigationController(rootViewController: HomeAssembly.controller())
		let vc4 = UINavigationController(rootViewController: HomeAssembly.controller())
		vc1.title = "Меню"
		vc2.title = "Контакты"
		vc3.title = "Профиль"
		vc4.title = "Корзина"
		let tabBarVC = UITabBarController()
		tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
		tabBarVC.modalPresentationStyle = .fullScreen
		tabBarVC.tabBar.backgroundColor = Token.white.color
		tabBarVC.tabBar.isTranslucent = false
		let icons = ["iconBurger", "iconMarker", "iconPerson", "iconBucket"]
		if let items = tabBarVC.tabBar.items {
			for i in 0..<items.count {
				items[i].image = UIImage(named: icons[i])
			}
		}
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
}

