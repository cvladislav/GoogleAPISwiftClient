//
//  YoutubePropertyValue.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The PropertyValue model type for use with the Youtube API
open class YoutubePropertyValue: ObjectType {
	/// The property's value.
	open var value: String!
	/// A property.
	open var property: String!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		value <- map["value"]
		property <- map["property"]
	}
}

