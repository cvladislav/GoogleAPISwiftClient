//
//  YoutubeSubscriptionContentDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The type of activity this subscription is for (only uploads, everything).
public enum YoutubeSubscriptionContentDetailsActivityType: String {
	/// 
	case All = "all"
	/// 
	case Uploads = "uploads"
}

/// The SubscriptionContentDetails model type for use with the Youtube API
open class YoutubeSubscriptionContentDetails: ObjectType {
	/// The approximate number of items that the subscription points to.
	open var totalItemCount: UInt!
	/// The type of activity this subscription is for (only uploads, everything).
	open var activityType: YoutubeSubscriptionContentDetailsActivityType!
	/// The number of new items in the subscription since its content was last read.
	open var newItemCount: UInt!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		totalItemCount <- map["totalItemCount"]
		activityType <- map["activityType"]
		newItemCount <- map["newItemCount"]
	}
}

