//
//  YoutubeChannelSectionTargeting.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSectionTargeting model type for use with the Youtube API
open class YoutubeChannelSectionTargeting: ObjectType {
	/// The country the channel section is targeting.
	open var countries: [String]!
	/// The language the channel section is targeting.
	open var languages: [String]!
	/// The region the channel section is targeting.
	open var regions: [String]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		countries <- map["countries"]
		languages <- map["languages"]
		regions <- map["regions"]
	}
}

