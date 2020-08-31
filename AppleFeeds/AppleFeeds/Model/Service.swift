//
//  Service.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/24/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import Foundation

// MARK: - Constants
let URL_SCHEME = "https"
let URL_DOMAIN = "rss.itunes.apple.com"
let URL_PATH = "/api/v1/us/ios-apps/top-free/all/50/explicit.json"
let BACK_UP_IMAGE_URL = "https://www.google.com/imgres?imgurl=http%3A%2F%2Fpngimg.com%2Fuploads%2Fmickey_mouse%2Fmickey_mouse_PNG20.png&imgrefurl=http%3A%2F%2Fpngimg.com%2Fimgs%2Fheroes%2Fmickey_mouse%2F&tbnid=naNzRjKcf3-iBM&vet=12ahUKEwjh-_v5g8TrAhUFLVMKHeYBBnEQMygAegUIARDPAQ..i&docid=eYAU6vbsekHgxM&w=1392&h=1600&q=mickey%20png&client=firefox-b-1-d&ved=2ahUKEwjh-_v5g8TrAhUFLVMKHeYBBnEQMygAegUIARDPAQ"

enum SortBy: String {
	case releaseDate
	case artist
}

struct Service {
	// MARK - Stored Properties
	let scheme: String?
	let domain: String?
	let path: String?
	let queryItems: [URLQueryItem]?
	let imageURL: URL?
	
	init(with url: String?){
		self.scheme = nil
		self.domain = nil
		self.path = nil
		self.queryItems = nil
		
		self.imageURL = URL(string: url ?? BACK_UP_IMAGE_URL)
	}
	
	init(scheme: String?,
		 domain: String?,
		 path: String?,
		 queryItems: [URLQueryItem]?) {
		self.scheme = scheme
		self.domain = domain
		self.path = path
		self.queryItems = queryItems
		self.imageURL = nil
	}
}

extension Service {
	var components: URL? {
		mutating get {
			var components: URLComponents = URLComponents()
			components.scheme = scheme
			components.host = domain
			components.path = path ?? ""
			components.queryItems = queryItems
			
			return components.url
		}
	}
}
