//
//  YoutubePlaylistLocalization.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistLocalization model type for use with the Youtube API
public class YoutubePlaylistLocalization: ObjectType {
	/// The localized strings for playlist's title.
	public var title: String!
	/// The localized strings for playlist's description.
	public var description: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		title <- map["title"]
		description <- map["description"]
	}
}

