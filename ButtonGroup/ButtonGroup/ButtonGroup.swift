//
//  ButtonGroup.swift
//  ButtonGroup
//
//  Created by Soli on 2016-06-11.
//  Copyright © 2016 Soli. All rights reserved.
//

import UIKit

class ButtonGroup: UIView {

	// MARK: - Properties

	var axis: UILayoutConstraintAxis {
		get {
			return group.axis
		}
		set {
			group.axis = newValue
		}
	}

	var group = UIStackView()

	// MARK: - Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.backgroundColor = UIColor.blackColor()
		self.alpha = 0.8
		self.layer.borderColor = UIColor.whiteColor().CGColor
		self.layer.borderWidth = 0.5
		self.layer.cornerRadius = 5.0
		self.clipsToBounds = true
		self.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

		self.addSubview(group)

		self.axis = .Horizontal

		group.distribution = .FillEqually
		group.alignment = .Fill

		let margins = self.layoutMarginsGuide

		group.translatesAutoresizingMaskIntoConstraints = false
		group.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true
		group.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
		group.topAnchor.constraintEqualToAnchor(margins.topAnchor).active = true
		group.bottomAnchor.constraintEqualToAnchor(margins.bottomAnchor).active = true
	}

	convenience init() {
		self.init(frame: CGRectZero)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: - Functions

	private func createButton(title: String?, image: UIImage?, target: AnyObject?, action: Selector) -> UIButton {
		let btn = UIButton(type: .Custom)

		if let t = title {
			btn.setTitle(t, forState: .Normal)
			btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		} else if let photo = image {
			btn.setImage(photo, forState: .Normal)
		}

		btn.layer.borderColor = UIColor.whiteColor().CGColor
		btn.layer.borderWidth = 0.25
		btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

		btn.addTarget(target, action: action, forControlEvents: .TouchDown)

		return btn
	}

	func addButton(title: String?, image: UIImage?, target: AnyObject?, action: Selector) {
		let btn = createButton(title, image: image, target: target, action: action)
		group.addArrangedSubview(btn)
	}

	func insertButton(title: String?, image: UIImage?, target: AnyObject?, action: Selector, atIndex index: Int) {
		let btn = createButton(title, image: image, target: target, action: action)
		group.insertArrangedSubview(btn, atIndex: index)
	}

}
