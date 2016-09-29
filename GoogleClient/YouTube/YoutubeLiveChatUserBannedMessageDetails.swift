//
//  YoutubeLiveChatUserBannedMessageDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatUserBannedMessageDetails model type for use with the Youtube API
open class YoutubeLiveChatUserBannedMessageDetails: ObjectType {
	/// The details of the user that was banned.
	open var bannedUserDetails: YoutubeChannelProfileDetails!
	/// The type of ban.
	open var banType: YoutubeLiveChatUserBannedMessageDetailsBanType!
	/// The duration of the ban. This property is only present if the banType is temporary.
	open var banDurationSeconds: UInt64!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		bannedUserDetails <- map["bannedUserDetails"]
		banType <- map["banType"]
		banDurationSeconds <- map["banDurationSeconds"]
	}
}

/// The type of ban.
public enum YoutubeLiveChatUserBannedMessageDetailsBanType: String {
	/// 
	case Permanent = "permanent"
	/// 
	case Temporary = "temporary"
}

