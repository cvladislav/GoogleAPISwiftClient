//
//  BloggerBlogUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The BlogUserInfo model type for use with the Blogger API
open class BloggerBlogUserInfo: GoogleObject {
	/// The Blog resource.
	open var blog: BloggerBlog!
	/// Information about a User for the Blog.
	open var blogUserInfo: BloggerBlogPerUserInfo!
	/// The kind of this entity. Always blogger#blogUserInfo
	open var kind: String = "blogger#blogUserInfo"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		blog <- map["blog"]
		blogUserInfo <- map["blog_user_info"]
		kind <- map["kind"]
	}
}

