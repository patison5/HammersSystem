//
//  HomeInteractorProtocol.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import Foundation

/// Описание интерактор модуля
protocol HomeInteractorProtocol: AnyObject {

	/// Получить данные с сервера
	func fetch()

	/// Обновить состояние фильтра после выбора категории
	/// - Parameter category: Выбранная категория
	func categoryDidSelect(category: CategoryModel)
}
