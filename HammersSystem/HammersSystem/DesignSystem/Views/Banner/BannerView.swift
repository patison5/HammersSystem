//
//  BannerView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 05.02.2023.
//

import UIKit

final class BannerView: UIView {

	// MARK: - Constants

	private class Constants {
		static let height: CGFloat = 112
	}

	// MARK: - Private Properties

	private var images: [UIImage] = []

	private let tableView: UITableView = {
		let view = UITableView(frame: .zero, style: .plain)
		view.isScrollEnabled = false
		return view
	}()

	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupTable()
		setupViews()
		setupConstraints()
		backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(widh images: [UIImage]) {
		self.images = images
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource

extension BannerView: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: BannerViewTableCell.identifier, for: indexPath)
		cell.selectionStyle = .none
		cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)

		guard let customCell = cell as? BannerViewTableCell else {
			return UITableViewCell()
		}
		customCell.configure(with: images)
		return customCell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { Constants.height }
}

// MARK: - UITableViewDelegate

extension BannerView: UITableViewDelegate {}

// MARK: - Private Extension

private extension BannerView {

	func setupTable() {
		tableView.backgroundColor = .clear
		tableView.register(BannerViewTableCell.self, forCellReuseIdentifier: BannerViewTableCell.identifier)
		tableView.delegate = self
		tableView.dataSource = self
	}

	func setupViews() {
		[tableView].forEach {
			addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: topAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
