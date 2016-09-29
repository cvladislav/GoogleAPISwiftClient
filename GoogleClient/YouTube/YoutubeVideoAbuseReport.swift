//
//  YoutubeVideoAbuseReport.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoAbuseReport model type for use with the Youtube API
open class YoutubeVideoAbuseReport: ObjectType {
	/// The high-level, or primary, reason that the content is abusive. The value is an abuse report reason ID.
	open var reasonId: String!
	/// The ID that YouTube uses to uniquely identify the video.
	open var videoId: String!
	/// The specific, or secondary, reason that this content is abusive (if available). The value is an abuse report reason ID that is a valid secondary reason for the primary reason.
	open var secondaryReasonId: String!
	/// The language that the content was viewed in.
	open var language: String!
	/// Additional comments regarding the abuse report.
	open var comments: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		reasonId <- map["reasonId"]
		videoId <- map["videoId"]
		secondaryReasonId <- map["secondaryReasonId"]
		language <- map["language"]
		comments <- map["comments"]
	}
}

