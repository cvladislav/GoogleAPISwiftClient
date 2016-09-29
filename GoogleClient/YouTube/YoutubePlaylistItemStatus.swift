//
//  YoutubePlaylistItemStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistItemStatus model type for use with the Youtube API
open class YoutubePlaylistItemStatus: ObjectType {
	/// This resource's privacy status.
	open var privacyStatus: YoutubePlaylistItemStatusPrivacyStatus!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
	}
}

/// This resource's privacy status.
public enum YoutubePlaylistItemStatusPrivacyStatus: String {
	/// 
	case Private = "private"
	/// 
	case Public = "public"
	/// 
	case Unlisted = "unlisted"
}

