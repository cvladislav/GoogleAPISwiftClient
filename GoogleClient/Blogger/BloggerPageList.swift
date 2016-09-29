//
//  BloggerPageList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class BloggerPageList: GoogleObjectList {
	public typealias `Type` = BloggerPage
	/// The list of Pages for a Blog.
	open var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	open var nextPageToken: String!
	/// Etag of the response.
	open var etag: String!
	/// The kind of this entity. Always blogger#pageList
	open var kind: String = "blogger#pageList"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		etag <- map["etag"]
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

