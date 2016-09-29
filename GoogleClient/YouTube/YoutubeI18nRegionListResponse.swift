//
//  YoutubeI18nRegionListResponse.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class YoutubeI18nRegionListResponse: GoogleObjectList {
	public typealias `Type` = YoutubeI18nRegion
	/// A list of regions where YouTube is available. In this map, the i18n region ID is the map key, and its value is the corresponding i18nRegion resource.
	open var items: [Type]!
	/// The visitorId identifies the visitor.
	open var visitorId: String!
	/// Etag of this resource.
	open var etag: String!
	/// Serialized EventId of the request which produced this response.
	open var eventId: String!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#i18nRegionListResponse".
	open var kind: String = "youtube#i18nRegionListResponse"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
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

	open func makeIterator() -> Iterator {
		let objects = items as [Type]
		return objects.makeIterator()
	}

	open subscript(position: Int) -> Type {
		return items[position]
	}
}

