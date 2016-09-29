//
//  YoutubeChannelContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The RelatedPlaylists subtype of the ChannelContentDetails model type for use with the Youtube API
open class YoutubeChannelContentDetailsRelatedPlaylists: ObjectType {
	/// The ID of the playlist that contains the channel"s uploaded videos. Use the  videos.insert method to upload new videos and the videos.delete method to delete previously uploaded videos.
	open var uploads: String!
	/// The ID of the playlist that contains the channel"s watch later playlist. Use the playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	open var watchLater: String!
	/// The ID of the playlist that contains the channel"s watch history. Use the  playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	open var watchHistory: String!
	/// The ID of the playlist that contains the channel"s liked videos. Use the   playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	open var likes: String!
	/// The ID of the playlist that contains the channel"s favorite videos. Use the  playlistItems.insert and  playlistItems.delete to add or remove items from that list.
	open var favorites: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		uploads <- map["uploads"]
		watchLater <- map["watchLater"]
		watchHistory <- map["watchHistory"]
		likes <- map["likes"]
		favorites <- map["favorites"]
	}
}

/// The ChannelContentDetails model type for use with the Youtube API
open class YoutubeChannelContentDetails: ObjectType {
	open var relatedPlaylists: YoutubeChannelContentDetailsRelatedPlaylists!
	/// The googlePlusUserId object identifies the Google+ profile ID associated with this channel.
	open var googlePlusUserId: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		relatedPlaylists <- map["relatedPlaylists"]
		googlePlusUserId <- map["googlePlusUserId"]
	}
}

