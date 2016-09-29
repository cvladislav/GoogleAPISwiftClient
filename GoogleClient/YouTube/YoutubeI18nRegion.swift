//
//  YoutubeI18nRegion.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The I18nRegion model type for use with the Youtube API
open class YoutubeI18nRegion: GoogleObject {
	/// The snippet object contains basic details about the i18n region, such as region code and human-readable name.
	open var snippet: YoutubeI18nRegionSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube uses to uniquely identify the i18n region.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#i18nRegion".
	open var kind: String = "youtube#i18nRegion"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		kind <- map["kind"]
	}
}

