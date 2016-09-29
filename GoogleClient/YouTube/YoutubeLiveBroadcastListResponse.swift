//
//  YoutubeLiveBroadcastListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class YoutubeLiveBroadcastListResponse: GoogleObjectList {
	public typealias `Type` = YoutubeLiveBroadcast
	/// A list of broadcasts that match the request criteria.
	open var items: [Type]!
	open var tokenPagination: YoutubeTokenPagination!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveBroadcastListResponse".
	open var kind: String = "youtube#liveBroadcastListResponse"
	/// The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
	open var nextPageToken: String!
	open var pageInfo: YoutubePageInfo!
	/// The visitorId identifies the visitor.
	open var visitorId: String!
	/// Etag of this resource.
	open var etag: String!
	/// Serialized EventId of the request which produced this response.
	open var eventId: String!
	/// The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
	open var prevPageToken: String!
	
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
		eventId <- map["eventId"]
		prevPageToken <- map["prevPageToken"]
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

