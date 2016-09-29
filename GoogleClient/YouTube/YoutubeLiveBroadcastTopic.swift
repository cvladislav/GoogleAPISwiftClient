//
//  YoutubeLiveBroadcastTopic.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The type of the topic.
public enum YoutubeLiveBroadcastTopicType: String {
	/// 
	case VideoGame = "videoGame"
}

/// The LiveBroadcastTopic model type for use with the Youtube API
open class YoutubeLiveBroadcastTopic: ObjectType {
	/// Information about the topic matched.
	open var snippet: YoutubeLiveBroadcastTopicSnippet!
	/// If this flag is set it means that we have not been able to match the topic title and type provided to a known entity.
	open var unmatched: Bool!
	/// The type of the topic.
	open var type: YoutubeLiveBroadcastTopicType!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		snippet <- map["snippet"]
		unmatched <- map["unmatched"]
		type <- map["type"]
	}
}

