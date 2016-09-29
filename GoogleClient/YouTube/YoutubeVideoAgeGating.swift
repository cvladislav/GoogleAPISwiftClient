//
//  YoutubeVideoAgeGating.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// Video game rating, if any.
public enum YoutubeVideoAgeGatingVideoGameRating: String {
	/// 
	case Anyone = "anyone"
	/// 
	case M15Plus = "m15Plus"
	/// 
	case M16Plus = "m16Plus"
	/// 
	case M17Plus = "m17Plus"
}

/// The VideoAgeGating model type for use with the Youtube API
open class YoutubeVideoAgeGating: ObjectType {
	/// Video game rating, if any.
	open var videoGameRating: YoutubeVideoAgeGatingVideoGameRating!
	/// Age-restricted trailers. For redband trailers and adult-rated video-games. Only users aged 18+ can view the content. The the field is true the content is restricted to viewers aged 18+. Otherwise The field won't be present.
	open var restricted: Bool!
	/// Indicates whether or not the video has alcoholic beverage content. Only users of legal purchasing age in a particular country, as identified by ICAP, can view the content.
	open var alcoholContent: Bool!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		videoGameRating <- map["videoGameRating"]
		restricted <- map["restricted"]
		alcoholContent <- map["alcoholContent"]
	}
}

