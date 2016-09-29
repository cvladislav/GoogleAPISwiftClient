//
//  YoutubeVideo.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The Video model type for use with the Youtube API
open class YoutubeVideo: GoogleObject {
	/// The liveStreamingDetails object contains metadata about a live video broadcast. The object will only be present in a video resource if the video is an upcoming, live, or completed live broadcast.
	open var liveStreamingDetails: YoutubeVideoLiveStreamingDetails!
	/// The suggestions object encapsulates suggestions that identify opportunities to improve the video quality or the metadata for the uploaded video. This data can only be retrieved by the video owner.
	open var suggestions: YoutubeVideoSuggestions!
	/// Age restriction details related to a video. This data can only be retrieved by the video owner.
	open var ageGating: YoutubeVideoAgeGating!
	/// Identifies what kind of resource this is. Value: the fixed string "youtube#video".
	open var kind: String = "youtube#video"
	/// The contentDetails object contains information about the video content, including the length of the video and its aspect ratio.
	open var contentDetails: YoutubeVideoContentDetails!
	/// The snippet object contains basic details about the video, such as its title, description, and category.
	open var snippet: YoutubeVideoSnippet!
	/// Etag of this resource.
	open var etag: String!
	/// The fileDetails object encapsulates information about the video file that was uploaded to YouTube, including the file's resolution, duration, audio and video codecs, stream bitrates, and more. This data can only be retrieved by the video owner.
	open var fileDetails: YoutubeVideoFileDetails!
	/// The statistics object contains statistics about the video.
	open var statistics: YoutubeVideoStatistics!
	/// The topicDetails object encapsulates information about Freebase topics associated with the video.
	open var topicDetails: YoutubeVideoTopicDetails!
	/// The ID that YouTube uses to uniquely identify the video.
	open var id: String!
	/// The recordingDetails object encapsulates information about the location, date and address where the video was recorded.
	open var recordingDetails: YoutubeVideoRecordingDetails!
	/// The player object contains information that you would use to play the video in an embedded player.
	open var player: YoutubeVideoPlayer!
	/// The monetizationDetails object encapsulates information about the monetization status of the video.
	open var monetizationDetails: YoutubeVideoMonetizationDetails!
	/// List with all localizations.
	open var localizations: [String: YoutubeVideoLocalization]!
	/**
	The processingProgress object encapsulates information about YouTube's progress in processing the uploaded video file. The properties in the object identify the current processing status and an estimate of the time remaining until YouTube finishes processing the video. This part also indicates whether different types of data or content, such as file details or thumbnail images, are available for the video.
	
	The processingProgress object is designed to be polled so that the video uploaded can track the progress that YouTube has made in processing the uploaded video file. This data can only be retrieved by the video owner.*/
	open var processingDetails: YoutubeVideoProcessingDetails!
	/// The projectDetails object contains information about the project specific video metadata.
	open var projectDetails: YoutubeVideoProjectDetails!
	/// The status object contains information about the video's uploading, processing, and privacy statuses.
	open var status: YoutubeVideoStatus!
	
	public required init?(map: Map) {

	}

	public init() {

	}

	open func mapping(map: Map) {
		liveStreamingDetails <- map["liveStreamingDetails"]
		suggestions <- map["suggestions"]
		ageGating <- map["ageGating"]
		kind <- map["kind"]
		contentDetails <- map["contentDetails"]
		snippet <- map["snippet"]
		etag <- map["etag"]
		fileDetails <- map["fileDetails"]
		statistics <- map["statistics"]
		topicDetails <- map["topicDetails"]
		id <- map["id"]
		recordingDetails <- map["recordingDetails"]
		player <- map["player"]
		monetizationDetails <- map["monetizationDetails"]
		localizations <- map["localizations"]
		processingDetails <- map["processingDetails"]
		projectDetails <- map["projectDetails"]
		status <- map["status"]
	}
}

