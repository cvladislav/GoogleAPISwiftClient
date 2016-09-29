//
//  YoutubePlaylistContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistContentDetails model type for use with the Youtube API
open class YoutubePlaylistContentDetails: ObjectType {
	/// The number of videos in the playlist.
	open var itemCount: UInt!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		itemCount <- map["itemCount"]
	}
}

