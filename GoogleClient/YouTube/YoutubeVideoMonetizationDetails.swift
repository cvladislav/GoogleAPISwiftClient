//
//  YoutubeVideoMonetizationDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoMonetizationDetails model type for use with the Youtube API
open class YoutubeVideoMonetizationDetails: ObjectType {
	/// The value of access indicates whether the video can be monetized or not.
	open var access: YoutubeAccessPolicy!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		access <- map["access"]
	}
}

