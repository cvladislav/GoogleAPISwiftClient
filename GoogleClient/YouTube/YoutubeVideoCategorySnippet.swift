//
//  YoutubeVideoCategorySnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoCategorySnippet model type for use with the Youtube API
open class YoutubeVideoCategorySnippet: ObjectType {
	open var assignable: Bool!
	/// The YouTube channel that created the video category.
	open var channelId: String = "UCBR8-60-B28hp2BmDPdntcQ"
	/// The video category's title.
	open var title: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		assignable <- map["assignable"]
		channelId <- map["channelId"]
		title <- map["title"]
	}
}

