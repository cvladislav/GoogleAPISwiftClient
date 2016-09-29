//
//  BloggerComment.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Comment model type for use with the Blogger API
open class BloggerComment: GoogleObject {
	/// The author of this Comment.
	open var author: BloggerCommentAuthor!
	/// The actual content of the comment. May include HTML markup.
	open var content: String!
	/// Data about the blog containing this comment.
	open var blog: BloggerCommentBlog!
	/// RFC 3339 date-time when this comment was published.
	open var published: Date!
	/// The identifier for this resource.
	open var id: String!
	/// Data about the post containing this comment.
	open var post: BloggerCommentPost!
	/// Data about the comment this is in reply to.
	open var inReplyTo: BloggerCommentInReplyTo!
	/// The kind of this entry. Always blogger#comment
	open var kind: String = "blogger#comment"
	/// The API REST URL to fetch this resource from.
	open var selfLink: String!
	/// RFC 3339 date-time when this comment was last updated.
	open var updated: Date!
	/// The status of the comment (only populated for admin users)
	open var status: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		author <- map["author"]
		content <- map["content"]
		blog <- map["blog"]
		published <- (map["published"], RFC3339Transform())
		id <- map["id"]
		post <- map["post"]
		inReplyTo <- map["inReplyTo"]
		kind <- map["kind"]
		selfLink <- map["selfLink"]
		updated <- (map["updated"], RFC3339Transform())
		status <- map["status"]
	}
}

/// The Image subtype of the CommentAuthor model type for use with the Blogger API
open class BloggerCommentAuthorImage: ObjectType {
	/// The comment creator's avatar URL.
	open var url: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		url <- map["url"]
	}
}

/// The Author subtype of the Comment model type for use with the Blogger API
open class BloggerCommentAuthor: ObjectType {
	/// The comment creator's avatar.
	open var image: BloggerCommentAuthorImage!
	/// The identifier of the Comment creator.
	open var id: String!
	/// The display name.
	open var displayName: String!
	/// The URL of the Comment creator's Profile page.
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

/// The Post subtype of the Comment model type for use with the Blogger API
open class BloggerCommentPost: ObjectType {
	/// The identifier of the post containing this comment.
	open var id: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
	}
}

/// The Blog subtype of the Comment model type for use with the Blogger API
open class BloggerCommentBlog: ObjectType {
	/// The identifier of the blog containing this comment.
	open var id: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
	}
}

/// The InReplyTo subtype of the Comment model type for use with the Blogger API
open class BloggerCommentInReplyTo: ObjectType {
	/// The identified of the parent of this comment.
	open var id: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		id <- map["id"]
	}
}

