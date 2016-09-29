//
//  YoutubeActivityContentDetailsPromotedItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The type of call-to-action, a message to the user indicating action that can be taken.
public enum YoutubeActivityContentDetailsPromotedItemCtaType: String {
	/// 
	case Unspecified = "unspecified"
	/// 
	case VisitAdvertiserSite = "visitAdvertiserSite"
}

/// The ActivityContentDetailsPromotedItem model type for use with the Youtube API
open class YoutubeActivityContentDetailsPromotedItem: ObjectType {
	/// The list of forecasting URLs. The client should ping all of these URLs when a promoted item is not available, to indicate that a promoted item could have been shown.
	open var forecastingUrl: [String]!
	/// The URL the client should direct the user to, if the user chooses to visit the advertiser's website.
	open var destinationUrl: String!
	/// The type of call-to-action, a message to the user indicating action that can be taken.
	open var ctaType: YoutubeActivityContentDetailsPromotedItemCtaType!
	/// The URL the client should ping to indicate that the user was shown this promoted item.
	open var creativeViewUrl: String!
	/// The text description to accompany the promoted item.
	open var descriptionText: String!
	/// The custom call-to-action button text. If specified, it will override the default button text for the cta_type.
	open var customCtaButtonText: String!
	/// The ID that YouTube uses to uniquely identify the promoted video.
	open var videoId: String!
	/// The list of impression URLs. The client should ping all of these URLs to indicate that the user was shown this promoted item.
	open var impressionUrl: [String]!
	/// The URL the client should ping to indicate that the user clicked through on this promoted item.
	open var clickTrackingUrl: String!
	/// The URL the client should fetch to request a promoted item.
	open var adTag: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		forecastingUrl <- map["forecastingUrl"]
		destinationUrl <- map["destinationUrl"]
		ctaType <- map["ctaType"]
		creativeViewUrl <- map["creativeViewUrl"]
		descriptionText <- map["descriptionText"]
		customCtaButtonText <- map["customCtaButtonText"]
		videoId <- map["videoId"]
		impressionUrl <- map["impressionUrl"]
		clickTrackingUrl <- map["clickTrackingUrl"]
		adTag <- map["adTag"]
	}
}

