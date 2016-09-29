//
//  YoutubeSubscriptionSubscriberSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The SubscriptionSubscriberSnippet model type for use with the Youtube API
open class YoutubeSubscriptionSubscriberSnippet: ObjectType {
	/// The title of the subscriber.
	open var title: String!
	/// The channel ID of the subscriber.
	open var channelId: String!
	/// Thumbnails for this subscriber.
	open var thumbnails: YoutubeThumbnailDetails!
	/// The description of the subscriber.
	open var description: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		title <- map["title"]
		channelId <- map["channelId"]
		thumbnails <- map["thumbnails"]
		description <- map["description"]
	}
}

