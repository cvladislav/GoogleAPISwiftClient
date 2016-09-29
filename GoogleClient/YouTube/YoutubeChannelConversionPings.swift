//
//  YoutubeChannelConversionPings.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelConversionPings model type for use with the Youtube API
open class YoutubeChannelConversionPings: ObjectType {
	/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
	open var pings: [YoutubeChannelConversionPing]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		pings <- map["pings"]
	}
}

