//
//  YoutubeActivity.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Activity model type for use with the Youtube API
open class YoutubeActivity: GoogleObject {
	/// The contentDetails object contains information about the content associated with the activity. For example, if the snippet.type value is videoRated, then the contentDetails object's content identifies the rated video.
	open var contentDetails: YoutubeActivityContentDetails!
	/// The snippet object contains basic details about the activity, including the activity's type and group ID.
	open var snippet: YoutubeActivitySnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube uses to uniquely identify the activity.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#activity".
	open var kind: String = "youtube#activity"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

