//
//  YoutubeVideoProjectDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoProjectDetails model type for use with the Youtube API
open class YoutubeVideoProjectDetails: ObjectType {
	/// A list of project tags associated with the video during the upload.
	open var tags: [String]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		tags <- map["tags"]
	}
}

