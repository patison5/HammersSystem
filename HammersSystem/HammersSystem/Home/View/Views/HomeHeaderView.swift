//
//  HomeHeaderView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeHeaderView: UIView {

	// MARK: - Public properties

	// MARK: - Private properties

	class Constants {
		static let townSelectFontSize: CGFloat = 17.0
		static let sectionsMargin: CGFloat = 24.0
	}

	private let categoriesView = CategoriesView()
	private let bannerView = BannerView()

	private let stackView: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.alignment = .leading
		view.distribution = .fill
		return view
	}()

	private let townSelectBottonView: UIButton = {
		var configuration = UIButton.Configuration.plain()
		configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: Constants.townSelectFontSize)
			return outgoing
		}
		configuration.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
		configuration.image = Icon.iconArrowDown.image
		configuration.imagePadding = 5
		configuration.imagePlacement = .trailing
		let view = UIButton(configuration: configuration)
		view.setTitleColor(.black, for: .normal)
		return view
	}()

	// MARK: - Init

	init() {
		super.init(frame: .zero)
		setupViews()
		setupContraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Public methods

	func configure(with model: HeaderModel) {
		townSelectBottonView.setTitle(model.currentTown, for: .normal)
		categoriesView.configure(with: model.categories)
	}
}

private extension HomeHeaderView {

	func setupViews() {
		[townSelectBottonView, bannerView, categoriesView].forEach {
			addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	func setupContraints() {
		NSLayoutConstraint.activate([
			townSelectBottonView.topAnchor.constraint(equalTo: topAnchor),
			townSelectBottonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

			bannerView.topAnchor.constraint(equalTo: townSelectBottonView.bottomAnchor, constant: Constants.sectionsMargin),
			bannerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			bannerView.trailingAnchor.constraint(equalTo: trailingAnchor),

			categoriesView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: Constants.sectionsMargin),
			categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor),
			categoriesView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
