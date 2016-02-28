//
//  YoutubeChannelTopicDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 2/27/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelTopicDetails: ObjectType {
	/// A list of Freebase topic IDs associated with the channel. You can retrieve information about each topic using the Freebase Topic API.
	public var topicIds: [String]!
	
	public required init?(_ map: Map) {

	}

	public func mapping(map: Map) {
		topicIds <- map["topicIds"]
	}
}

