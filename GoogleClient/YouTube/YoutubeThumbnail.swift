//
//  YoutubeThumbnail.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Thumbnail model type for use with the Youtube API
open class YoutubeThumbnail: ObjectType {
	/// (Optional) Width of the thumbnail image.
	open var width: UInt!
	/// (Optional) Height of the thumbnail image.
	open var height: UInt!
	/// The thumbnail image's URL.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		width <- map["width"]
		height <- map["height"]
		url <- map["url"]
	}
}

