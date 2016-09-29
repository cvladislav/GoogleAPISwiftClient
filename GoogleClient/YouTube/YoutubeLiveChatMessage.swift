//
//  YoutubeLiveChatMessage.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatMessage model type for use with the Youtube API
open class YoutubeLiveChatMessage: GoogleObject {
	/// The snippet object contains basic details about the message.
	open var snippet: YoutubeLiveChatMessageSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube assigns to uniquely identify the message.
	open var id: String!
	/// The authorDetails object contains basic details about the user that posted this message.
	open var authorDetails: YoutubeLiveChatMessageAuthorDetails!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatMessage".
	open var kind: String = "youtube#liveChatMessage"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		authorDetails <- map["authorDetails"]
		kind <- map["kind"]
	}
}

