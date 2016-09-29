//
//  YoutubePlaylist.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Playlist model type for use with the Youtube API
open class YoutubePlaylist: GoogleObject {
	/// The ID that YouTube uses to uniquely identify the playlist.
	open var id: String!
	/// The player object contains information that you would use to play the playlist in an embedded player.
	open var player: YoutubePlaylistPlayer!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#playlist".
	open var kind: String = "youtube#playlist"
	/// The contentDetails object contains information like video count.
	open var contentDetails: YoutubePlaylistContentDetails!
	/// Localizations for different languages
	open var localizations: [String: YoutubePlaylistLocalization]!
	/// The snippet object contains basic details about the playlist, such as its title and description.
	open var snippet: YoutubePlaylistSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The status object contains status information for the playlist.
	open var status: YoutubePlaylistStatus!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
		player <- map["player"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		localizations <- map["localizations"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		status <- map["status"]
	}
}

