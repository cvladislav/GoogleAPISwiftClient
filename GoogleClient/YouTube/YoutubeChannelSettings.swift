//
//  YoutubeChannelSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSettings model type for use with the Youtube API
open class YoutubeChannelSettings: ObjectType {
	/// Whether the tab to browse the videos should be displayed.
	open var showBrowseView: Bool!
	/// Specifies the channel title.
	open var title: String!
	/// Whether related channels should be proposed.
	open var showRelatedChannels: Bool!
	/// The ID for a Google Analytics account to track and measure traffic to the channels.
	open var trackingAnalyticsAccountId: String!
	/// The country of the channel.
	open var country: String!
	/// Specifies the channel description.
	open var description: String!
	/// The list of featured channels.
	open var featuredChannelsUrls: [String]!
	open var defaultLanguage: String!
	/// Lists keywords associated with the channel, comma-separated.
	open var keywords: String!
	/// Whether user-submitted comments left on the channel page need to be approved by the channel owner to be publicly visible.
	open var moderateComments: Bool!
	/// Which content tab users should see when viewing the channel.
	open var defaultTab: String!
	/// A prominent color that can be rendered on this channel page.
	open var profileColor: String!
	/// Title for the featured channels tab.
	open var featuredChannelsTitle: String!
	/// The trailer of the channel, for users that are not subscribers.
	open var unsubscribedTrailer: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		showBrowseView <- map["showBrowseView"]
		title <- map["title"]
		showRelatedChannels <- map["showRelatedChannels"]
		trackingAnalyticsAccountId <- map["trackingAnalyticsAccountId"]
		country <- map["country"]
		description <- map["description"]
		featuredChannelsUrls <- map["featuredChannelsUrls"]
		defaultLanguage <- map["defaultLanguage"]
		keywords <- map["keywords"]
		moderateComments <- map["moderateComments"]
		defaultTab <- map["defaultTab"]
		profileColor <- map["profileColor"]
		featuredChannelsTitle <- map["featuredChannelsTitle"]
		unsubscribedTrailer <- map["unsubscribedTrailer"]
	}
}

