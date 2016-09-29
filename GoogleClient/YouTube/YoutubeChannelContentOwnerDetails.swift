//
//  YoutubeChannelContentOwnerDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelContentOwnerDetails model type for use with the Youtube API
open class YoutubeChannelContentOwnerDetails: ObjectType {
	/// The date and time of when the channel was linked to the content owner. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var timeLinked: Date!
	/// The ID of the content owner linked to the channel.
	open var contentOwner: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		timeLinked <- (map["timeLinked"], RFC3339Transform())
		contentOwner <- map["contentOwner"]
	}
}

