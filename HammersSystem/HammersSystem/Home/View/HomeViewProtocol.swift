//
//  HomeViewProtocol.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

/// Описание вью контроллера модуля
protocol HomeViewProtocol where Self: UIView {

	/// Получить данные с сервера
	func fetch()

	/// Обновить вью с новыми данными
	/// - state: Полученные данные
	func update(with state: [MenuModel])
}
