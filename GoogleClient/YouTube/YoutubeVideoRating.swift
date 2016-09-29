//
//  YoutubeVideoRating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// 
public enum YoutubeVideoRatingRating: String {
	/// 
	case Dislike = "dislike"
	/// 
	case Like = "like"
	/// 
	case None = "none"
	/// 
	case Unspecified = "unspecified"
}

/// The VideoRating model type for use with the Youtube API
open class YoutubeVideoRating: ObjectType {
	open var rating: YoutubeVideoRatingRating!
	open var videoId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		rating <- map["rating"]
		videoId <- map["videoId"]
	}
}

