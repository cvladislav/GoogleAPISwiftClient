//
//  YoutubeFanFundingEventListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class YoutubeFanFundingEventListResponse: GoogleObjectList {
	public typealias `Type` = YoutubeFanFundingEvent
	/// A list of fan funding events that match the request criteria.
	open var items: [Type]!
	open var tokenPagination: YoutubeTokenPagination!
	open var pageInfo: YoutubePageInfo!
	/// The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
	open var nextPageToken: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#fanFundingEventListResponse".
	open var kind: String = "youtube#fanFundingEventListResponse"
	/// The visitorId identifies the visitor.
	open var visitorId: String!
	/// Etag of this resource.
	open var etag: String!
	/// Serialized EventId of the request which produced this response.
	open var eventId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		tokenPagination <- map["tokenPagination"]
		pageInfo <- map["pageInfo"]
		nextPageToken <- map["nextPageToken"]
		kind <- map["kind"]
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		eventId <- map["eventId"]
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

