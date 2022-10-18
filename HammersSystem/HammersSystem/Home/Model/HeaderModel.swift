//
//  HeaderModel.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

struct HeaderModel {

	var currentTown: String = "Москва"

	var availableTowns: [String] = []

	var bannerImages: [UIImage] = []

	var categories: [CategoryModel] = []
}

struct CategoryModel {

	/// Название категогрии
	let title: String

	/// Состоание выбора
	var isSelected: Bool = false
}
