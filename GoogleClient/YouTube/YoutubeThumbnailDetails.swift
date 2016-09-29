//
//  YoutubeThumbnailDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ThumbnailDetails model type for use with the Youtube API
open class YoutubeThumbnailDetails: ObjectType {
	/// The medium quality image for this resource.
	open var medium: YoutubeThumbnail!
	/// The default image for this resource.
	open var defaultValue: YoutubeThumbnail!
	/// The maximum resolution quality image for this resource.
	open var maxres: YoutubeThumbnail!
	/// The standard quality image for this resource.
	open var standard: YoutubeThumbnail!
	/// The high quality image for this resource.
	open var high: YoutubeThumbnail!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		medium <- map["medium"]
		defaultValue <- map["default"]
		maxres <- map["maxres"]
		standard <- map["standard"]
		high <- map["high"]
	}
}

