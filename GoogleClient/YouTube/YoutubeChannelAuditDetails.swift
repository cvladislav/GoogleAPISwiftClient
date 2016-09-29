//
//  YoutubeChannelAuditDetails.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The ChannelAuditDetails model type for use with the Youtube API
open class YoutubeChannelAuditDetails: ObjectType {
	/// Describes the general state of the channel. This field will always show if there are any issues whatsoever with the channel. Currently this field represents the result of the logical and operation over the community guidelines good standing, the copyright strikes good standing and the content ID claims good standing, but this may change in the future.
	open var overallGoodStanding: Bool!
	/// Whether or not the channel has any unresolved claims.
	open var contentIdClaimsGoodStanding: Bool!
	/// Whether or not the channel has any copyright strikes.
	open var copyrightStrikesGoodStanding: Bool!
	/// Whether or not the channel respects the community guidelines.
	open var communityGuidelinesGoodStanding: Bool!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		overallGoodStanding <- map["overallGoodStanding"]
		contentIdClaimsGoodStanding <- map["contentIdClaimsGoodStanding"]
		copyrightStrikesGoodStanding <- map["copyrightStrikesGoodStanding"]
		communityGuidelinesGoodStanding <- map["communityGuidelinesGoodStanding"]
	}
}

