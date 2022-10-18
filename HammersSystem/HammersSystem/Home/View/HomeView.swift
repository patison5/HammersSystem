//
//  HomeView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeView: UIView {

	var interactor: HomeInteractorProtocol

	init(interactor: HomeInteractorProtocol) {
		self.interactor = interactor
		super.init(frame: .zero)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - HomeViewProtocol

extension HomeView: HomeViewProtocol {
	
}
