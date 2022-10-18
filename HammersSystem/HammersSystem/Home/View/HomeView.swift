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
		backgroundColor = Token.background.color
		setupTable()
		setupViews()
		setupContraints()
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
		let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath)
		cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		cell.selectionStyle = .none

		guard let customCell = cell as? MenuCell else {
			return UITableViewCell()
		}

		let model = self.data[indexPath.row]
		customCell.configure(with: model)
		return customCell
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = HomeTableHeaderCell()
		return headerView
	}
}

// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
	
}

private extension HomeView {

	func setupTable() {
		tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
		tableView.register(HomeTableHeaderCell.self, forHeaderFooterViewReuseIdentifier: HomeTableHeaderCell.identifier)
		tableView.delegate = self
		tableView.dataSource = self
	}

	func setupViews() {
		[tableView].forEach {
			addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	func setupContraints() {
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
