//
//  YoutubeLiveChatModerator.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatModerator model type for use with the Youtube API
open class YoutubeLiveChatModerator: GoogleObject {
	/// The snippet object contains basic details about the moderator.
	open var snippet: YoutubeLiveChatModeratorSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube assigns to uniquely identify the moderator.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatModerator".
	open var kind: String = "youtube#liveChatModerator"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

