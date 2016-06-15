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
public class YoutubeLiveStreamStatus: ObjectType {
	/// The health status of the stream.
	public var healthStatus: YoutubeLiveStreamHealthStatus!
	public var streamStatus: YoutubeLiveStreamStatusStreamStatus!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
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

