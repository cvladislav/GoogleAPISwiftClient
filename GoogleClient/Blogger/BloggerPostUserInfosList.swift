//
//  BloggerPostUserInfosList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class BloggerPostUserInfosList: GoogleObjectList {
	public typealias `Type` = BloggerPostUserInfo
	/// The list of Posts with User information for the post, for this Blog.
	open var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	open var nextPageToken: String!
	/// The kind of this entity. Always blogger#postList
	open var kind: String = "blogger#postUserInfosList"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
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

