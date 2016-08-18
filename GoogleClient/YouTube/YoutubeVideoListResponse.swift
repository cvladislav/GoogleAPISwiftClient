//
//  YoutubeVideoListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 7/11/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoListResponse model type for use with the Youtube API
public class YoutubeVideoListResponse: GoogleObjectList {
	/// A list of videos that match the request criteria.
	public var items: [YoutubeVideo]!
	public var tokenPagination: YoutubeTokenPagination!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#videoListResponse".
	public var kind: String = "youtube#videoListResponse"
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

	public func mapping(map: Map) {
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
	public required init(arrayLiteral elements: YoutubeVideo...) {
		items = elements
	}

	public typealias Generator = IndexingGenerator<[YoutubeVideo]>

	public func generate() -> Generator {
		let objects = items as [YoutubeVideo]
		return objects.generate()
	}

	public subscript(position: Int) -> YoutubeVideo {
		return items[position]
	}
}

