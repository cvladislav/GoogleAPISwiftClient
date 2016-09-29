//
//  YoutubePageInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PageInfo model type for use with the Youtube API
open class YoutubePageInfo: ObjectType {
	/// The number of results included in the API response.
	open var resultsPerPage: Int!
	/// The total number of results in the result set.
	open var totalResults: Int!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		resultsPerPage <- map["resultsPerPage"]
		totalResults <- map["totalResults"]
	}
}

