//
//  YoutubeLiveBroadcastTopicSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveBroadcastTopicSnippet model type for use with the Youtube API
open class YoutubeLiveBroadcastTopicSnippet: ObjectType {
	/// The date at which the topic was released. Filled for types: videoGame
	open var releaseDate: String!
	/// The name of the topic.
	open var name: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		releaseDate <- map["releaseDate"]
		name <- map["name"]
	}
}

