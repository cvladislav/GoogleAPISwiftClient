//
//  YoutubeChannelBannerResource.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelBannerResource model type for use with the Youtube API
open class YoutubeChannelBannerResource: GoogleObject {
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#channelBannerResource".
	open var kind: String = "youtube#channelBannerResource"
	/// The URL of this banner image.
	open var url: String!
	/// Etag of this resource.
	open var etag: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		kind <- map["kind"]
		url <- map["url"]
		etag <- map["etag"]
	}
}

