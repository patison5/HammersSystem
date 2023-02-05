//
//  BannerViewTableCell.swift
//  HammersSystem
//
//  Created by Fedor Penin on 05.02.2023.
//

import UIKit

final class BannerViewTableCell: UITableViewCell {

	// MARK: - Public Properties

	static let identifier = "BannerViewTableCell"

	// MARK: - Private Properties

	private var images: [UIImage] = []

	private let collectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
		layout.itemSize = CGSize(width: 300, height: 112)
		layout.scrollDirection = .horizontal
		let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.showsHorizontalScrollIndicator = false
		view.backgroundColor = .clear
		return view
	}()

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCollectionView()
		setupViews()
		setupConstraints()
		backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with images: [UIImage]) {
		self.images = images
		collectionView.reloadData()
	}
}

extension BannerViewTableCell: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { images.count }

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerViewCollectionCell.identifier, for: indexPath)
		guard let customCell = cell as? BannerViewCollectionCell else {
			return UICollectionViewCell()
		}
		customCell.configure(with: images[indexPath.item])
		return customCell
	}
}

// MARK: - UICollectionViewDelegate

extension BannerViewTableCell: UICollectionViewDelegate {}

// MARK: - Private Methods

private extension BannerViewTableCell {

	func setupCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(BannerViewCollectionCell.self, forCellWithReuseIdentifier: BannerViewCollectionCell.identifier)
	}

	func setupViews() {
		[collectionView].forEach {
			contentView.addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
