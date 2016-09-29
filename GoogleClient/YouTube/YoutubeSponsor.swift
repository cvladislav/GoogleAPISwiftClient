//
//  YoutubeSponsor.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Sponsor model type for use with the Youtube API
open class YoutubeSponsor: GoogleObject {
	/// The snippet object contains basic details about the sponsor.
	open var snippet: YoutubeSponsorSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube assigns to uniquely identify the sponsor.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#sponsor".
	open var kind: String = "youtube#sponsor"
	
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

