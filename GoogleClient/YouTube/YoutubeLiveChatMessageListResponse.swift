//
//  YoutubeLiveChatMessageListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class YoutubeLiveChatMessageListResponse: GoogleObjectList {
	public typealias `Type` = YoutubeLiveChatMessage
	/// A list of live chat messages.
	open var items: [Type]!
	open var tokenPagination: YoutubeTokenPagination!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatMessageListResponse".
	open var kind: String = "youtube#liveChatMessageListResponse"
	/// The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
	open var nextPageToken: String!
	open var pageInfo: YoutubePageInfo!
	/// The visitorId identifies the visitor.
	open var visitorId: String!
	/// Etag of this resource.
	open var etag: String!
	/// The date and time when the underlying stream went offline. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
	open var offlineAt: Date!
	/// Serialized EventId of the request which produced this response.
	open var eventId: String!
	/// The amount of time the client should wait before polling again.
	open var pollingIntervalMillis: UInt!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		tokenPagination <- map["tokenPagination"]
		kind <- map["kind"]
		nextPageToken <- map["nextPageToken"]
		pageInfo <- map["pageInfo"]
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		offlineAt <- (map["offlineAt"], RFC3339Transform())
		eventId <- map["eventId"]
		pollingIntervalMillis <- map["pollingIntervalMillis"]
	}
	public required init(arrayLiteral elements: Type...) {
		items = elements
	}

	public typealias Iterator = IndexingIterator<[Type]>

	open func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	open subscript(position: Int) -> Type {
		return items[position]
	}
}

