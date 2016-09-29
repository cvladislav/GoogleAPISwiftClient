//
//  YoutubeLiveStream.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveStream model type for use with the Youtube API
open class YoutubeLiveStream: GoogleObject {
	/// The ID that YouTube assigns to uniquely identify the stream.
	open var id: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveStream".
	open var kind: String = "youtube#liveStream"
	/// The content_details object contains information about the stream, including the closed captions ingestion URL.
	open var contentDetails: YoutubeLiveStreamContentDetails!
	/// The snippet object contains basic details about the stream, including its channel, title, and description.
	open var snippet: YoutubeLiveStreamSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The status object contains information about live stream's status.
	open var status: YoutubeLiveStreamStatus!
	/// The cdn object defines the live stream's content delivery network (CDN) settings. These settings provide details about the manner in which you stream your content to YouTube.
	open var cdn: YoutubeCdnSettings!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		status <- map["status"]
		cdn <- map["cdn"]
	}
}

