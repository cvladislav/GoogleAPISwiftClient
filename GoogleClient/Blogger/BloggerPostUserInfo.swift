//
//  BloggerPostUserInfo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PostUserInfo model type for use with the Blogger API
open class BloggerPostUserInfo: GoogleObject {
	/// The Post resource.
	open var post: BloggerPost!
	/// Information about a User for the Post.
	open var postUserInfo: BloggerPostPerUserInfo!
	/// The kind of this entity. Always blogger#postUserInfo
	open var kind: String = "blogger#postUserInfo"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		post <- map["post"]
		postUserInfo <- map["post_user_info"]
		kind <- map["kind"]
	}
}

