//
//  BloggerBlog.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Blog model type for use with the Blogger API
open class BloggerBlog: GoogleObject {
	/// The locale this Blog is set to.
	open var locale: BloggerBlogLocale!
	/// The API REST URL to fetch this resource from.
	open var selfLink: String!
	/// RFC 3339 date-time when this blog was published.
	open var published: Date!
	/// The JSON custom meta-data for the Blog
	open var customMetaData: String!
	/// The kind of this entry. Always blogger#blog
	open var kind: String = "blogger#blog"
	/// The description of this blog. This is displayed underneath the title.
	open var description: String!
	/// RFC 3339 date-time when this blog was last updated.
	open var updated: Date!
	/// The name of this blog. This is displayed as the title.
	open var name: String!
	/// The identifier for this resource.
	open var id: String!
	/// The container of posts in this blog.
	open var posts: BloggerBlogPosts!
	/// The container of pages in this blog.
	open var pages: BloggerBlogPages!
	/// The URL where this blog is published.
	open var url: String!
	/// The status of the blog.
	open var status: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		locale <- map["locale"]
		selfLink <- map["selfLink"]
		published <- (map["published"], RFC3339Transform())
		customMetaData <- map["customMetaData"]
		kind <- map["kind"]
		description <- map["description"]
		updated <- (map["updated"], RFC3339Transform())
		name <- map["name"]
		id <- map["id"]
		posts <- map["posts"]
		pages <- map["pages"]
		url <- map["url"]
		status <- map["status"]
	}
}

/// The Locale subtype of the Blog model type for use with the Blogger API
open class BloggerBlogLocale: ObjectType {
	/// The country this blog's locale is set to.
	open var country: String!
	/// The language this blog is authored in.
	open var language: String!
	/// The language variant this blog is authored in.
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

/// The Posts subtype of the Blog model type for use with the Blogger API
open class BloggerBlogPosts: ObjectType {
	/// The List of Posts for this Blog.
	open var items: [BloggerPost]!
	/// The URL of the container for posts in this blog.
	open var selfLink: String!
	/// The count of posts in this blog.
	open var totalItems: Int!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		items <- map["items"]
		selfLink <- map["selfLink"]
		totalItems <- map["totalItems"]
	}
}

/// The Pages subtype of the Blog model type for use with the Blogger API
open class BloggerBlogPages: ObjectType {
	/// The URL of the container for pages in this blog.
	open var selfLink: String!
	/// The count of pages in this blog.
	open var totalItems: Int!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		selfLink <- map["selfLink"]
		totalItems <- map["totalItems"]
	}
}

