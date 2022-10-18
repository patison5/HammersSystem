//
//  ActionButton.swift
//  HammersSystem
//
//  Created by Fedor Penin on 18.10.2022.
//

import UIKit

class ActionButton: UIButton {
	var touchUpInside: ((_ button: UIButton) -> ())?

	required init?(coder aDecoder: NSCoder) { fatalError("init(coder:)") }
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButton()
	}

	func setupButton() {
		addTarget(self, action: #selector(customAction), for: .touchUpInside)
	}

	@objc private func customAction(sender: UIButton) {
		touchUpInside?(sender)
	}
}
