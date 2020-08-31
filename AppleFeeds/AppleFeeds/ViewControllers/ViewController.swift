//
//  ViewController.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/24/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var displayFeeds: UIButton!
	
	// MARK: Lifecycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let identifier = segue.identifier {
			switch identifier {
			case "Apple Feeds":
				let vc = segue.destination as? FeedCollectionViewController
				// this changes the way vc is presented
				vc?.modalPresentationStyle = .fullScreen
				// this shows the animation while transition is happening
				vc?.modalTransitionStyle =
					// new vc fades over the current vc
					.crossDissolve
			default:
				break
			}
		}
	}
	
}

