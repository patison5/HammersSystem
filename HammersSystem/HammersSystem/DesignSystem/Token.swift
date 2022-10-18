//
//  Token.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

public enum Token: String {
	case greyDark
	case greyLight
	case greyLight2
	case redDark
	case redLight
	case redLight20
	case background
	case white
}

public extension Token {
	var color: UIColor {
		guard let color = UIColor(named: rawValue) else {
			print("❌ Цвет \(rawValue) не найден. Использую цвет по умолчанию .black")
			return .black
		}
		return color
	}

	/// Динамический цвет CoreGraphics
	var cgColor: CGColor { color.cgColor }
}
