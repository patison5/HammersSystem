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

	func modelDidFetch(model: [MenuEntity]) {
		var items: [MenuModel] = []
		model.forEach {
			items.append(MenuModel(
				image: UIImage(named: $0.image)!,
				title: $0.title,
				description: $0.description,
				price: $0.price
			))
		}
		let headerModel = HeaderModel(
			currentTown: "Москва",
			availableTowns: ["Москва"],
			bannerImages: [
				UIImage(named: "imagePreview")!,
				UIImage(named: "imagePreview")!,
				UIImage(named: "imagePreview")!
			],
			categories: [
				CategoryModel(title: "Пицца", isSelected: true),
				CategoryModel(title: "Комбо"),
				CategoryModel(title: "Десерты"),
				CategoryModel(title: "Напитки")
			]
		)
		let homeModel = HomeViewModel(items: items, headerModel: headerModel)
		view?.update(with: homeModel)
	}
	
	func fetchDidFail() {
		print("ошибка")
	}
}
