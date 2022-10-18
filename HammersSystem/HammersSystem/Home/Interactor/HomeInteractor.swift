//
//  HomeInteractor.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import Foundation

final class HomeInteractor {

	let data: [MenuEntity] = [
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

	let presenter: HomePresenterProtocol

	init(presenter: HomePresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorProtocol {

	func fetch() {
		presenter.itemsDidFetch(items: data)
	}
}
