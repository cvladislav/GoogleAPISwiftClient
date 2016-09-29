//
//  BloggerPostPerUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PostPerUserInfo model type for use with the Blogger API
open class BloggerPostPerUserInfo: GoogleObject {
	/// ID of the User.
	open var userId: String!
	/// True if the user has Author level access to the post.
	open var hasEditAccess: Bool!
	/// ID of the Blog that the post resource belongs to.
	open var blogId: String!
	/// ID of the Post resource.
	open var postId: String!
	/// The kind of this entity. Always blogger#postPerUserInfo
	open var kind: String = "blogger#postPerUserInfo"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		userId <- map["userId"]
		hasEditAccess <- map["hasEditAccess"]
		blogId <- map["blogId"]
		postId <- map["postId"]
		kind <- map["kind"]
	}
}

