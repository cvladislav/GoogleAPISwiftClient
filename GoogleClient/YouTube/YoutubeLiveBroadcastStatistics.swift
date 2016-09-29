//
//  YoutubeLiveBroadcastStatistics.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveBroadcastStatistics model type for use with the Youtube API
open class YoutubeLiveBroadcastStatistics: ObjectType {
	/// The total number of live chat messages currently on the broadcast. The property and its value will be present if the broadcast is public, has the live chat feature enabled, and has at least one message. Note that this field will not be filled after the broadcast ends. So this property would not identify the number of chat messages for an archived video of a completed live broadcast.
	open var totalChatCount: UInt64!
	/// The number of viewers currently watching the broadcast. The property and its value will be present if the broadcast has current viewers and the broadcast owner has not hidden the viewcount for the video. Note that YouTube stops tracking the number of concurrent viewers for a broadcast when the broadcast ends. So, this property would not identify the number of viewers watching an archived video of a live broadcast that already ended.
	open var concurrentViewers: UInt64!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		totalChatCount <- map["totalChatCount"]
		concurrentViewers <- map["concurrentViewers"]
	}
}

