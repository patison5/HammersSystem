//
//  HomeHeaderView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeHeaderView: UIView {

	// MARK: - Constants

	private class Constants {
		static let townSelectFontSize: CGFloat = 17.0
		static let sectionsMargin: CGFloat = 24.0
		static let leadingTownSelectionButtonMargin: CGFloat = 16.0
		static let bannerHeight: CGFloat = 112.0
	}

	// MARK: - Public Properties

	var categorySelectedAction: ((CategoryModel) -> Void)?

	// MARK: - Private properties

	private let categoriesView = CategoriesView()
	private let bannerView = BannerView()
	private var bannerViewHeightConstraint: NSLayoutConstraint?
	private var bannerViewTopOffsetConstraint: NSLayoutConstraint?

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
		backgroundColor = Token.background.color
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Public methods

	func configure(with model: HeaderModel) {
		townSelectBottonView.setTitle(model.currentTown, for: .normal)
		categoriesView.configure(with: model.categories)
		bannerView.configure(widh: model.bannerImages)

		categoriesView.categorySelectedAction = { [weak self] categoryModel in
			self?.categorySelectedAction?(categoryModel)
		}
	}

	func scrollViewDidScroll(offset: CGFloat) {
		let value = max(0, min(-offset-112, 112))
		let marginValue = max(0, min(-offset-112+24, 24))
		bannerViewHeightConstraint?.constant = value
		bannerViewTopOffsetConstraint?.constant = marginValue
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
			townSelectBottonView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
			townSelectBottonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingTownSelectionButtonMargin),

			bannerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			bannerView.trailingAnchor.constraint(equalTo: trailingAnchor),

			categoriesView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: Constants.sectionsMargin),
			categoriesView.leadingAnchor.constraint(equalTo: leadingAnchor),
			categoriesView.trailingAnchor.constraint(equalTo: trailingAnchor),
			categoriesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.sectionsMargin)
		])

		bannerViewTopOffsetConstraint = bannerView.topAnchor.constraint(
			equalTo: townSelectBottonView.bottomAnchor,
			constant: Constants.sectionsMargin
		)
		bannerViewTopOffsetConstraint?.isActive = true
		bannerViewHeightConstraint = bannerView.heightAnchor.constraint(equalToConstant: 0)
		bannerViewHeightConstraint?.isActive = true
	}
	
	func showBannerView() {
		UIView.animate(withDuration: 0.25) {
			self.bannerViewHeightConstraint?.constant = Constants.bannerHeight
			self.bannerViewTopOffsetConstraint?.constant = Constants.sectionsMargin
		}
	}

	func hideBannerView() {
		UIView.animate(withDuration: 0.25) {
			self.bannerViewHeightConstraint?.constant = 0
			self.bannerViewTopOffsetConstraint?.constant = 0
		}
	}
}
