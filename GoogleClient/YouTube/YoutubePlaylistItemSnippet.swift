//
//  YoutubePlaylistItemSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistItemSnippet model type for use with the Youtube API
open class YoutubePlaylistItemSnippet: ObjectType {
	/// The ID that YouTube uses to uniquely identify the user that added the item to the playlist.
	open var channelId: String!
	/// A map of thumbnail images associated with the playlist item. For each object in the map, the key is the name of the thumbnail image, and the value is an object that contains other information about the thumbnail.
	open var thumbnails: YoutubeThumbnailDetails!
	/// The item's title.
	open var title: String!
	/// The id object contains information that can be used to uniquely identify the resource that is included in the playlist as the playlist item.
	open var resourceId: YoutubeResourceId!
	/// The ID that YouTube uses to uniquely identify the playlist that the playlist item is in.
	open var playlistId: String!
	/// The item's description.
	open var description: String!
	/// The date and time that the item was added to the playlist. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var publishedAt: Date!
	/// The order in which the item appears in the playlist. The value uses a zero-based index, so the first item has a position of 0, the second item has a position of 1, and so forth.
	open var position: UInt!
	/// Channel title for the channel that the playlist item belongs to.
	open var channelTitle: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelId <- map["channelId"]
		thumbnails <- map["thumbnails"]
		title <- map["title"]
		resourceId <- map["resourceId"]
		playlistId <- map["playlistId"]
		description <- map["description"]
		publishedAt <- (map["publishedAt"], RFC3339Transform())
		position <- map["position"]
		channelTitle <- map["channelTitle"]
	}
}

