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

		setupTabBarShadow(tabBar: tabBarVC.tabBar)
		setupTabBarItems(tabBar: tabBarVC.tabBar)

		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = tabBarVC
		window?.makeKeyAndVisible()
	}
}

private extension SceneDelegate {

	func setupTabBarShadow(tabBar: UITabBar) {
		tabBar.layer.masksToBounds = false
		tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
		tabBar.layer.shadowOffset = CGSize(width: -4, height: -6)
		tabBar.layer.shadowOpacity = 0.5
		tabBar.layer.shadowRadius = 20
	}

	func setupTabBarItems(tabBar: UITabBar) {
		let icons = [
			("iconBurgerInActive", "iconBurgerActive"),
			("iconMarkerInActive", "iconMarkerActive"),
			("iconPersonInActive", "iconPersonActive"),
			("iconBucketInActive", "iconBucketActive")
		]

		if let items = tabBar.items {
			for i in 0..<items.count {
				items[i].setTitleTextAttributes([
					NSAttributedString.Key.foregroundColor: Token.redDark.color
				], for: .selected)
				items[i].image = UIImage(named: icons[i].0)?.withRenderingMode(.alwaysOriginal)
				items[i].selectedImage = UIImage(named: icons[i].1)?.withRenderingMode(.alwaysOriginal)
			}
		}
	}
}
