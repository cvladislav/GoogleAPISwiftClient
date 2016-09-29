//
//  BloggerBlogPerUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The BlogPerUserInfo model type for use with the Blogger API
open class BloggerBlogPerUserInfo: GoogleObject {
	/// ID of the User
	open var userId: String!
	/// The Photo Album Key for the user when adding photos to the blog
	open var photosAlbumKey: String!
	/// True if the user has Admin level access to the blog.
	open var hasAdminAccess: Bool!
	/// Access permissions that the user has for the blog (ADMIN, AUTHOR, or READER).
	open var role: String!
	/// ID of the Blog resource
	open var blogId: String!
	/// The kind of this entity. Always blogger#blogPerUserInfo
	open var kind: String = "blogger#blogPerUserInfo"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		userId <- map["userId"]
		photosAlbumKey <- map["photosAlbumKey"]
		hasAdminAccess <- map["hasAdminAccess"]
		role <- map["role"]
		blogId <- map["blogId"]
		kind <- map["kind"]
	}
}

