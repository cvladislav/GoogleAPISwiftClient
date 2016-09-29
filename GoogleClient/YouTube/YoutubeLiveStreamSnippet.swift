//
//  YoutubeLiveStreamSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveStreamSnippet model type for use with the Youtube API
open class YoutubeLiveStreamSnippet: ObjectType {
	/// The stream's title. The value must be between 1 and 128 characters long.
	open var title: String!
	/// The ID that YouTube uses to uniquely identify the channel that is transmitting the stream.
	open var channelId: String!
	/// The date and time that the stream was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var publishedAt: Date!
	open var isDefaultStream: Bool!
	/// The stream's description. The value cannot be longer than 10000 characters.
	open var description: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		title <- map["title"]
		channelId <- map["channelId"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		isDefaultStream <- map["isDefaultStream"]
		description <- map["description"]
	}
}

