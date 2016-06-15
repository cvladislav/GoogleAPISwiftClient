//
//  YoutubeI18nRegionSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The I18nRegionSnippet model type for use with the Youtube API
public class YoutubeI18nRegionSnippet: ObjectType {
	/// The human-readable name of the region.
	public var name: String!
	/// The region code as a 2-letter ISO country code.
	public var gl: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		name <- map["name"]
		gl <- map["gl"]
	}
}

