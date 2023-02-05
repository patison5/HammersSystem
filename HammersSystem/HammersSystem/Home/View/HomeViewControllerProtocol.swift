//
//  HomeViewControllerProtocol.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

/// Описание контроллера главного экрана
protocol HomeViewControllerProtocol: UIViewController {

	/// Вью главного экрана
	var homeView: HomeViewProtocol { get }
}
