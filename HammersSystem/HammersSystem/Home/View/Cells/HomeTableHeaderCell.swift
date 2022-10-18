//
//  HomeTableHeaderCell.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeTableHeaderCell: UITableViewHeaderFooterView {

	// MARK: - Public properties

	static let identifier: String = "HomeTableHeaderCell"

	// MARK: - Private properties

	// MARK: - Init

	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		backgroundColor = .systemPink
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension HomeTableHeaderCell {

	func setupViews() {
//		[].forEach {
//			contentView.addSubview($0)
//			$0.translatesAutoresizingMaskIntoConstraints = false
//		}
	}

	func setupContraints() {
		NSLayoutConstraint.activate([
			
		])
	}
}
