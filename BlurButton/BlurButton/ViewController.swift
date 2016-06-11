//
//  ViewController.swift
//  BlurButton
//
//  Created by Soli on 2016-06-11.
//  Copyright © 2016 Soli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Properties

	var bgImage: UIImage?
	@IBOutlet weak var normalButton: UIButton!
	@IBOutlet weak var blurButton: UIButton!
	@IBOutlet weak var clearBGButton: UIButton!
	@IBOutlet weak var opaqueButton: UIButton!
	@IBOutlet weak var roundButton: UIButton!

	// MARK: - UI

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	// MARK: - Actions

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		// Normal Button

		// Blur Button
		let blur = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
		blur.frame = blurButton.bounds
		blur.userInteractionEnabled = false //This allows touches to forward to the button.

		blurButton.insertSubview(blur, atIndex: 0)
		blurButton.alpha = 0.8

		// Clear Background Button
		clearBGButton.backgroundColor = UIColor.clearColor()

		// Opaque Button
		opaqueButton.backgroundColor = UIColor.blackColor()
		opaqueButton.alpha = 0.8
		opaqueButton.opaque = true

		// Round Button
		roundButton.backgroundColor = UIColor.blackColor()
		roundButton.alpha = 0.8
		roundButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		roundButton.layer.borderColor = UIColor.whiteColor().CGColor
		roundButton.layer.borderWidth = 0.5
		roundButton.layer.cornerRadius = 5.0
		roundButton.clipsToBounds = true

	}

	override func viewWillLayoutSubviews() {
		// background
		setBackgroundImage()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Functions

	func setBackgroundImage() {
		UIGraphicsBeginImageContext(self.view.frame.size)
		UIImage(named: "background")?.drawInRect(self.view.bounds)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		bgImage = image

		self.view.backgroundColor = UIColor(patternImage: bgImage!)
	}

}

