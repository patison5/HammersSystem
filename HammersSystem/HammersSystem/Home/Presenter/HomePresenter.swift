//
//  HomePresenter.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomePresenter {

	weak var view: HomeViewProtocol?
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {

	func itemsDidFetch(items: [MenuEntity]) {
		var result: [MenuModel] = []
		items.forEach {
			result.append(MenuModel(
				image: UIImage(named: $0.image)!,
				title: $0.title,
				description: $0.description,
				price: $0.price
			))
		}
		view?.update(with: result)
	}
	
	func fetchDidFail() {
		print("ошибка")
	}
}
