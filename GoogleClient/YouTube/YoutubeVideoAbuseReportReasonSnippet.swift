//
//  YoutubeVideoAbuseReportReasonSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoAbuseReportReasonSnippet model type for use with the Youtube API
open class YoutubeVideoAbuseReportReasonSnippet: ObjectType {
	/// The localized label belonging to this abuse report reason.
	open var label: String!
	/// The secondary reasons associated with this reason, if any are available. (There might be 0 or more.)
	open var secondaryReasons: [YoutubeVideoAbuseReportSecondaryReason]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		label <- map["label"]
		secondaryReasons <- map["secondaryReasons"]
	}
}

