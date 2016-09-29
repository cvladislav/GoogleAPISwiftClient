//
//  YoutubeLiveBroadcast.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveBroadcast model type for use with the Youtube API
open class YoutubeLiveBroadcast: GoogleObject {
	/// The statistics object contains info about the event's current stats. These include concurrent viewers and total chat count. Statistics can change (in either direction) during the lifetime of an event. Statistics are only returned while the event is live.
	open var statistics: YoutubeLiveBroadcastStatistics!
	open var topicDetails: YoutubeLiveBroadcastTopicDetails!
	/// The ID that YouTube assigns to uniquely identify the broadcast.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveBroadcast".
	open var kind: String = "youtube#liveBroadcast"
	/// The contentDetails object contains information about the event's video content, such as whether the content can be shown in an embedded video player or if it will be archived and therefore available for viewing after the event has concluded.
	open var contentDetails: YoutubeLiveBroadcastContentDetails!
	/// The snippet object contains basic details about the event, including its title, description, start time, and end time.
	open var snippet: YoutubeLiveBroadcastSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The status object contains information about the event's status.
	open var status: YoutubeLiveBroadcastStatus!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		statistics <- map["statistics"]
		topicDetails <- map["topicDetails"]
		id <- map["id"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		status <- map["status"]
	}
}

