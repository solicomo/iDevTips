//
//  ViewController.swift
//  ButtonGroup
//
//  Created by Soli on 2016-06-11.
//  Copyright © 2016 Soli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var buttonGroup = ButtonGroup()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		buttonGroup.addButton("Button One", image: nil, target: self, action: #selector(ViewController.buttonTapped(_:)))
		buttonGroup.addButton("Button Two", image: nil, target: self, action: #selector(ViewController.buttonTapped(_:)))
		buttonGroup.insertButton("Button Zero", image: nil, target: self, action: #selector(ViewController.buttonTapped(_:)), atIndex: 0)

		self.view.addSubview(buttonGroup)

		buttonGroup.translatesAutoresizingMaskIntoConstraints = false
		layoutButtonGroup()

	}

	override func viewWillLayoutSubviews() {
		layoutButtonGroup()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func buttonTapped(button: UIButton) {
		print("button tapped: \(button.currentTitle)")
	}

	func layoutButtonGroup() {
		struct Layout {
			static var inited = false
			static var vCenterYConstraint: NSLayoutConstraint?
			static var vTrailingConstraint: NSLayoutConstraint?
			static var hCenterXConstraint: NSLayoutConstraint?
			static var hBottomConstraint: NSLayoutConstraint?
		}


		if !Layout.inited {
			let margins = self.view.layoutMarginsGuide

			Layout.vCenterYConstraint  = buttonGroup.centerYAnchor.constraintEqualToAnchor(margins.centerYAnchor)
			Layout.vTrailingConstraint = buttonGroup.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -8)

			Layout.hCenterXConstraint  = buttonGroup.centerXAnchor.constraintEqualToAnchor(margins.centerXAnchor)
			Layout.hBottomConstraint   = buttonGroup.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor, constant: -8)

			Layout.inited = true
		}

		let isVerticalCompact = self.view.traitCollection.verticalSizeClass == .Compact

		buttonGroup.axis = isVerticalCompact ? .Vertical : .Horizontal

		// Vertical Compact
		Layout.vCenterYConstraint!.active = isVerticalCompact
		Layout.vTrailingConstraint!.active = isVerticalCompact

		// Vertical Not Compact
		Layout.hCenterXConstraint!.active = !isVerticalCompact
		Layout.hBottomConstraint!.active = !isVerticalCompact
	}

}

