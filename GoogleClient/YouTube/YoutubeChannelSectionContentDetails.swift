//
//  YoutubeChannelSectionContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSectionContentDetails model type for use with the Youtube API
open class YoutubeChannelSectionContentDetails: ObjectType {
	/// The playlist ids for type single_playlist and multiple_playlists. For singlePlaylist, only one playlistId is allowed.
	open var playlists: [String]!
	/// The channel ids for type multiple_channels.
	open var channels: [String]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		playlists <- map["playlists"]
		channels <- map["channels"]
	}
}

