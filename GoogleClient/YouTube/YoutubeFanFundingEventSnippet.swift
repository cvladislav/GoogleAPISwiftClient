//
//  YoutubeFanFundingEventSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The FanFundingEventSnippet model type for use with the Youtube API
open class YoutubeFanFundingEventSnippet: ObjectType {
	/// Channel id where the funding event occurred.
	open var channelId: String!
	/// The text contents of the comment left by the user.
	open var commentText: String!
	/// The currency in which the fund was made. ISO 4217.
	open var currency: String!
	/// A rendered string that displays the fund amount and currency (e.g., "$1.00"). The string is rendered for the given language.
	open var displayString: String!
	/// Details about the supporter. Only filled if the event was made public by the user.
	open var supporterDetails: YoutubeChannelProfileDetails!
	/// The amount of funding in micros of fund_currency. e.g., 1 is represented
	open var amountMicros: UInt64!
	/// The date and time when the funding occurred. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var createdAt: Date!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelId <- map["channelId"]
		commentText <- map["commentText"]
		currency <- map["currency"]
		displayString <- map["displayString"]
		supporterDetails <- map["supporterDetails"]
		amountMicros <- map["amountMicros"]
		createdAt <- (map["createdAt"], RFC3339Transform())
	}
}

