//
//  BannerViewCollectionCell.swift
//  HammersSystem
//
//  Created by Fedor Penin on 05.02.2023.
//

import UIKit

final class BannerViewCollectionCell: UICollectionViewCell {

	// MARK: - Public Properties

	static let identifier = "BannerViewCollectionCell"

	// MARK: - Private Properties

	private let imageView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "imagePreview")
		view.layer.cornerRadius = 10
		view.layer.maskedCorners = [
			.layerMaxXMaxYCorner,
			.layerMaxXMinYCorner,
			.layerMinXMaxYCorner,
			.layerMinXMinYCorner
		]
		view.contentMode = .scaleAspectFit
		return view
	}()

	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupViews()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with image: UIImage) {
		imageView.image = image
	}
}

private extension BannerViewCollectionCell {

	func setupViews() {
		[imageView].forEach {
			contentView.addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
