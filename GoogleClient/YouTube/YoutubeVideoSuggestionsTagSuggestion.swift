//
//  YoutubeVideoSuggestionsTagSuggestion.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoSuggestionsTagSuggestion model type for use with the Youtube API
open class YoutubeVideoSuggestionsTagSuggestion: ObjectType {
	/// A set of video categories for which the tag is relevant. You can use this information to display appropriate tag suggestions based on the video category that the video uploader associates with the video. By default, tag suggestions are relevant for all categories if there are no restricts defined for the keyword.
	open var categoryRestricts: [String]!
	/// The keyword tag suggested for the video.
	open var tag: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		categoryRestricts <- map["categoryRestricts"]
		tag <- map["tag"]
	}
}

