//
//  YoutubeLiveChatModeratorListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeLiveChatModeratorListResponse: GoogleObjectList {
	public typealias `Type` = YoutubeLiveChatModerator
	/// A list of moderators that match the request criteria.
	public var items: [Type]!
	public var tokenPagination: YoutubeTokenPagination!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#liveChatModeratorListResponse".
	public var kind: String = "youtube#liveChatModeratorListResponse"
	/// The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
	public var nextPageToken: String!
	public var pageInfo: YoutubePageInfo!
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
	public var prevPageToken: String!
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
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

	public func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	public subscript(position: Int) -> Type {
		return items[position]
	}
}

