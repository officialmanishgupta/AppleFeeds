//
//  FeedCollectionViewCell.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/29/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var feedAppImageView: UIImageView!
	@IBOutlet weak var applicationNameLabel: UILabel!
	@IBOutlet weak var applicationDeveloperNameLabel: UILabel!
	@IBOutlet weak var applicationLastUpdateLabel: UILabel!
	@IBOutlet weak var applicationDetailsStackView: UIStackView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
    }

}
