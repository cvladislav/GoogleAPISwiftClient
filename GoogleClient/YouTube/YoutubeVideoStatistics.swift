//
//  YoutubeVideoStatistics.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoStatistics model type for use with the Youtube API
open class YoutubeVideoStatistics: ObjectType {
	/// The number of users who have indicated that they liked the video by giving it a positive rating.
	open var likeCount: UInt64!
	/// The number of times the video has been viewed.
	open var viewCount: UInt64!
	/// The number of users who currently have the video marked as a favorite video.
	open var favoriteCount: UInt64!
	/// The number of comments for the video.
	open var commentCount: UInt64!
	/// The number of users who have indicated that they disliked the video by giving it a negative rating.
	open var dislikeCount: UInt64!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		likeCount <- map["likeCount"]
		viewCount <- map["viewCount"]
		favoriteCount <- map["favoriteCount"]
		commentCount <- map["commentCount"]
		dislikeCount <- map["dislikeCount"]
	}
}

