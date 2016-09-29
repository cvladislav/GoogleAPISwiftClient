//
//  BloggerPost.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Blog subtype of the Post model type for use with the Blogger API
open class BloggerPostBlog: ObjectType {
	/// The identifier of the Blog that contains this Post.
	open var id: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
	}
}

/// The Post model type for use with the Blogger API
open class BloggerPost: GoogleObject {
	/// The title of the Post.
	open var title: String!
	/// The content of the Post. May contain HTML markup.
	open var content: String!
	/// Display image for the Post.
	open var images: [BloggerPostImage]!
	/// RFC 3339 date-time when this Post was published.
	open var published: Date!
	/// The JSON meta-data for the Post.
	open var customMetaData: String!
	/// The kind of this entity. Always blogger#post
	open var kind: String = "blogger#post"
	/// The location for geotagged posts.
	open var location: BloggerPostLocation!
	/// Etag of the resource.
	open var etag: String!
	/// RFC 3339 date-time when this Post was last updated.
	open var updated: Date!
	/// The author of this Post.
	open var author: BloggerPostAuthor!
	/// The title link URL, similar to atom's related link.
	open var titleLink: String!
	/// Data about the blog containing this Post.
	open var blog: BloggerPostBlog!
	/// The identifier of this Post.
	open var id: String!
	/// Comment control and display setting for readers of this post.
	open var readerComments: String!
	/// The list of labels this Post was tagged with.
	open var labels: [String]!
	/// The container of comments on this Post.
	open var replies: BloggerPostReplies!
	/// Status of the post. Only set for admin-level requests
	open var status: String!
	/// The API REST URL to fetch this resource from.
	open var selfLink: String!
	/// The URL where this Post is displayed.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		title <- map["title"]
		content <- map["content"]
		images <- map["images"]
		published <- (map["published"], RFC3339Transform())
		customMetaData <- map["customMetaData"]
		kind <- map["kind"]
		location <- map["location"]
		etag <- map["etag"]
		updated <- (map["updated"], RFC3339Transform())
		author <- map["author"]
		titleLink <- map["titleLink"]
		blog <- map["blog"]
		id <- map["id"]
		readerComments <- map["readerComments"]
		labels <- map["labels"]
		replies <- map["replies"]
		status <- map["status"]
		selfLink <- map["selfLink"]
		url <- map["url"]
	}
}

/// The Author subtype of the Post model type for use with the Blogger API
open class BloggerPostAuthor: ObjectType {
	/// The Post author's avatar.
	open var image: BloggerPostImage!
	/// The identifier of the Post creator.
	open var id: String!
	/// The display name.
	open var displayName: String!
	/// The URL of the Post creator's Profile page.
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

/// The Images subtype of the Post model type for use with the Blogger API
open class BloggerPostImage: ObjectType {
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		url <- map["url"]
	}
}

/// The Location subtype of the Post model type for use with the Blogger API
open class BloggerPostLocation: ObjectType {
	/// Location's longitude.
	open var lng: Double!
	/// Location's latitude.
	open var lat: Double!
	/// Location's viewport span. Can be used when rendering a map preview.
	open var span: String!
	/// Location name.
	open var name: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		lng <- map["lng"]
		lat <- map["lat"]
		span <- map["span"]
		name <- map["name"]
	}
}

/// The Replies subtype of the Post model type for use with the Blogger API
open class BloggerPostReplies: ObjectType {
	/// The List of Comments for this Post.
	open var items: [BloggerComment]!
	/// The URL of the comments on this post.
	open var selfLink: String!
	/// The count of comments on this post.
	open var totalItems: Int64!
	
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

/// The Image subtype of the PostAuthor model type for use with the Blogger API
open class BloggerPostAuthorImage: ObjectType {
	/// The Post author's avatar URL.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		url <- map["url"]
	}
}

