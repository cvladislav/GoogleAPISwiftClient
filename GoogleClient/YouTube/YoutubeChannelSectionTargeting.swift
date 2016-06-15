//
//  YoutubeChannelSectionTargeting.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelSectionTargeting model type for use with the Youtube API
public class YoutubeChannelSectionTargeting: ObjectType {
	/// The country the channel section is targeting.
	public var countries: [String]!
	/// The language the channel section is targeting.
	public var languages: [String]!
	/// The region the channel section is targeting.
	public var regions: [String]!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		countries <- map["countries"]
		languages <- map["languages"]
		regions <- map["regions"]
	}
}

