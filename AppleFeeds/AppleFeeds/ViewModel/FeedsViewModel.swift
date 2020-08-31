//
//  FeedsViewModel.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/28/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import Foundation
import UIKit

class FeedsViewModel {
	
	var arrayArtists: Array<Artist> = []
	static var singleInstance: FeedsViewModel = FeedsViewModel()
	
	private init() {}
	
	func artists(completionHandler: @escaping((Array<Artist>?) -> Void)) {
		ArtistParser.parse { (array) in
			completionHandler(array)
		}
	}
	
	func image(url: String,
			   completionHandler: @escaping(UIImage?) -> Void) {
		ImageParser.parse(imageURL: url) { (image) in
			completionHandler(image)
		}
	}
	
}
