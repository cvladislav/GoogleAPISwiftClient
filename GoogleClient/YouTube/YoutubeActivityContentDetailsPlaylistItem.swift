//
//  YoutubeActivityContentDetailsPlaylistItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetailsPlaylistItem model type for use with the Youtube API
open class YoutubeActivityContentDetailsPlaylistItem: ObjectType {
	/// The resourceId object contains information about the resource that was added to the playlist.
	open var resourceId: YoutubeResourceId!
	/// The value that YouTube uses to uniquely identify the playlist.
	open var playlistId: String!
	/// ID of the item within the playlist.
	open var playlistItemId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		resourceId <- map["resourceId"]
		playlistId <- map["playlistId"]
		playlistItemId <- map["playlistItemId"]
	}
}

