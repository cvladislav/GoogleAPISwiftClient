//
//  YoutubeLiveChatModeratorSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatModeratorSnippet model type for use with the Youtube API
open class YoutubeLiveChatModeratorSnippet: ObjectType {
	/// Details about the moderator.
	open var moderatorDetails: YoutubeChannelProfileDetails!
	/// The ID of the live chat this moderator can act on.
	open var liveChatId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		moderatorDetails <- map["moderatorDetails"]
		liveChatId <- map["liveChatId"]
	}
}

