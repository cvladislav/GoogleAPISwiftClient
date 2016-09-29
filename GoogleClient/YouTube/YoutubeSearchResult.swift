//
//  YoutubeSearchResult.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The SearchResult model type for use with the Youtube API
open class YoutubeSearchResult: GoogleObject {
	/// The snippet object contains basic details about a search result, such as its title or description. For example, if the search result is a video, then the title will be the video's title and the description will be the video's description.
	open var snippet: YoutubeSearchResultSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The id object contains information that can be used to uniquely identify the resource that matches the search request.
	open var id: YoutubeResourceId!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#searchResult".
	open var kind: String = "youtube#searchResult"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

