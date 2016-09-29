//
//  YoutubeLiveChatTextMessageDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatTextMessageDetails model type for use with the Youtube API
open class YoutubeLiveChatTextMessageDetails: ObjectType {
	/// The user's message.
	open var messageText: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		messageText <- map["messageText"]
	}
}

