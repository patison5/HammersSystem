//
//  HomePresenterProtocol.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import Foundation

/// Описание презентер модуля
protocol HomePresenterProtocol: AnyObject {

	///  Отобразить полученные данные
	/// - Parameter items: Полученные с сервера данные
	func modelDidFetch(model: [MenuEntity])

	/// Отобразить ошибку получения данных с сервера
	func fetchDidFail()
}
