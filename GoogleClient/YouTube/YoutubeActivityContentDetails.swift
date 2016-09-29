//
//  YoutubeActivityContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ActivityContentDetails model type for use with the Youtube API
open class YoutubeActivityContentDetails: ObjectType {
	/// The channelItem object contains details about a resource which was added to a channel. This property is only present if the snippet.type is channelItem.
	open var channelItem: YoutubeActivityContentDetailsChannelItem!
	/// The like object contains information about a resource that received a positive (like) rating. This property is only present if the snippet.type is like.
	open var like: YoutubeActivityContentDetailsLike!
	/// The bulletin object contains details about a channel bulletin post. This object is only present if the snippet.type is bulletin.
	open var bulletin: YoutubeActivityContentDetailsBulletin!
	/// The upload object contains information about the uploaded video. This property is only present if the snippet.type is upload.
	open var upload: YoutubeActivityContentDetailsUpload!
	/// The favorite object contains information about a video that was marked as a favorite video. This property is only present if the snippet.type is favorite.
	open var favorite: YoutubeActivityContentDetailsFavorite!
	/// The comment object contains information about a resource that received a comment. This property is only present if the snippet.type is comment.
	open var comment: YoutubeActivityContentDetailsComment!
	/// The playlistItem object contains information about a new playlist item. This property is only present if the snippet.type is playlistItem.
	open var playlistItem: YoutubeActivityContentDetailsPlaylistItem!
	/// The recommendation object contains information about a recommended resource. This property is only present if the snippet.type is recommendation.
	open var recommendation: YoutubeActivityContentDetailsRecommendation!
	/// The subscription object contains information about a channel that a user subscribed to. This property is only present if the snippet.type is subscription.
	open var subscription: YoutubeActivityContentDetailsSubscription!
	/// The promotedItem object contains details about a resource which is being promoted. This property is only present if the snippet.type is promotedItem.
	open var promotedItem: YoutubeActivityContentDetailsPromotedItem!
	/// The social object contains details about a social network post. This property is only present if the snippet.type is social.
	open var social: YoutubeActivityContentDetailsSocial!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		channelItem <- map["channelItem"]
		like <- map["like"]
		bulletin <- map["bulletin"]
		upload <- map["upload"]
		favorite <- map["favorite"]
		comment <- map["comment"]
		playlistItem <- map["playlistItem"]
		recommendation <- map["recommendation"]
		subscription <- map["subscription"]
		promotedItem <- map["promotedItem"]
		social <- map["social"]
	}
}

