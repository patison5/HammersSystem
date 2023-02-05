//
//  HeaderEntity.swift
//  HammersSystem
//
//  Created by Fedor Penin on 06.02.2023.
//

import Foundation

struct HeaderEntity {

	/// Выбранный город
	let selectedTown: String

	/// Доступные города
	let availableTowns: [String]

	/// Ссылки на изображения баннеров
	let bannerImages: [String]

	/// Категории
	var categories: [CategoryEntity]
}

struct CategoryEntity {

	/// Название категогрии
	let title: String

	/// Состоание выбора
	var isSelected: Bool
}
