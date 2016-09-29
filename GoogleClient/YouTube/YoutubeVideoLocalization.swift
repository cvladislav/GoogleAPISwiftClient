//
//  YoutubeVideoLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoLocalization model type for use with the Youtube API
open class YoutubeVideoLocalization: ObjectType {
	/// Localized version of the video's title.
	open var title: String!
	/// Localized version of the video's description.
	open var description: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

