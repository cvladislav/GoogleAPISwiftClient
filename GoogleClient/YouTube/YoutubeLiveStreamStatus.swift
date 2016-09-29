//
//  YoutubeLiveStreamStatus.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveStreamStatus model type for use with the Youtube API
open class YoutubeLiveStreamStatus: ObjectType {
	/// The health status of the stream.
	open var healthStatus: YoutubeLiveStreamHealthStatus!
	open var streamStatus: YoutubeLiveStreamStatusStreamStatus!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		healthStatus <- map["healthStatus"]
		streamStatus <- map["streamStatus"]
	}
}

/// 
public enum YoutubeLiveStreamStatusStreamStatus: String {
	/// 
	case Active = "active"
	/// 
	case Created = "created"
	/// 
	case Error = "error"
	/// 
	case Inactive = "inactive"
	/// 
	case Ready = "ready"
}

