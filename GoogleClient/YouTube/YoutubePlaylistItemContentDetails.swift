//
//  YoutubePlaylistItemContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistItemContentDetails model type for use with the Youtube API
open class YoutubePlaylistItemContentDetails: ObjectType {
	/// A user-generated note for this item.
	open var note: String!
	/// The ID that YouTube uses to uniquely identify a video. To retrieve the video resource, set the id query parameter to this value in your API request.
	open var videoId: String!
	/// The time, measured in seconds from the start of the video, when the video should stop playing. (The playlist owner can specify the times when the video should start and stop playing when the video is played in the context of the playlist.) By default, assume that the video.endTime is the end of the video.
	open var endAt: String!
	/// The time, measured in seconds from the start of the video, when the video should start playing. (The playlist owner can specify the times when the video should start and stop playing when the video is played in the context of the playlist.) The default value is 0.
	open var startAt: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		note <- map["note"]
		videoId <- map["videoId"]
		endAt <- map["endAt"]
		startAt <- map["startAt"]
	}
}

