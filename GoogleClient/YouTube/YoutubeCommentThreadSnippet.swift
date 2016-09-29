//
//  YoutubeCommentThreadSnippet.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The CommentThreadSnippet model type for use with the Youtube API
open class YoutubeCommentThreadSnippet: ObjectType {
	/// The YouTube channel the comments in the thread refer to or the channel with the video the comments refer to. If video_id isn't set the comments refer to the channel itself.
	open var channelId: String!
	/// The top level comment of this thread.
	open var topLevelComment: YoutubeComment!
	/// The ID of the video the comments refer to, if any. No video_id implies a channel discussion comment.
	open var videoId: String!
	/// The total number of replies (not including the top level comment).
	open var totalReplyCount: UInt!
	/// Whether the current viewer of the thread can reply to it. This is viewer specific - other viewers may see a different value for this field.
	open var canReply: Bool!
	/// Whether the thread (and therefore all its comments) is visible to all YouTube users.
	open var isPublic: Bool!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelId <- map["channelId"]
		topLevelComment <- map["topLevelComment"]
		videoId <- map["videoId"]
		totalReplyCount <- map["totalReplyCount"]
		canReply <- map["canReply"]
		isPublic <- map["isPublic"]
	}
}

