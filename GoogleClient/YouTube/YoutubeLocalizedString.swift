//
//  YoutubeLocalizedString.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LocalizedString model type for use with the Youtube API
open class YoutubeLocalizedString: ObjectType {
	open var language: String!
	open var value: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		language <- map["language"]
		value <- map["value"]
	}
}

