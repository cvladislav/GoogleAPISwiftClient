//
//  YoutubeLiveChatBan.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatBan model type for use with the Youtube API
open class YoutubeLiveChatBan: GoogleObject {
	/// The snippet object contains basic details about the ban.
	open var snippet: YoutubeLiveChatBanSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube assigns to uniquely identify the ban.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatBan".
	open var kind: String = "youtube#liveChatBan"
	
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

