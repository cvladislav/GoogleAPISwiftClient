//
//  YoutubeChannelTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelTopicDetails model type for use with the Youtube API
open class YoutubeChannelTopicDetails: ObjectType {
	/// A list of Freebase topic IDs associated with the channel. You can retrieve information about each topic using the Freebase Topic API.
	open var topicIds: [String]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		topicIds <- map["topicIds"]
	}
}

