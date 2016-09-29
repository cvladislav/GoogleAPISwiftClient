//
//  YoutubeChannelSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSnippet model type for use with the Youtube API
open class YoutubeChannelSnippet: ObjectType {
	/// A map of thumbnail images associated with the channel. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	open var thumbnails: YoutubeThumbnailDetails!
	/// The channel's title.
	open var title: String!
	/// The country of the channel.
	open var country: String!
	/// Localized title and description, read-only.
	open var localized: YoutubeChannelLocalization!
	/// The custom url of the channel.
	open var customUrl: String!
	/// The description of the channel.
	open var description: String!
	/// The date and time that the channel was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var publishedAt: Date!
	/// The language of the channel's default title and description.
	open var defaultLanguage: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		thumbnails <- map["thumbnails"]
		title <- map["title"]
		country <- map["country"]
		localized <- map["localized"]
		customUrl <- map["customUrl"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		defaultLanguage <- map["defaultLanguage"]
	}
}

