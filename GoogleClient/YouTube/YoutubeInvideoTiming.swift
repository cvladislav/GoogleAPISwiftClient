//
//  YoutubeInvideoTiming.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The InvideoTiming model type for use with the Youtube API
open class YoutubeInvideoTiming: ObjectType {
	/// Defines the duration in milliseconds for which the promotion should be displayed. If missing, the client should use the default.
	open var durationMs: UInt64!
	/// Defines the time at which the promotion will appear. Depending on the value of type the value of the offsetMs field will represent a time offset from the start or from the end of the video, expressed in milliseconds.
	open var offsetMs: UInt64!
	/// Describes a timing type. If the value is offsetFromStart, then the offsetMs field represents an offset from the start of the video. If the value is offsetFromEnd, then the offsetMs field represents an offset from the end of the video.
	open var type: YoutubeInvideoTimingType!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		durationMs <- map["durationMs"]
		offsetMs <- map["offsetMs"]
		type <- map["type"]
	}
}

/// Describes a timing type. If the value is offsetFromStart, then the offsetMs field represents an offset from the start of the video. If the value is offsetFromEnd, then the offsetMs field represents an offset from the end of the video.
public enum YoutubeInvideoTimingType: String {
	/// 
	case OffsetFromEnd = "offsetFromEnd"
	/// 
	case OffsetFromStart = "offsetFromStart"
}

