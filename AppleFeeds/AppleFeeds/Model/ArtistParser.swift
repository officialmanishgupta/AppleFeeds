//
//  ArtistParser.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/30/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import Foundation

struct ArtistParser {

	static var arrayArtists: Array<Artist> = []
	static func parse(artist completionHandler: @escaping (Array<Artist>) -> Void) {
		
		// TODO: Use JSONDecoder instead
		Request(service: Service(scheme: URL_SCHEME,
								 domain: URL_DOMAIN,
								 path: URL_PATH,
								 queryItems: nil)).dataFromURL { (data, error) in
									if let data = data {
										do  {
											if let jsonResults = try JSONSerialization
												.jsonObject(with: data, options:.allowFragments)
												as? NSDictionary, let json = (jsonResults["feed"] as? NSDictionary)?.value(forKey: "results") as? Array<NSDictionary> {
												for eachArtist in json {
													let artist: Artist = Artist(artistName: eachArtist.value(forKey: "artistName") as? String ?? "", artistUrl: eachArtist.value(forKey: "artistUrl") as? String ?? "", artworkUrl100: eachArtist.value(forKey: "artworkUrl100") as? String ?? "",name: eachArtist.value(forKey: "name") as? String ?? "", releaseDate: eachArtist.value(forKey: "releaseDate") as? String ?? "")
													ArtistParser.arrayArtists.append(artist)
												}
												completionHandler(self.arrayArtists)
											}
										} catch {
											print("Exception Occurred")
										}
									}
		}
	}
}
