//
//  BloggerPageviews.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Counts subtype of the Pageviews model type for use with the Blogger API
open class BloggerPageviewsCount: ObjectType {
	/// Time range the given count applies to
	open var timeRange: String!
	/// Count of page views for the given time range
	open var count: Int64!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		timeRange <- map["timeRange"]
		count <- map["count"]
	}
}

/// The Pageviews model type for use with the Blogger API
open class BloggerPageviews: GoogleObject {
	/// Blog Id
	open var blogId: String!
	/// The container of posts in this blog.
	open var counts: [BloggerPageviewsCount]!
	/// The kind of this entry. Always blogger#page_views
	open var kind: String = "blogger#page_views"
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		blogId <- map["blogId"]
		counts <- map["counts"]
		kind <- map["kind"]
	}
}

