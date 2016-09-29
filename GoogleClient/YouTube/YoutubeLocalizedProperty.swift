//
//  YoutubeLocalizedProperty.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LocalizedProperty model type for use with the Youtube API
open class YoutubeLocalizedProperty: ObjectType {
	open var localized: [YoutubeLocalizedString]!
	open var defaultValue: String!
	/// The language of the default property.
	open var defaultLanguage: YoutubeLanguageTag!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		localized <- map["localized"]
		defaultValue <- map["default"]
		defaultLanguage <- map["defaultLanguage"]
	}
}

