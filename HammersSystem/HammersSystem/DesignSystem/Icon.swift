//
//  Icon.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

public enum Icon: String {
	case iconArrowDown
	case iconBucket
	case iconBurger
	case iconMarker
	case iconPerson
}

public extension Icon {
	var image: UIImage? {
		UIImage(named: rawValue)
	}
}
