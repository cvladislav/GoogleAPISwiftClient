//
//  YoutubeVideoAbuseReportReason.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoAbuseReportReason model type for use with the Youtube API
open class YoutubeVideoAbuseReportReason: GoogleObject {
	/// The snippet object contains basic details about the abuse report reason.
	open var snippet: YoutubeVideoAbuseReportReasonSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID of this abuse report reason.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#videoAbuseReportReason".
	open var kind: String = "youtube#videoAbuseReportReason"
	
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

