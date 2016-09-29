//
//  YoutubeVideoSuggestions.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The VideoSuggestions model type for use with the Youtube API
open class YoutubeVideoSuggestions: ObjectType {
	/// A list of reasons why YouTube may have difficulty transcoding the uploaded video or that might result in an erroneous transcoding. These warnings are generated before YouTube actually processes the uploaded video file. In addition, they identify issues that are unlikely to cause the video processing to fail but that might cause problems such as sync issues, video artifacts, or a missing audio track.
	open var processingWarnings: [String]!
	/// A list of errors that will prevent YouTube from successfully processing the uploaded video video. These errors indicate that, regardless of the video's current processing status, eventually, that status will almost certainly be failed.
	open var processingErrors: [String]!
	/// A list of suggestions that may improve YouTube's ability to process the video.
	open var processingHints: [String]!
	/// A list of keyword tags that could be added to the video's metadata to increase the likelihood that users will locate your video when searching or browsing on YouTube.
	open var tagSuggestions: [YoutubeVideoSuggestionsTagSuggestion]!
	/// A list of video editing operations that might improve the video quality or playback experience of the uploaded video.
	open var editorSuggestions: [String]!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		processingWarnings <- map["processingWarnings"]
		processingErrors <- map["processingErrors"]
		processingHints <- map["processingHints"]
		tagSuggestions <- map["tagSuggestions"]
		editorSuggestions <- map["editorSuggestions"]
	}
}

