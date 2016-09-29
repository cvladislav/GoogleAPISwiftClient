//
//  YoutubeLanguageTag.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LanguageTag model type for use with the Youtube API
open class YoutubeLanguageTag: ObjectType {
	open var value: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		value <- map["value"]
	}
}

