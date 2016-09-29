//
//  YoutubeChannelLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelLocalization model type for use with the Youtube API
open class YoutubeChannelLocalization: ObjectType {
	/// The localized strings for channel's title.
	open var title: String!
	/// The localized strings for channel's description.
	open var description: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

