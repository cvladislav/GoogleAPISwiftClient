//
//  YoutubeGeoPoint.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The GeoPoint model type for use with the Youtube API
open class YoutubeGeoPoint: ObjectType {
	/// Latitude in degrees.
	open var latitude: Double!
	/// Longitude in degrees.
	open var longitude: Double!
	/// Altitude above the reference ellipsoid, in meters.
	open var altitude: Double!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		altitude <- map["altitude"]
	}
}

