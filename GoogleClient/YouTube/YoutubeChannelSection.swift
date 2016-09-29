//
//  YoutubeChannelSection.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSection model type for use with the Youtube API
open class YoutubeChannelSection: GoogleObject {
	/// The ID that YouTube uses to uniquely identify the channel section.
	open var id: String!
	/// The targeting object contains basic targeting settings about the channel section.
	open var targeting: YoutubeChannelSectionTargeting!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#channelSection".
	open var kind: String = "youtube#channelSection"
	/// The contentDetails object contains details about the channel section content, such as a list of playlists or channels featured in the section.
	open var contentDetails: YoutubeChannelSectionContentDetails!
	/// Localizations for different languages
	open var localizations: [String: YoutubeChannelSectionLocalization]!
	/// The snippet object contains basic details about the channel section, such as its type, style and title.
	open var snippet: YoutubeChannelSectionSnippet!
	/// Etag of this resource.
	open var etag: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
		targeting <- map["targeting"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		localizations <- map["localizations"]
		snippet <- map["snippet"]
		etag <- map["etag"]
	}
}

