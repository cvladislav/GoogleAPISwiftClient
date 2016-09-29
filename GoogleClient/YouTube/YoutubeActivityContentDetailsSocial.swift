//
//  YoutubeActivityContentDetailsSocial.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetailsSocial model type for use with the Youtube API
open class YoutubeActivityContentDetailsSocial: ObjectType {
	/// The author of the social network post.
	open var author: String!
	/// The URL of the social network post.
	open var referenceUrl: String!
	/// The resourceId object encapsulates information that identifies the resource associated with a social network post.
	open var resourceId: YoutubeResourceId!
	/// An image of the post's author.
	open var imageUrl: String!
	/// The name of the social network.
	open var type: YoutubeActivityContentDetailsSocialType!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		author <- map["author"]
		referenceUrl <- map["referenceUrl"]
		resourceId <- map["resourceId"]
		imageUrl <- map["imageUrl"]
		type <- map["type"]
	}
}

/// The name of the social network.
public enum YoutubeActivityContentDetailsSocialType: String {
	/// 
	case Facebook = "facebook"
	/// 
	case GooglePlus = "googlePlus"
	/// 
	case Twitter = "twitter"
	/// 
	case Unspecified = "unspecified"
}

