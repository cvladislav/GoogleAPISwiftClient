//
//  YoutubePlaylistItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistItem model type for use with the Youtube API
open class YoutubePlaylistItem: GoogleObject {
	/// The contentDetails object is included in the resource if the included item is a YouTube video. The object contains additional information about the video.
	open var contentDetails: YoutubePlaylistItemContentDetails!
	/// The snippet object contains basic details about the playlist item, such as its title and position in the playlist.
	open var snippet: YoutubePlaylistItemSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube uses to uniquely identify the playlist item.
	open var id: String!
	/// The status object contains information about the playlist item's privacy status.
	open var status: YoutubePlaylistItemStatus!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#playlistItem".
	open var kind: String = "youtube#playlistItem"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		status <- map["status"]
		kind <- map["kind"]
	}
}

