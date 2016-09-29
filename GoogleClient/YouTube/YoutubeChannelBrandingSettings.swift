//
//  YoutubeChannelBrandingSettings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelBrandingSettings model type for use with the Youtube API
open class YoutubeChannelBrandingSettings: ObjectType {
	/// Branding properties for the channel view.
	open var channel: YoutubeChannelSettings!
	/// Branding properties for branding images.
	open var image: YoutubeImageSettings!
	/// Branding properties for the watch page.
	open var watch: YoutubeWatchSettings!
	/// Additional experimental branding properties.
	open var hints: [YoutubePropertyValue]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channel <- map["channel"]
		image <- map["image"]
		watch <- map["watch"]
		hints <- map["hints"]
	}
}

