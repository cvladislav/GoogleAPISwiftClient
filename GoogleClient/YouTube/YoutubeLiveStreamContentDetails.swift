//
//  YoutubeLiveStreamContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The LiveStreamContentDetails model type for use with the Youtube API
open class YoutubeLiveStreamContentDetails: ObjectType {
	/// The ingestion URL where the closed captions of this stream are sent.
	open var closedCaptionsIngestionUrl: String!
	/**
	Indicates whether the stream is reusable, which means that it can be bound to multiple broadcasts. It is common for broadcasters to reuse the same stream for many different broadcasts if those broadcasts occur at different times.
	
	If you set this value to false, then the stream will not be reusable, which means that it can only be bound to one broadcast. Non-reusable streams differ from reusable streams in the following ways:  
	- A non-reusable stream can only be bound to one broadcast. 
	- A non-reusable stream might be deleted by an automated process after the broadcast ends. 
	- The  liveStreams.list method does not list non-reusable streams if you call the method and set the mine parameter to true. The only way to use that method to retrieve the resource for a non-reusable stream is to use the id parameter to identify the stream.*/
	open var isReusable: Bool!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		closedCaptionsIngestionUrl <- map["closedCaptionsIngestionUrl"]
		isReusable <- map["isReusable"]
	}
}

