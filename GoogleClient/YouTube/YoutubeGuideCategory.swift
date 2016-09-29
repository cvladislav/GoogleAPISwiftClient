//
//  YoutubeGuideCategory.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The GuideCategory model type for use with the Youtube API
open class YoutubeGuideCategory: GoogleObject {
	/// The snippet object contains basic details about the category, such as its title.
	open var snippet: YoutubeGuideCategorySnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube uses to uniquely identify the guide category.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#guideCategory".
	open var kind: String = "youtube#guideCategory"
	
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

