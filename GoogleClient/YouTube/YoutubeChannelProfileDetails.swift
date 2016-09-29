//
//  YoutubeChannelProfileDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelProfileDetails model type for use with the Youtube API
open class YoutubeChannelProfileDetails: ObjectType {
	/// The channel's URL.
	open var channelUrl: String!
	/// The channels's avatar URL.
	open var profileImageUrl: String!
	/// The YouTube channel ID.
	open var channelId: String!
	/// The channel's display name.
	open var displayName: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelUrl <- map["channelUrl"]
		profileImageUrl <- map["profileImageUrl"]
		channelId <- map["channelId"]
		displayName <- map["displayName"]
	}
}

