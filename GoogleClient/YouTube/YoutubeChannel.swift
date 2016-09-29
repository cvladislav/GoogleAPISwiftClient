//
//  YoutubeChannel.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Channel model type for use with the Youtube API
open class YoutubeChannel: GoogleObject {
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#channel".
	open var kind: String = "youtube#channel"
	/// The contentDetails object encapsulates information about the channel's content.
	open var contentDetails: YoutubeChannelContentDetails!
	/// The snippet object contains basic details about the channel, such as its title, description, and thumbnail images.
	open var snippet: YoutubeChannelSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The auditionDetails object encapsulates channel data that is relevant for YouTube Partners during the audition process.
	open var auditDetails: YoutubeChannelAuditDetails!
	/// The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
	open var conversionPings: YoutubeChannelConversionPings!
	/// The statistics object encapsulates statistics for the channel.
	open var statistics: YoutubeChannelStatistics!
	/// The ID that YouTube uses to uniquely identify the channel.
	open var id: String!
	/// The topicDetails object encapsulates information about Freebase topics associated with the channel.
	open var topicDetails: YoutubeChannelTopicDetails!
	/// The invideoPromotion object encapsulates information about promotion campaign associated with the channel.
	open var invideoPromotion: YoutubeInvideoPromotion!
	/// Localizations for different languages
	open var localizations: [String: YoutubeChannelLocalization]!
	/// The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
	open var contentOwnerDetails: YoutubeChannelContentOwnerDetails!
	/// The status object encapsulates information about the privacy status of the channel.
	open var status: YoutubeChannelStatus!
	/// The brandingSettings object encapsulates information about the branding of the channel.
	open var brandingSettings: YoutubeChannelBrandingSettings!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		auditDetails <- map["auditDetails"]
		conversionPings <- map["conversionPings"]
		statistics <- map["statistics"]
		id <- map["id"]
		topicDetails <- map["topicDetails"]
		invideoPromotion <- map["invideoPromotion"]
		localizations <- map["localizations"]
		contentOwnerDetails <- map["contentOwnerDetails"]
		status <- map["status"]
		brandingSettings <- map["brandingSettings"]
	}
}

