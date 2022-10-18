//
//  HomeView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeView: UIView {

	// MARK: - Private properties

	var data: [MenuModel] = []

	let interactor: HomeInteractorProtocol

	private let tableView: UITableView = {
		let table = UITableView(frame: .zero, style: .insetGrouped)
		table.backgroundColor = .clear
		return table
	}()

	// MARK: - Init

	init(interactor: HomeInteractorProtocol) {
		self.interactor = interactor
		super.init(frame: .zero)
		tableView.dataSource = self
		tableView.delegate = self
		backgroundColor = Token.background.color
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - HomeViewProtocol

extension HomeView: HomeViewProtocol {

	func fetch() {
		interactor.fetch()
	}

	func update(with state: [MenuModel]) {
		data = state
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		data.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		UITableViewCell()
	}
}

// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
	
}
