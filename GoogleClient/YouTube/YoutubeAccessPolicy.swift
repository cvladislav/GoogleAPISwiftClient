//
//  YoutubeAccessPolicy.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The AccessPolicy model type for use with the Youtube API
open class YoutubeAccessPolicy: ObjectType {
	/// A list of region codes that identify countries where the default policy do not apply.
	open var exception: [String]!
	/// The value of allowed indicates whether the access to the policy is allowed or denied by default.
	open var allowed: Bool!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		exception <- map["exception"]
		allowed <- map["allowed"]
	}
}

