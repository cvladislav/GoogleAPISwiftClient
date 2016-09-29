//
//  YoutubeCommentThread.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The CommentThread model type for use with the Youtube API
open class YoutubeCommentThread: GoogleObject {
	/// The snippet object contains basic details about the comment thread and also the top level comment.
	open var snippet: YoutubeCommentThreadSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The ID that YouTube uses to uniquely identify the comment thread.
	open var id: String!
	/// The replies object contains a limited number of replies (if any) to the top level comment found in the snippet.
	open var replies: YoutubeCommentThreadReplies!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#commentThread".
	open var kind: String = "youtube#commentThread"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		snippet <- map["snippet"]
		etag <- map["etag"]
		id <- map["id"]
		replies <- map["replies"]
		kind <- map["kind"]
	}
}

