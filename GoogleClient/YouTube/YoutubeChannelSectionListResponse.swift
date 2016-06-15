//
//  YoutubeChannelSectionListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

public class YoutubeChannelSectionListResponse: GoogleObjectList {
	public typealias `Type` = YoutubeChannelSection
	/// A list of ChannelSections that match the request criteria.
	public var items: [Type]!
	/// The visitorId identifies the visitor.
	public var visitorId: String!
	/// Etag of this resource.
	public var etag: String!
	/// Serialized EventId of the request which produced this response.
	public var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#channelSectionListResponse".
	public var kind: String = "youtube#channelSectionListResponse"
	
	public required init?(_ map: Map) {

	}

	public init() {

	}

	public func mapping(_ map: Map) {
		items <- map["items"]
		visitorId <- map["visitorId"]
		etag <- map["etag"]
		eventId <- map["eventId"]
		kind <- map["kind"]
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

