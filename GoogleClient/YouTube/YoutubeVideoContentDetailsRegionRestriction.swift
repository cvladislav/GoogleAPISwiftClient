//
//  YoutubeVideoContentDetailsRegionRestriction.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoContentDetailsRegionRestriction model type for use with the Youtube API
open class YoutubeVideoContentDetailsRegionRestriction: ObjectType {
	/// A list of region codes that identify countries where the video is blocked. If this property is present and a country is not listed in its value, then the video is viewable in that country. If this property is present and contains an empty list, the video is viewable in all countries.
	open var blocked: [String]!
	/// A list of region codes that identify countries where the video is viewable. If this property is present and a country is not listed in its value, then the video is blocked from appearing in that country. If this property is present and contains an empty list, the video is blocked in all countries.
	open var allowed: [String]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		blocked <- map["blocked"]
		allowed <- map["allowed"]
	}
}

