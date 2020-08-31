//
//  ImageParser.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/30/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import Foundation
import UIKit

struct ImageParser {
	static func parse(imageURL url: String?,
					  completionHandler: @escaping ((UIImage?) -> Void)) {
		Request(service: Service(with: url)).dataFromURL {(data, error) in
			if let data = data {
				completionHandler(UIImage(data: data))
			}
		}
	}
}
