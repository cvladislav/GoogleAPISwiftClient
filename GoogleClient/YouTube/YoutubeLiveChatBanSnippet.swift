//
//  YoutubeLiveChatBanSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The type of ban.
public enum YoutubeLiveChatBanSnippetType: String {
	/// 
	case Permanent = "permanent"
	/// 
	case Temporary = "temporary"
}

/// The LiveChatBanSnippet model type for use with the Youtube API
open class YoutubeLiveChatBanSnippet: ObjectType {
	/// The duration of a ban, only filled if the ban has type TEMPORARY.
	open var banDurationSeconds: UInt64!
	/// The chat this ban is pertinent to.
	open var liveChatId: String!
	open var bannedUserDetails: YoutubeChannelProfileDetails!
	/// The type of ban.
	open var type: YoutubeLiveChatBanSnippetType!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		banDurationSeconds <- map["banDurationSeconds"]
		liveChatId <- map["liveChatId"]
		bannedUserDetails <- map["bannedUserDetails"]
		type <- map["type"]
	}
}

