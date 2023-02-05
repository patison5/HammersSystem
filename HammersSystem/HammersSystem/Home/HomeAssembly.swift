//
//  HomeAssembly.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeAssembly {

	static func view() -> HomeViewProtocol {
		let presenter = HomePresenter()
		let interactor = HomeInteractor(presenter: presenter)
		let view = HomeView(interactor: interactor)
		presenter.view = view
		return view
	}

	static func controller() -> HomeViewControllerProtocol {
		HomeViewController(homeView: view())
	}
}
