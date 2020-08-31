//
//  ArtistModel.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/26/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import Foundation
/**
{
    artistId = 1450802200;
    artistName = "NEOCORTEXT, INC.";
    artistUrl = "https://apps.apple.com/us/developer/neocortext-inc/id1450802200";
    artworkUrl100 = "https://is2-ssl.mzstatic.com/image/thumb/Purple114/v4/df/4b/44/df4b445c-9f2e-b5ef-c9e1-29f82f510b57/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/200x200bb.png";
    copyright = "\U00a9 2020, NEOCORTEXT INC.";
    genres =     (
                {
            genreId = 6016;
            name = Entertainment;
            url = "https://itunes.apple.com/us/genre/id6016";
        },
                {
            genreId = 6008;
            name = "Photo & Video";
            url = "https://itunes.apple.com/us/genre/id6008";
        }
    );
    id = 1488782587;
    kind = iosSoftware;
    name = "REFACE: face swap videos";
    releaseDate = "2019-12-23";
    url = "https://apps.apple.com/us/app/reface-face-swap-videos/id1488782587";
}

*/

struct Artist: Codable {
	let artistName: String
	let artistUrl: String
	let artworkUrl100: String
	let name: String
	let releaseDate: String

	enum CodingKeys: String, CodingKey {
		typealias RawValue = String

		case artistName,
			 artistUrl,
			 artworkUrl100,
			 name,
			 releaseDate
	}
}
