//
//  YoutubePlaylistSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistSnippet model type for use with the Youtube API
open class YoutubePlaylistSnippet: ObjectType {
	/// A map of thumbnail images associated with the playlist. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	open var thumbnails: YoutubeThumbnailDetails!
	/// The ID that YouTube uses to uniquely identify the channel that published the playlist.
	open var channelId: String!
	/// The playlist's title.
	open var title: String!
	/// Keyword tags associated with the playlist.
	open var tags: [String]!
	/// Localized title and description, read-only.
	open var localized: YoutubePlaylistLocalization!
	/// The playlist's description.
	open var description: String!
	/// The date and time that the playlist was created. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var publishedAt: Date!
	/// The language of the playlist's default title and description.
	open var defaultLanguage: String!
	/// The channel title of the channel that the video belongs to.
	open var channelTitle: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		thumbnails <- map["thumbnails"]
		channelId <- map["channelId"]
		title <- map["title"]
		tags <- map["tags"]
		localized <- map["localized"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		defaultLanguage <- map["defaultLanguage"]
		channelTitle <- map["channelTitle"]
	}
}

