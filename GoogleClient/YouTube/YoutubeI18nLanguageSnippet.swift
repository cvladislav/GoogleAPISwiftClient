//
//  YoutubeI18nLanguageSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The I18nLanguageSnippet model type for use with the Youtube API
open class YoutubeI18nLanguageSnippet: ObjectType {
	/// A short BCP-47 code that uniquely identifies a language.
	open var hl: String!
	/// The human-readable name of the language in the language itself.
	open var name: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		hl <- map["hl"]
		name <- map["name"]
	}
}

