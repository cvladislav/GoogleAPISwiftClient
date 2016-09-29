//
//  BloggerUser.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The User model type for use with the Blogger API
open class BloggerUser: GoogleObject {
	/// This user's locale
	open var locale: BloggerUserLocale!
	/// Profile summary information.
	open var about: String!
	/// The identifier for this User.
	open var id: String!
	/// The display name.
	open var displayName: String!
	/// The kind of this entity. Always blogger#user
	open var kind: String = "blogger#user"
	/// The timestamp of when this profile was created, in seconds since epoch.
	open var created: Date!
	/// The container of blogs for this user.
	open var blogs: BloggerUserBlogs!
	/// The API REST URL to fetch this resource from.
	open var selfLink: String!
	/// The user's profile page.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		locale <- map["locale"]
		about <- map["about"]
		id <- map["id"]
		displayName <- map["displayName"]
		kind <- map["kind"]
		created <- (map["created"], RFC3339Transform())
		blogs <- map["blogs"]
		selfLink <- map["selfLink"]
		url <- map["url"]
	}
}

/// The Blogs subtype of the User model type for use with the Blogger API
open class BloggerUserBlogs: ObjectType {
	/// The URL of the Blogs for this user.
	open var selfLink: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		selfLink <- map["selfLink"]
	}
}

/// The Locale subtype of the User model type for use with the Blogger API
open class BloggerUserLocale: ObjectType {
	/// The user's country setting.
	open var country: String!
	/// The user's language setting.
	open var language: String!
	/// The user's language variant setting.
	open var variant: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		country <- map["country"]
		language <- map["language"]
		variant <- map["variant"]
	}
}

