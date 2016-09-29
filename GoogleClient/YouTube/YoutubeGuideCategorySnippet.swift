//
//  YoutubeGuideCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The GuideCategorySnippet model type for use with the Youtube API
open class YoutubeGuideCategorySnippet: ObjectType {
	open var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// Description of the guide category.
	open var title: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

