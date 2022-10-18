//
//  BannerView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class BannerView: UIView {

	// MARK: - Private properties

	private let tableView: UITableView = {
		let view = UITableView()
		view.backgroundColor = .red
		return view
	}()

	// MARK: - Init

	init() {
		super.init(frame: .zero)
		backgroundColor = .cyan
		setupViews()
		setupContraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension BannerView {

	func setupViews() {
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
	}

	func setupContraints() {
		NSLayoutConstraint.activate([
			tableView.heightAnchor.constraint(equalTo: heightAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.heightAnchor.constraint(equalTo: heightAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
			tableView.heightAnchor.constraint(equalToConstant: 112)
		])
	}
}
