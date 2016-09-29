//
//  YoutubePromotedItem.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PromotedItem model type for use with the Youtube API
open class YoutubePromotedItem: ObjectType {
	/// The temporal position within the video where the promoted item will be displayed. If present, it overrides the default timing.
	open var timing: YoutubeInvideoTiming!
	/// If true, the content owner's name will be used when displaying the promotion. This field can only be set when the update is made on behalf of the content owner.
	open var promotedByContentOwner: Bool!
	/// Identifies the promoted item.
	open var id: YoutubePromotedItemId!
	/// A custom message to display for this promotion. This field is currently ignored unless the promoted item is a website.
	open var customMessage: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		timing <- map["timing"]
		promotedByContentOwner <- map["promotedByContentOwner"]
		id <- map["id"]
		customMessage <- map["customMessage"]
	}
}

