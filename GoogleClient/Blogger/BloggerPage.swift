//
//  BloggerPage.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Blog subtype of the Page model type for use with the Blogger API
open class BloggerPageBlog: ObjectType {
	/// The identifier of the blog containing this page.
	open var id: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
	}
}

/// The Page model type for use with the Blogger API
open class BloggerPage: GoogleObject {
	/// The author of this Page.
	open var author: BloggerPageAuthor!
	/// The title of this entity. This is the name displayed in the Admin user interface.
	open var title: String!
	/// Data about the blog containing this Page.
	open var blog: BloggerPageBlog!
	/// RFC 3339 date-time when this Page was published.
	open var published: Date!
	/// The identifier for this resource.
	open var id: String!
	/// The body content of this Page, in HTML.
	open var content: String!
	/// The URL that this Page is displayed at.
	open var url: String!
	/// The kind of this entity. Always blogger#page
	open var kind: String = "blogger#page"
	/// Etag of the resource.
	open var etag: String!
	/// The status of the page for admin resources (either LIVE or DRAFT).
	open var status: String!
	/// The API REST URL to fetch this resource from.
	open var selfLink: String!
	/// RFC 3339 date-time when this Page was last updated.
	open var updated: Date!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		author <- map["author"]
		title <- map["title"]
		blog <- map["blog"]
		published <- (map["published"], RFC3339Transform())
		id <- map["id"]
		content <- map["content"]
		url <- map["url"]
		kind <- map["kind"]
		etag <- map["etag"]
		status <- map["status"]
		selfLink <- map["selfLink"]
		updated <- (map["updated"], RFC3339Transform())
	}
}

/// The Image subtype of the PageAuthor model type for use with the Blogger API
open class BloggerPageAuthorImage: ObjectType {
	/// The page author's avatar URL.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		url <- map["url"]
	}
}

/// The Author subtype of the Page model type for use with the Blogger API
open class BloggerPageAuthor: ObjectType {
	/// The page author's avatar.
	open var image: BloggerPageAuthorImage!
	/// The identifier of the Page creator.
	open var id: String!
	/// The display name.
	open var displayName: String!
	/// The URL of the Page creator's Profile page.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		image <- map["image"]
		id <- map["id"]
		displayName <- map["displayName"]
		url <- map["url"]
	}
}

