//
//  CategoriesView.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class CategoriesView: UIView {

	// MARK: - Private properties

	class Constants {
		static let margin: CGFloat = 8
	}

	private let stackView: UIStackView = {
		let view = UIStackView()
		view.distribution = .fillEqually
		view.axis = .horizontal
		view.spacing = 8
		view.alignment = .fill
		return view
	}()

	private let horisontalScrollView: UIScrollView = {
		let view = UIScrollView()
		view.showsHorizontalScrollIndicator = false
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

	func configure(with model: [CategoryModel]) {
		model.forEach {
			let button = buttonView
			button.setTitle($0.title, for: .normal)
			stackView.addArrangedSubview(button)
			if $0.isSelected {
				button.setTitleColor(Token.redDark.color, for: .normal)
				button.layer.borderColor = Token.redLight20.cgColor
				button.backgroundColor = Token.redLight20.color
				button.titleLabel?.font = .boldSystemFont(ofSize: 13)
			}
		}
	}
}

extension CategoriesView {

	var buttonView: ActionButton {
		let view = ActionButton()
		view.backgroundColor = .none
		view.setTitle("test", for: .normal)
		view.contentEdgeInsets = UIEdgeInsets(top: 8, left: 23, bottom: 8, right: 23)
		view.titleLabel?.font = .systemFont(ofSize: 13)
		view.setTitleColor(Token.redLight.color, for: .normal)
		view.layer.borderWidth = 1
		view.layer.borderColor = Token.redLight.cgColor
		view.layer.cornerRadius = 32/2
		return view
	}

	func setupViews() {
		addSubview(horisontalScrollView)
		horisontalScrollView.translatesAutoresizingMaskIntoConstraints = false

		horisontalScrollView.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
	}

	func setupContraints() {
		NSLayoutConstraint.activate([
			horisontalScrollView.topAnchor.constraint(equalTo: topAnchor),
			horisontalScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
			horisontalScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
			horisontalScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
			horisontalScrollView.heightAnchor.constraint(equalToConstant: 32),

			stackView.topAnchor.constraint(equalTo: horisontalScrollView.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: horisontalScrollView.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: horisontalScrollView.trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: horisontalScrollView.bottomAnchor),
		])
	}
}
