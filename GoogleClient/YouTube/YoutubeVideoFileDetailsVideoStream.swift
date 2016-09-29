//
//  YoutubeVideoFileDetailsVideoStream.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The amount that YouTube needs to rotate the original source content to properly display the video.
public enum YoutubeVideoFileDetailsVideoStreamRotation: String {
	/// 
	case Clockwise = "clockwise"
	/// 
	case CounterClockwise = "counterClockwise"
	/// 
	case None = "none"
	/// 
	case Other = "other"
	/// 
	case UpsideDown = "upsideDown"
}

/// The VideoFileDetailsVideoStream model type for use with the Youtube API
open class YoutubeVideoFileDetailsVideoStream: ObjectType {
	/// The video stream's frame rate, in frames per second.
	open var frameRateFps: Double!
	/// A value that uniquely identifies a video vendor. Typically, the value is a four-letter vendor code.
	open var vendor: String!
	/// The video codec that the stream uses.
	open var codec: String!
	/// The video content's display aspect ratio, which specifies the aspect ratio in which the video should be displayed.
	open var aspectRatio: Double!
	/// The amount that YouTube needs to rotate the original source content to properly display the video.
	open var rotation: YoutubeVideoFileDetailsVideoStreamRotation!
	/// The encoded video content's height in pixels.
	open var heightPixels: UInt!
	/// The video stream's bitrate, in bits per second.
	open var bitrateBps: UInt64!
	/// The encoded video content's width in pixels. You can calculate the video's encoding aspect ratio as width_pixels / height_pixels.
	open var widthPixels: UInt!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		frameRateFps <- map["frameRateFps"]
		vendor <- map["vendor"]
		codec <- map["codec"]
		aspectRatio <- map["aspectRatio"]
		rotation <- map["rotation"]
		heightPixels <- map["heightPixels"]
		bitrateBps <- map["bitrateBps"]
		widthPixels <- map["widthPixels"]
	}
}

