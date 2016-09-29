//
//  BloggerBlogList.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

open class BloggerBlogList: GoogleObjectList {
	public typealias `Type` = BloggerBlog
	/// The list of Blogs this user has Authorship or Admin rights over.
	open var items: [Type]!
	/// Admin level list of blog per-user information
	open var blogUserInfos: [BloggerBlogUserInfo]!
	/// The kind of this entity. Always blogger#blogList
	open var kind: String = "blogger#blogList"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		blogUserInfos <- map["blogUserInfos"]
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

