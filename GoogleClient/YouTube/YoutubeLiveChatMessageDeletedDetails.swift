//
//  YoutubeLiveChatMessageDeletedDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatMessageDeletedDetails model type for use with the Youtube API
open class YoutubeLiveChatMessageDeletedDetails: ObjectType {
	open var deletedMessageId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		deletedMessageId <- map["deletedMessageId"]
	}
}

