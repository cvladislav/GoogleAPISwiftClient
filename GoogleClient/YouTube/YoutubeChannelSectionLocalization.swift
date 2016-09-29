//
//  YoutubeChannelSectionLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSectionLocalization model type for use with the Youtube API
open class YoutubeChannelSectionLocalization: ObjectType {
	/// The localized strings for channel section's title.
	open var title: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		title <- map["title"]
	}
}

