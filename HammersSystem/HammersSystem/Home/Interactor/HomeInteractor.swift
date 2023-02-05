//
//  HomeInteractor.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import Foundation

final class HomeInteractor {

	private let menuData: [MenuEntity] = [
		MenuEntity(
			image: "Image1",
			title: "Ветчина и грибы",
			description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image2",
			title: "Баварские колбаски",
			description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image3",
			title: "Нежный лосось",
			description: "Лосось, томаты черри, моцарелла, соус песто",
			price: 345
		),
		MenuEntity(
			image: "Image4",
			title: "Пицца четыре сыра",
			description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
			price: 345
		),
		MenuEntity(
			image: "Image1",
			title: "Ветчина и грибы",
			description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image2",
			title: "Баварские колбаски",
			description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image3",
			title: "Нежный лосось",
			description: "Лосось, томаты черри, моцарелла, соус песто",
			price: 345
		),
		MenuEntity(
			image: "Image4",
			title: "Пицца четыре сыра",
			description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
			price: 345
		),
		MenuEntity(
			image: "Image1",
			title: "Ветчина и грибы",
			description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image2",
			title: "Баварские колбаски",
			description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image3",
			title: "Нежный лосось",
			description: "Лосось, томаты черри, моцарелла, соус песто",
			price: 345
		),
		MenuEntity(
			image: "Image4",
			title: "Пицца четыре сыра",
			description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
			price: 345
		),
		MenuEntity(
			image: "Image1",
			title: "Ветчина и грибы",
			description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image2",
			title: "Баварские колбаски",
			description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
			price: 345
		),
		MenuEntity(
			image: "Image3",
			title: "Нежный лосось",
			description: "Лосось, томаты черри, моцарелла, соус песто",
			price: 345
		),
		MenuEntity(
			image: "Image4",
			title: "Пицца четыре сыра",
			description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
			price: 345
		)
	]

	private var headerData = HeaderEntity(
		selectedTown: "Москва",
		availableTowns: ["Москва", "Мурманск"],
		bannerImages: ["imagePreview", "imagePreview"],
		categories: [
			CategoryEntity(title: "Пицца", isSelected: true),
			CategoryEntity(title: "Комбо", isSelected: false),
			CategoryEntity(title: "Десерты", isSelected: false),
			CategoryEntity(title: "Напитки", isSelected: false)
		])

	private let presenter: HomePresenterProtocol

	init(presenter: HomePresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorProtocol {

	func fetch() {
		DispatchQueue.global().asyncAfter(deadline: .now() + 0.0) { [weak self] in
			DispatchQueue.main.async {
				guard let self = self else { return }
				let homeEntity = HomeEntity(items: self.menuData, header: self.headerData)
				self.presenter.modelDidFetch(entity: homeEntity)
			}
		}
	}

	func categoryDidSelect(category categoryModel: CategoryModel) {
		for (idx, categoryEntity) in headerData.categories.enumerated() {
			if (categoryEntity.title == categoryModel.title) {
				headerData.categories[idx].isSelected = true
			} else {
				headerData.categories[idx].isSelected = false
			}
		}
		let homeEntity = HomeEntity(items: self.menuData, header: self.headerData)
		self.presenter.modelDidFetch(entity: homeEntity)
	}
}
