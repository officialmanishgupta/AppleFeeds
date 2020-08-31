//
//  Request.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/27/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import Foundation

enum URLType: String {
	case mainURL
	case imageURL
}

class Request {
	// MARK: - Properties
	var service: Service?
	var defaultURLType: URLType {
		if service?.imageURL != nil  {
			return .imageURL
		}
		return .mainURL
	}
	var url: URL? {
		get {
			switch defaultURLType {
			case .mainURL:
				return service?.components
			case .imageURL:
				return service?.imageURL
			}
		}
	}
	
	// MARK: - Init
	init(service: Service?) {
		self.service = service
	}
	
	// MARK: - Request Method
	func dataFromURL(with completion: @escaping((Data?, Error?) -> Void)) -> Void {
		if let url = self.url {
			let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
				if let data = data {
					completion(data, nil)
				} else if let error = error {
					completion(nil,error)
				}
			}
			task.resume()
		}
	}
}

extension URL {
	var urlType: URLType {
		return absoluteString.contains(".png") ?
			.imageURL :
			.mainURL
	}
}
