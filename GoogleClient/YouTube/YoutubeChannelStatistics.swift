//
//  YoutubeChannelStatistics.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelStatistics model type for use with the Youtube API
open class YoutubeChannelStatistics: ObjectType {
	/// The number of subscribers that the channel has.
	open var subscriberCount: UInt64!
	/// The number of times the channel has been viewed.
	open var viewCount: UInt64!
	/// Whether or not the number of subscribers is shown for this user.
	open var hiddenSubscriberCount: Bool!
	/// The number of videos uploaded to the channel.
	open var videoCount: UInt64!
	/// The number of comments for the channel.
	open var commentCount: UInt64!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		subscriberCount <- map["subscriberCount"]
		viewCount <- map["viewCount"]
		hiddenSubscriberCount <- map["hiddenSubscriberCount"]
		videoCount <- map["videoCount"]
		commentCount <- map["commentCount"]
	}
}

