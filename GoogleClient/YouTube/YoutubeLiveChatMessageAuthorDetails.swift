//
//  YoutubeLiveChatMessageAuthorDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatMessageAuthorDetails model type for use with the Youtube API
open class YoutubeLiveChatMessageAuthorDetails: ObjectType {
	/// The channel's URL.
	open var channelUrl: String!
	/// The YouTube channel ID.
	open var channelId: String!
	/// The channels's avatar URL.
	open var profileImageUrl: String!
	/// The channel's display name.
	open var displayName: String!
	/// Whether the author is the owner of the live chat.
	open var isChatOwner: Bool!
	/// Whether the author is a sponsor of the live chat.
	open var isChatSponsor: Bool!
	/// Whether the author's identity has been verified by YouTube.
	open var isVerified: Bool!
	/// Whether the author is a moderator of the live chat.
	open var isChatModerator: Bool!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelUrl <- map["channelUrl"]
		channelId <- map["channelId"]
		profileImageUrl <- map["profileImageUrl"]
		displayName <- map["displayName"]
		isChatOwner <- map["isChatOwner"]
		isChatSponsor <- map["isChatSponsor"]
		isVerified <- map["isVerified"]
		isChatModerator <- map["isChatModerator"]
	}
}

