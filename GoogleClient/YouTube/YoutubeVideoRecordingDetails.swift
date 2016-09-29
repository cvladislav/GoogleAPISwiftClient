//
//  YoutubeVideoRecordingDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoRecordingDetails model type for use with the Youtube API
open class YoutubeVideoRecordingDetails: ObjectType {
	/// The geolocation information associated with the video.
	open var location: YoutubeGeoPoint!
	/// The date and time when the video was recorded. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.
	open var recordingDate: Date!
	/// The text description of the location where the video was recorded.
	open var locationDescription: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		location <- map["location"]
		recordingDate <- (map["recordingDate"], RFC3339Transform())
		locationDescription <- map["locationDescription"]
	}
}

