//
//  HomeViewController.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

final class HomeViewController: UIViewController {

	let homeView: HomeViewProtocol

	init(homeView: HomeViewProtocol) {
		self.homeView = homeView
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupConstraints()
		homeView.fetch()
	}
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
	
}

private extension HomeViewController {

	func setupViews() {
		view.addSubview(homeView)
		homeView.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			homeView.topAnchor.constraint(equalTo: view.topAnchor),
			homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
}
