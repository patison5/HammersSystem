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

	func modelDidFetch(entity: HomeEntity) {
		var items: [MenuModel] = []
		entity.items.forEach {
			items.append(MenuModel(
				image: UIImage(named: $0.image)!,
				title: $0.title,
				description: $0.description,
				price: $0.price
			))
		}

		let categories: [CategoryModel] = entity.header.categories.map { category in
			CategoryModel(title: category.title, isSelected: category.isSelected)
		}

		let bannerImages: [UIImage] = entity.header.bannerImages.map { bannerImage in
			UIImage(named: bannerImage)!
		}

		let headerModel = HeaderModel(
			currentTown: entity.header.selectedTown,
			availableTowns: entity.header.availableTowns,
			bannerImages: bannerImages,
			categories: categories
		)
		let homeModel = HomeViewModel(items: items, headerModel: headerModel)
		view?.update(with: homeModel)
	}

	func fetchDidFail() {
		print("ошибка")
	}
}
