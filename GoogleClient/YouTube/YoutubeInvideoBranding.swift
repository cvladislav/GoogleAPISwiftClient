//
//  YoutubeInvideoBranding.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The InvideoBranding model type for use with the Youtube API
open class YoutubeInvideoBranding: ObjectType {
	open var imageBytes: URL!
	open var timing: YoutubeInvideoTiming!
	open var imageUrl: String!
	open var position: YoutubeInvideoPosition!
	open var targetChannelId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		imageBytes <- (map["imageBytes"], URLTransform())
		timing <- map["timing"]
		imageUrl <- map["imageUrl"]
		position <- map["position"]
		targetChannelId <- map["targetChannelId"]
	}
}

