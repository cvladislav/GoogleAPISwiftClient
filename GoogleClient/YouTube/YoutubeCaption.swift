//
//  YoutubeCaption.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Caption model type for use with the Youtube API
open class YoutubeCaption: GoogleObject {
	/// The snippet object contains basic details about the caption.
	open var snippet: YoutubeCaptionSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube uses to uniquely identify the caption track.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#caption".
	open var kind: String = "youtube#caption"
	
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

