//
//  BloggerCommentList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class BloggerCommentList: GoogleObjectList {
	public typealias `Type` = BloggerComment
	/// The List of Comments for a Post.
	open var items: [Type]!
	/// Pagination token to fetch the next page, if one exists.
	open var nextPageToken: String!
	/// The kind of this entry. Always blogger#commentList
	open var kind: String = "blogger#commentList"
	/// Etag of the response.
	open var etag: String!
	/// Pagination token to fetch the previous page, if one exists.
	open var prevPageToken: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		nextPageToken <- map["nextPageToken"]
		kind <- map["kind"]
		etag <- map["etag"]
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

