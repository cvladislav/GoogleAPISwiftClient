//
//  YoutubeLiveBroadcastTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveBroadcastTopicDetails model type for use with the Youtube API
open class YoutubeLiveBroadcastTopicDetails: ObjectType {
	open var topics: [YoutubeLiveBroadcastTopic]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		topics <- map["topics"]
	}
}

