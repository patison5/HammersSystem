//
//  MenuCell.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class MenuCell: UITableViewCell {

	// MARK: - Public properties

	static let identifier = "MenuCell"

	// MARK: - Private properties

	class Constants {
		static let topMargin: CGFloat = 16.0
		static let leftMargin: CGFloat = 16.0
		static let rightMargin: CGFloat = 24.0
		static let bottomMargin: CGFloat = 16.0
		static let imageRightMargin: CGFloat = 32.0
		static let imageWidth: CGFloat = 132.0
		static let imageHeight: CGFloat = 132.0
		static let descriptionTopMargin: CGFloat = 8.0
		static let descriptionBottomMargin: CGFloat = 16.0
		
		static let titleFontSize: CGFloat = 17.0
		static let descriptionFontSize: CGFloat = 13.0
		static let buttonFontSize: CGFloat = 13.0
	}

	private let imgView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleAspectFill
		return view
	}()

	private let titleView: UILabel = {
		let view = UILabel()
		view.font = UIFont.systemFont(ofSize: Constants.titleFontSize)
		view.textColor = Token.greyDark.color
		return view
	}()

	private let descriptionView: UILabel = {
		let view = UILabel()
		view.numberOfLines = 0
		view.textColor = Token.greyLight.color
		view.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
		return view
	}()

	private let buttonView: UIButton = {
		var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
		backgroundConfig.backgroundColor = .clear
		var configuration = UIButton.Configuration.plain()
		configuration.contentInsets = .init(
			top: 8,
			leading: 18,
			bottom: 8,
			trailing: 18
		)
		configuration.background = backgroundConfig
		configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: Constants.buttonFontSize)
			return outgoing
		}
		let view = UIButton(configuration: configuration)
		view.setTitleColor(Token.redDark.color, for: .normal)
		view.backgroundColor = .clear
		view.layer.cornerRadius = 5
		view.layer.borderWidth = 1
		view.layer.borderColor = Token.redDark.cgColor
		return view
	}()

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Public methods

	func configure(with model: MenuModel) {
		titleView.text = model.title
		descriptionView.text = model.description
		imgView.image = model.image
		let price = "от \(model.price) р"
		buttonView.setTitle(price, for: .normal)
	}
}


private extension MenuCell {

	func setupViews() {
		[imgView, titleView, descriptionView, buttonView].forEach {
			contentView.addSubview($0)
			$0.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topMargin),
			imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leftMargin),
			imgView.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
			imgView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
			imgView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.bottomMargin),

			titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topMargin),
			titleView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Constants.imageRightMargin),
			titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.rightMargin),

			descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: Constants.descriptionTopMargin),
			descriptionView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Constants.imageRightMargin),
			descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.rightMargin),

			buttonView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: Constants.descriptionBottomMargin),
			buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.rightMargin),
			buttonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.bottomMargin)
		])
	}
}
