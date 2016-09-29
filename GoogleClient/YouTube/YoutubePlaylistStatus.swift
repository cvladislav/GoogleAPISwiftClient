//
//  YoutubePlaylistStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PlaylistStatus model type for use with the Youtube API
open class YoutubePlaylistStatus: ObjectType {
	/// The playlist's privacy status.
	open var privacyStatus: YoutubePlaylistStatusPrivacyStatus!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		privacyStatus <- map["privacyStatus"]
	}
}

/// The playlist's privacy status.
public enum YoutubePlaylistStatusPrivacyStatus: String {
	/// 
	case Private = "private"
	/// 
	case Public = "public"
	/// 
	case Unlisted = "unlisted"
}

