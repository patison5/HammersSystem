//
//  HomeView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeView: UIView {

	// MARK: - Public properties

	var data: [MenuModel] = []

	let interactor: HomeInteractorProtocol

	// MARK: - Private properties

	private class Constants {
		static let headerHeight: CGFloat = 280
	}

	private let tableView: UITableView = {
		let table = UITableView(frame: .zero, style: .plain)
		table.backgroundColor = .clear
		return table
	}()

	private let bottomSheetView = UIView()

	private var bottomSheetTopConstraint = NSLayoutConstraint()

	private let headerView: HomeHeaderView = {
		let view = HomeHeaderView()
		return view
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

	override func layoutSubviews() {
		super.layoutSubviews()
		bottomSheetTopConstraint.constant = -tableView.contentOffset.y - 24
	}
}

// MARK: - HomeViewProtocol

extension HomeView: HomeViewProtocol {

	func fetch() {
		interactor.fetch()
	}

	func update(with model: HomeViewModel) {
		headerView.configure(with: model.headerModel)
		data = model.items
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
}

// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		bottomSheetTopConstraint.constant = -scrollView.contentOffset.y - 24
	}
}

// MARK: - Private methods

private extension HomeView {

	func setupTable() {
		tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
		tableView.delegate = self
		tableView.dataSource = self

		tableView.contentInset = UIEdgeInsets(top: Constants.headerHeight, left: 0, bottom: safeAreaInsets.bottom, right: 0)
		tableView.contentOffset = .init(x: 0, y: -Constants.headerHeight)
	}

	func setupViews() {
		bottomSheetView.backgroundColor = .white
		bottomSheetView.layer.cornerRadius = 16
		bottomSheetView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		[bottomSheetView, tableView, headerView].forEach {
			addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	func setupContraints() {
		bottomSheetTopConstraint = bottomSheetView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
		
		NSLayoutConstraint.activate([
			headerView.topAnchor.constraint(equalTo: topAnchor),
			headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			headerView.trailingAnchor.constraint(equalTo: trailingAnchor),

			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			bottomSheetTopConstraint,
			bottomSheetView.leadingAnchor.constraint(equalTo: leadingAnchor),
			bottomSheetView.trailingAnchor.constraint(equalTo: trailingAnchor),
			bottomSheetView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
