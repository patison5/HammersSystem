//
//  HomeInteractor.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import Foundation

final class HomeInteractor {

	let presenter: HomePresenterProtocol

	init(presenter: HomePresenterProtocol) {
		self.presenter = presenter
	}

}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorProtocol {
    
}
