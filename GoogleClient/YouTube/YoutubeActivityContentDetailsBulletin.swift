//
//  YoutubeActivityContentDetailsBulletin.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetailsBulletin model type for use with the Youtube API
open class YoutubeActivityContentDetailsBulletin: ObjectType {
	/// The resourceId object contains information that identifies the resource associated with a bulletin post.
	open var resourceId: YoutubeResourceId!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		resourceId <- map["resourceId"]
	}
}

