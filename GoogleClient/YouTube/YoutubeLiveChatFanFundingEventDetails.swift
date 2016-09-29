//
//  YoutubeLiveChatFanFundingEventDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveChatFanFundingEventDetails model type for use with the Youtube API
open class YoutubeLiveChatFanFundingEventDetails: ObjectType {
	/// The currency in which the fund was made.
	open var currency: String!
	/// A rendered string that displays the fund amount and currency to the user.
	open var amountDisplayString: String!
	/// The comment added by the user to this fan funding event.
	open var userComment: String!
	/// The amount of the fund.
	open var amountMicros: UInt64!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		currency <- map["currency"]
		amountDisplayString <- map["amountDisplayString"]
		userComment <- map["userComment"]
		amountMicros <- map["amountMicros"]
	}
}

