//
//  Youtube.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 5/16/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

/// The order parameter specifies the method that will be used to order resources in the API response.
public enum YoutubeSearchOrder: String {
	/// Resources are sorted in reverse chronological order based on the date they were created.
	case Date = "date"
	/// Resources are sorted from highest to lowest rating.
	case Rating = "rating"
	/// Resources are sorted based on their relevance to the search query. This is the default value for this parameter.
	case Relevance = "relevance"
	/// Resources are sorted alphabetically by title.
	case Title = "title"
	/// Channels are sorted in descending order of their number of uploaded videos.
	case VideoCount = "videoCount"
	/// Resources are sorted from highest to lowest number of views.
	case ViewCount = "viewCount"
}

/// The videoCaption parameter indicates whether the API should filter video search results based on whether they have captions. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoCaption: String {
	/// Do not filter results based on caption availability.
	case AnyCaption = "any"
	/// Only include videos that have captions.
	case ClosedCaption = "closedCaption"
	/// Only include videos that do not have captions.
	case None = "none"
}

/**
	Set this parameter to limit the returned comment threads to a particular moderation state.
	
	Note: This parameter is not supported for use in conjunction with the id parameter.*/
public enum YoutubeCommentThreadsModerationStatus: String {
	/// Retrieve comment threads that are awaiting review by a moderator. A comment thread can be included in the response if the top-level comment or at least one of the replies to that comment are awaiting review.
	case HeldForReview = "heldForReview"
	/// Retrieve comment threads classified as likely to be spam. A comment thread can be included in the response if the top-level comment or at least one of the replies to that comment is considered likely to be spam.
	case LikelySpam = "likelySpam"
	/// Retrieve threads of published comments. This is the default value. A comment thread can be included in the response if its top-level comment has been published.
	case Published = "published"
}

/// Specifies the rating to record.
public enum YoutubeVideosRating: String {
	/// Records that the authenticated user disliked the video.
	case Dislike = "dislike"
	/// Records that the authenticated user liked the video.
	case Like = "like"
	/// Removes any rating that the authenticated user had previously set for the video.
	case None = "none"
}

/// The videoEmbeddable parameter lets you to restrict a search to only videos that can be embedded into a webpage. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoEmbeddable: String {
	/// Return all videos, embeddable or not.
	case AnyEmbeddable = "any"
	/// Only retrieve embeddable videos.
	case True = "true"
}

/// The broadcastStatus parameter identifies the state to which the broadcast is changing. Note that to transition a broadcast to either the testing or live state, the status.streamStatus must be active for the stream that the broadcast is bound to.
public enum YoutubeLiveBroadcastsBroadcastStatus: String {
	/// The broadcast is over. YouTube stops transmitting video.
	case Complete = "complete"
	/// The broadcast is visible to its audience. YouTube transmits video to the broadcast's monitor stream and its broadcast stream.
	case Live = "live"
	/// Start testing the broadcast. YouTube transmits video to the broadcast's monitor stream. Note that you can only transition a broadcast to the testing state if its contentDetails.monitorStream.enableMonitorStream property is set to true.
	case Testing = "testing"
}

/// The broadcastType parameter filters the API response to only include broadcasts with the specified type. This is only compatible with the mine filter for now.
public enum YoutubeLiveBroadcastsBroadcastType: String {
	/// Return all broadcasts.
	case All = "all"
	/// Return only scheduled event broadcasts.
	case Event = "event"
	/// Return only persistent broadcasts.
	case Persistent = "persistent"
}

/// Supports core YouTube features, such as uploading videos, creating and managing playlists, searching for content, and much more.
open class Youtube: GoogleService {
	var apiNameInURL: String = "youtube"
	var apiVersionString: String = "v3"

	open let fetcher: GoogleServiceFetcher = GoogleServiceFetcher()
    
    public required init() {
        
    }

	/// IP address of the site where the request originates. Use this if you want to enforce per-user limits.
	open var userIp: String!
	/// Returns response with indentations and line breaks.
	open var prettyPrint: Bool = true
	/// Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
	open var quotaUser: String!
	/// Selector specifying which fields to include in a partial response.
	open var fields: String!
	/// Data format for the response.
	open var alt: YoutubeAlt = .Json
	
	/**
	Note: This parameter is intended exclusively for YouTube content partners.
	
	The onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.*/
	open var onBehalfOfContentOwner: String!
	
	/// Uploads a watermark image to YouTube and sets it for a channel.
	open func setWatermarks(_ invideoBranding: YoutubeInvideoBranding, channelId: String, uploadParameters: UploadParameters, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(channelId, forKey: "channelId")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
        fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "watermarks/set", queryParams: queryParams, postBody: Mapper<YoutubeInvideoBranding>().toJSON(invideoBranding) as [String: AnyObject], uploadParameters: uploadParameters) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Deletes a channel's watermark image.
	open func unsetWatermarks(_ channelId: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(channelId, forKey: "channelId")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "watermarks/unset", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Uploads a custom video thumbnail to YouTube and sets it for a video.
	open func setThumbnails(_ videoId: String, uploadParameters: UploadParameters, completionHandler: @escaping (_ thumbnailSetResponse: YoutubeThumbnailSetResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(videoId, forKey: "videoId")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "thumbnails/set", queryParams: queryParams, uploadParameters: uploadParameters) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let thumbnailSetResponse = Mapper<YoutubeThumbnailSetResponse>().map(JSON: json)
				completionHandler(thumbnailSetResponse, nil)
			}
		}
	}

	/// Adds a new ban to the chat.
	open func insertLiveChatBans(_ liveChatBan: YoutubeLiveChatBan, part: String, completionHandler: @escaping (_ liveChatBan: YoutubeLiveChatBan?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
        fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/bans", queryParams: queryParams, postBody: Mapper<YoutubeLiveChatBan>().toJSON(liveChatBan) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveChatBan = Mapper<YoutubeLiveChatBan>().map(JSON: json)
				completionHandler(liveChatBan, nil)
			}
		}
	}

	/// Removes a chat ban.
	open func deleteLiveChatBans(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/bans", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// The regionCode parameter instructs the API to return the list of video categories available in the specified country. The parameter value is an ISO 3166-1 alpha-2 country code.
	open var regionCode: String!
	/// The id parameter specifies a comma-separated list of video category IDs for the resources that you are retrieving.
	open var id: String!
	/// The hl parameter specifies the language that should be used for text values in the API response.
	open var hl: String = "en_US"
	
	/// Returns a list of categories that can be associated with YouTube videos.
	open func listVideoCategories(_ part: String, completionHandler: @escaping (_ videoCategoryListResponse: YoutubeVideoCategoryListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videoCategories", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let videoCategoryListResponse = Mapper<YoutubeVideoCategoryListResponse>().map(JSON: json)
				completionHandler(videoCategoryListResponse, nil)
			}
		}
	}

	/// Adds a new moderator for the chat.
	open func insertLiveChatModerators(_ liveChatModerator: YoutubeLiveChatModerator, part: String, completionHandler: @escaping (_ liveChatModerator: YoutubeLiveChatModerator?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
        fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/moderators", queryParams: queryParams, postBody: Mapper<YoutubeLiveChatModerator>().toJSON(liveChatModerator) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveChatModerator = Mapper<YoutubeLiveChatModerator>().map(JSON: json)
				completionHandler(liveChatModerator, nil)
			}
		}
	}

	/// The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.
	open var pageToken: String!
	/// The maxResults parameter specifies the maximum number of items that should be returned in the result set.
	open var maxResults: UInt = 5
	
	/// Lists moderators for a live chat.
	open func listLiveChatModerators(_ liveChatId: String, part: String, completionHandler: @escaping (_ liveChatModeratorlistResponse: YoutubeLiveChatModeratorListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(liveChatId, forKey: "liveChatId")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/moderators", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveChatModeratorlistResponse = Mapper<YoutubeLiveChatModeratorListResponse>().map(JSON: json)
				completionHandler(liveChatModeratorlistResponse, nil)
			}
		}
	}

	/// Removes a chat moderator.
	open func deleteLiveChatModerators(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/moderators", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/**
	This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.
	
	The onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.
	
	This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.*/
	open var onBehalfOfContentOwnerChannel: String!
	
	/// Creates a playlist.
	open func insertPlaylists(_ playlist: YoutubePlaylist, part: String, completionHandler: @escaping (_ playlist: YoutubePlaylist?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams, postBody: Mapper<YoutubePlaylist>().toJSON(playlist) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let playlist = Mapper<YoutubePlaylist>().map(JSON: json)
				completionHandler(playlist, nil)
			}
		}
	}

	/// Deletes a playlist.
	open func deletePlaylists(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// This value indicates that the API should only return the specified channel's playlists.
	open var channelId: String!
	/// Set this parameter's value to true to instruct the API to only return playlists owned by the authenticated user.
	open var mine: Bool!
	
	/// Returns a collection of playlists that match the API request parameters. For example, you can retrieve all playlists that the authenticated user owns, or you can retrieve one or more playlists by their unique IDs.
	open func listPlaylists(_ part: String, completionHandler: @escaping (_ playlistListResponse: YoutubePlaylistListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let playlistListResponse = Mapper<YoutubePlaylistListResponse>().map(JSON: json)
				completionHandler(playlistListResponse, nil)
			}
		}
	}

	/// Modifies a playlist. For example, you could change a playlist's title, description, or privacy status.
	open func updatePlaylists(_ playlist: YoutubePlaylist, part: String, completionHandler: @escaping (_ playlist: YoutubePlaylist?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlists", queryParams: queryParams, postBody: Mapper<YoutubePlaylist>().toJSON(playlist) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let playlist = Mapper<YoutubePlaylist>().map(JSON: json)
				completionHandler(playlist, nil)
			}
		}
	}

	/**
	Uploads a channel banner image to YouTube. This method represents the first two steps in a three-step process to update the banner image for a channel:
	
	- Call the channelBanners.insert method to upload the binary image data to YouTube. The image must have a 16:9 aspect ratio and be at least 2120x1192 pixels.
	- Extract the url property's value from the response that the API returns for step 1.
	- Call the channels.update method to update the channel's branding settings. Set the brandingSettings.image.bannerExternalUrl property's value to the URL obtained in step 2.*/
	open func insertChannelBanners(_ channelBannerResource: YoutubeChannelBannerResource, uploadParameters: UploadParameters, completionHandler: @escaping (_ channelBannerResource: YoutubeChannelBannerResource?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelBanners/insert", queryParams: queryParams, postBody: Mapper<YoutubeChannelBannerResource>().toJSON(channelBannerResource) as [String: AnyObject], uploadParameters: uploadParameters) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let channelBannerResource = Mapper<YoutubeChannelBannerResource>().map(JSON: json)
				completionHandler(channelBannerResource, nil)
			}
		}
	}

	/// Adds a channelSection for the authenticated user's channel.
	open func insertChannelSections(_ channelSection: YoutubeChannelSection, part: String, completionHandler: @escaping (_ channelSection: YoutubeChannelSection?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams, postBody: Mapper<YoutubeChannelSection>().toJSON(channelSection) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let channelSection = Mapper<YoutubeChannelSection>().map(JSON: json)
				completionHandler(channelSection, nil)
			}
		}
	}

	/// Deletes a channelSection.
	open func deleteChannelSections(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Returns channelSection resources that match the API request criteria.
	open func listChannelSections(_ part: String, completionHandler: @escaping (_ channelSectionListResponse: YoutubeChannelSectionListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		queryParams.updateValue(part, forKey: "part")
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let channelSectionListResponse = Mapper<YoutubeChannelSectionListResponse>().map(JSON: json)
				completionHandler(channelSectionListResponse, nil)
			}
		}
	}

	/// Update a channelSection.
	open func updateChannelSections(_ channelSection: YoutubeChannelSection, part: String, completionHandler: @escaping (_ channelSection: YoutubeChannelSection?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channelSections", queryParams: queryParams, postBody: Mapper<YoutubeChannelSection>().toJSON(channelSection) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let channelSection = Mapper<YoutubeChannelSection>().map(JSON: json)
				completionHandler(channelSection, nil)
			}
		}
	}

	/// ID of the Google+ Page for the channel that the request is be on behalf of
	open var onBehalfOf: String!
	/**
	The sync parameter indicates whether YouTube should automatically synchronize the caption file with the audio track of the video. If you set the value to true, YouTube will disregard any time codes that are in the uploaded caption file and generate new time codes for the captions.
	
	You should set the sync parameter to true if you are uploading a transcript, which has no time codes, or if you suspect the time codes in your file are incorrect and want YouTube to try to fix them.*/
	open var sync: Bool!
	
	/// Uploads a caption track.
	open func insertCaptions(_ caption: YoutubeCaption, part: String, uploadParameters: UploadParameters, completionHandler: @escaping (_ caption: YoutubeCaption?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let sync = sync {
			queryParams.updateValue(sync.toJSONString(), forKey: "sync")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams, postBody: Mapper<YoutubeCaption>().toJSON(caption) as [String: AnyObject], uploadParameters: uploadParameters) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let caption = Mapper<YoutubeCaption>().map(JSON: json)
				completionHandler(caption, nil)
			}
		}
	}

	/// Deletes a specified caption track.
	open func deleteCaptions(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Returns a list of caption tracks that are associated with a specified video. Note that the API response does not contain the actual captions and that the captions.download method provides the ability to retrieve a caption track.
	open func listCaptions(_ videoId: String, part: String, completionHandler: @escaping (_ captionListResponse: YoutubeCaptionListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(videoId, forKey: "videoId")
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let captionListResponse = Mapper<YoutubeCaptionListResponse>().map(JSON: json)
				completionHandler(captionListResponse, nil)
			}
		}
	}

	/// Updates a caption track. When updating a caption track, you can change the track's draft status, upload a new caption file for the track, or both.
	open func updateCaptions(_ caption: YoutubeCaption, part: String, uploadParameters: UploadParameters, completionHandler: @escaping (_ caption: YoutubeCaption?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let sync = sync {
			queryParams.updateValue(sync.toJSONString(), forKey: "sync")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions", queryParams: queryParams, postBody: Mapper<YoutubeCaption>().toJSON(caption) as [String: AnyObject], uploadParameters: uploadParameters) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let caption = Mapper<YoutubeCaption>().map(JSON: json)
				completionHandler(caption, nil)
			}
		}
	}

	/// The tfmt parameter specifies that the caption track should be returned in a specific format. If the parameter is not included in the request, the track is returned in its original format.
	open var tfmt: YoutubeCaptionsTfmt!
	/// The tlang parameter specifies that the API response should return a translation of the specified caption track. The parameter value is an ISO 639-1 two-letter language code that identifies the desired caption language. The translation is generated by using machine translation, such as Google Translate.
	open var tlang: String!
	
	/// Downloads a caption track. The caption track is returned in its original format unless the request specifies a value for the tfmt parameter and in its original language unless the request specifies a value for the tlang parameter.
	open func downloadCaptions(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let tfmt = tfmt {
			queryParams.updateValue(tfmt.rawValue, forKey: "tfmt")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOf = onBehalfOf {
			queryParams.updateValue(onBehalfOf, forKey: "onBehalfOf")
		}
		if let tlang = tlang {
			queryParams.updateValue(tlang, forKey: "tlang")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "captions/\(id)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// The forUsername parameter specifies a YouTube username, thereby requesting the channel associated with that username.
	open var forUsername: String!
	/// The categoryId parameter specifies a YouTube guide category, thereby requesting YouTube channels associated with that category.
	open var categoryId: String!
	/**
	Note: This parameter is intended exclusively for YouTube content partners.
	
	Set this parameter's value to true to instruct the API to only return channels managed by the content owner that the onBehalfOfContentOwner parameter specifies. The user must be authenticated as a CMS account linked to the specified content owner and onBehalfOfContentOwner must be provided.*/
	open var managedByMe: Bool!
	/// Use the subscriptions.list method and its mySubscribers parameter to retrieve a list of subscribers to the authenticated user's channel.
	open var mySubscribers: Bool!
	
	/// Returns a collection of zero or more channel resources that match the request criteria.
	open func listChannels(_ part: String, completionHandler: @escaping (_ channelListResponse: YoutubeChannelListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let forUsername = forUsername {
			queryParams.updateValue(forUsername, forKey: "forUsername")
		}
		if let categoryId = categoryId {
			queryParams.updateValue(categoryId, forKey: "categoryId")
		}
		if let managedByMe = managedByMe {
			queryParams.updateValue(managedByMe.toJSONString(), forKey: "managedByMe")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mySubscribers = mySubscribers {
			queryParams.updateValue(mySubscribers.toJSONString(), forKey: "mySubscribers")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channels", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let channelListResponse = Mapper<YoutubeChannelListResponse>().map(JSON: json)
				completionHandler(channelListResponse, nil)
			}
		}
	}

	/// Updates a channel's metadata. Note that this method currently only supports updates to the channel resource's brandingSettings and invideoPromotion objects and their child properties.
	open func updateChannels(_ channel: YoutubeChannel, part: String, completionHandler: @escaping (_ channel: YoutubeChannel?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "channels", queryParams: queryParams, postBody: Mapper<YoutubeChannel>().toJSON(channel) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let channel = Mapper<YoutubeChannel>().map(JSON: json)
				completionHandler(channel, nil)
			}
		}
	}

	/// Creates a broadcast.
	open func insertLiveBroadcasts(_ liveBroadcast: YoutubeLiveBroadcast, part: String, completionHandler: @escaping (_ liveBroadcast: YoutubeLiveBroadcast?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams, postBody: Mapper<YoutubeLiveBroadcast>().toJSON(liveBroadcast) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON: json)
				completionHandler(liveBroadcast, nil)
			}
		}
	}

	/// The walltime parameter specifies the wall clock time at which the specified slate change will occur. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.
	open var walltime: Date!
	/**
	The offsetTimeMs parameter specifies a positive time offset when the specified slate change will occur. The value is measured in milliseconds from the beginning of the broadcast's monitor stream, which is the time that the testing phase for the broadcast began. Even though it is specified in milliseconds, the value is actually an approximation, and YouTube completes the requested action as closely as possible to that time.
	
	If you do not specify a value for this parameter, then YouTube performs the action as soon as possible. See the Getting started guide for more details.
	
	Important: You should only specify a value for this parameter if your broadcast stream is delayed.*/
	open var offsetTimeMs: UInt64!
	/// The displaySlate parameter specifies whether the slate is being enabled or disabled.
	open var displaySlate: Bool!
	
	/// Controls the settings for a slate that can be displayed in the broadcast stream.
	open func controlLiveBroadcasts(_ id: String, part: String, completionHandler: @escaping (_ liveBroadcast: YoutubeLiveBroadcast?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let walltime = walltime {
			queryParams.updateValue(walltime.toJSONString(), forKey: "walltime")
		}
		queryParams.updateValue(id, forKey: "id")
		if let offsetTimeMs = offsetTimeMs {
			queryParams.updateValue(offsetTimeMs.toJSONString(), forKey: "offsetTimeMs")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let displaySlate = displaySlate {
			queryParams.updateValue(displaySlate.toJSONString(), forKey: "displaySlate")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts/control", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON: json)
				completionHandler(liveBroadcast, nil)
			}
		}
	}

	/// Deletes a broadcast.
	open func deleteLiveBroadcasts(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// The streamId parameter specifies the unique ID of the video stream that is being bound to a broadcast. If this parameter is omitted, the API will remove any existing binding between the broadcast and a video stream.
	open var streamId: String!
	
	/// Binds a YouTube broadcast to a stream or removes an existing binding between a broadcast and a stream. A broadcast can only be bound to one video stream, though a video stream may be bound to more than one broadcast.
	open func bindLiveBroadcasts(_ id: String, part: String, completionHandler: @escaping (_ liveBroadcast: YoutubeLiveBroadcast?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let streamId = streamId {
			queryParams.updateValue(streamId, forKey: "streamId")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts/bind", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON: json)
				completionHandler(liveBroadcast, nil)
			}
		}
	}

	/// Updates a broadcast. For example, you could modify the broadcast settings defined in the liveBroadcast resource's contentDetails object.
	open func updateLiveBroadcasts(_ liveBroadcast: YoutubeLiveBroadcast, part: String, completionHandler: @escaping (_ liveBroadcast: YoutubeLiveBroadcast?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams, postBody: Mapper<YoutubeLiveBroadcast>().toJSON(liveBroadcast) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON: json)
				completionHandler(liveBroadcast, nil)
			}
		}
	}

	/// The broadcastStatus parameter filters the API response to only include broadcasts with the specified status.
	open var broadcastStatus: YoutubeLiveBroadcastsBroadcastStatus!
	/// The broadcastType parameter filters the API response to only include broadcasts with the specified type. This is only compatible with the mine filter for now.
	open var broadcastType: YoutubeLiveBroadcastsBroadcastType = .Event
	
	/// Returns a list of YouTube broadcasts that match the API request parameters.
	open func listLiveBroadcasts(_ part: String, completionHandler: @escaping (_ liveBroadcastlistResponse: YoutubeLiveBroadcastListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let broadcastStatus = broadcastStatus {
			queryParams.updateValue(broadcastStatus.rawValue, forKey: "broadcastStatus")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(broadcastType.rawValue, forKey: "broadcastType")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveBroadcastlistResponse = Mapper<YoutubeLiveBroadcastListResponse>().map(JSON: json)
				completionHandler(liveBroadcastlistResponse, nil)
			}
		}
	}

	/// Changes the status of a YouTube live broadcast and initiates any processes associated with the new status. For example, when you transition a broadcast's status to testing, YouTube starts to transmit video to that broadcast's monitor stream. Before calling this method, you should confirm that the value of the status.streamStatus property for the stream bound to your broadcast is active.
	open func transitionLiveBroadcasts(_ broadcastStatus: YoutubeLiveBroadcastsBroadcastStatus, id: String, part: String, completionHandler: @escaping (_ liveBroadcast: YoutubeLiveBroadcast?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(broadcastStatus.rawValue, forKey: "broadcastStatus")
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveBroadcasts/transition", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveBroadcast = Mapper<YoutubeLiveBroadcast>().map(JSON: json)
				completionHandler(liveBroadcast, nil)
			}
		}
	}

	/// Expresses the caller's opinion that one or more comments should be flagged as spam.
	open func markAsSpamComments(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments/markAsSpam", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Creates a reply to an existing comment. Note: To create a top-level comment, use the commentThreads.insert method.
	open func insertComments(_ comment: YoutubeComment, part: String, completionHandler: @escaping (_ comment: YoutubeComment?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams, postBody: Mapper<YoutubeComment>().toJSON(comment) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let comment = Mapper<YoutubeComment>().map(JSON: json)
				completionHandler(comment, nil)
			}
		}
	}

	/**
	The banAuthor parameter lets you indicate that you want to automatically reject any additional comments written by the comment's author. Set the parameter value to true to ban the author.
	
	Note: This parameter is only valid if the moderationStatus parameter is also set to rejected.*/
	open var banAuthor: Bool = false
	
	/// Sets the moderation status of one or more comments. The API request must be authorized by the owner of the channel or video associated with the comments.
	open func setModerationStatusComments(_ id: String, moderationStatus: YoutubeCommentsModerationStatus, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		queryParams.updateValue(moderationStatus.rawValue, forKey: "moderationStatus")
		queryParams.updateValue(banAuthor.toJSONString(), forKey: "banAuthor")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments/setModerationStatus", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Deletes a comment.
	open func deleteComments(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// This parameter indicates whether the API should return comments formatted as HTML or as plain text.
	open var textFormat: YoutubeCommentsTextFormat = .Html
	/**
	The parentId parameter specifies the ID of the comment for which replies should be retrieved.
	
	Note: YouTube currently supports replies only for top-level comments. However, replies to replies may be supported in the future.*/
	open var parentId: String!
	
	/// Returns a list of comments that match the API request parameters.
	open func listComments(_ part: String, completionHandler: @escaping (_ commentListResponse: YoutubeCommentListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(textFormat.rawValue, forKey: "textFormat")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let parentId = parentId {
			queryParams.updateValue(parentId, forKey: "parentId")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let commentListResponse = Mapper<YoutubeCommentListResponse>().map(JSON: json)
				completionHandler(commentListResponse, nil)
			}
		}
	}

	/// Modifies a comment.
	open func updateComments(_ comment: YoutubeComment, part: String, completionHandler: @escaping (_ comment: YoutubeComment?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "comments", queryParams: queryParams, postBody: Mapper<YoutubeComment>().toJSON(comment) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let comment = Mapper<YoutubeComment>().map(JSON: json)
				completionHandler(comment, nil)
			}
		}
	}

	/// Lists fan funding events for a channel.
	open func listFanFundingEvents(_ part: String, completionHandler: @escaping (_ fanfundingEventListResponse: YoutubeFanFundingEventListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "fanFundingEvents", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let fanfundingEventListResponse = Mapper<YoutubeFanFundingEventListResponse>().map(JSON: json)
				completionHandler(fanfundingEventListResponse, nil)
			}
		}
	}

	/**
	Note: This parameter is intended exclusively for YouTube content partners.
	
	The forContentOwner parameter restricts the search to only retrieve resources owned by the content owner specified by the onBehalfOfContentOwner parameter. The user must be authenticated using a CMS account linked to the specified content owner and onBehalfOfContentOwner must be provided.*/
	open var forContentOwner: Bool!
	/**
	The location parameter, in conjunction with the locationRadius parameter, defines a circular geographic area and also restricts a search to videos that specify, in their metadata, a geographic location that falls within that area. The parameter value is a string that specifies latitude/longitude coordinates e.g. (37.42307,-122.08427).
	
	
	- The location parameter value identifies the point at the center of the area.
	- The locationRadius parameter specifies the maximum distance that the location associated with a video can be from that point for the video to still be included in the search results.The API returns an error if your request specifies a value for the location parameter but does not also specify a value for the locationRadius parameter.*/
	open var location: String!
	/// The videoSyndicated parameter lets you to restrict a search to only videos that can be played outside youtube.com. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoSyndicated: YoutubeSearchVideoSyndicated!
	/// The videoDefinition parameter lets you restrict a search to only include either high definition (HD) or standard definition (SD) videos. HD videos are available for playback in at least 720p, though higher resolutions, like 1080p, might also be available. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoDefinition: YoutubeSearchVideoDefinition!
	/// The videoDimension parameter lets you restrict a search to only retrieve 2D or 3D videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoDimension: YoutubeSearchVideoDimension!
	/**
	The q parameter specifies the query term to search for.
	
	Your request can also use the Boolean NOT (-) and OR (|) operators to exclude videos or to find videos that are associated with one of several search terms. For example, to search for videos matching either "boating" or "sailing", set the q parameter value to boating|sailing. Similarly, to search for videos matching either "boating" or "sailing" but not "fishing", set the q parameter value to boating|sailing -fishing. Note that the pipe character must be URL-escaped when it is sent in your API request. The URL-escaped value for the pipe character is %7C.*/
	open var q: String!
	/// The videoDuration parameter filters video search results based on their duration. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoDuration: YoutubeSearchVideoDuration!
	/// The publishedBefore parameter indicates that the API response should only contain resources created before the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
	open var publishedBefore: Date!
	/// The videoEmbeddable parameter lets you to restrict a search to only videos that can be embedded into a webpage. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoEmbeddable: YoutubeSearchVideoEmbeddable!
	/// The forDeveloper parameter restricts the search to only retrieve videos uploaded via the developer's application or website. The API server uses the request's authorization credentials to identify the developer. Therefore, a developer can restrict results to videos uploaded through the developer's own app or website but not to videos uploaded through other apps or sites.
	open var forDeveloper: Bool!
	/// The type parameter restricts a search query to only retrieve a particular type of resource. The value is a comma-separated list of resource types.
	open var type: String = "video,channel,playlist"
	/// The order parameter specifies the method that will be used to order resources in the API response.
	open var order: YoutubeSearchOrder = .Relevance
	/// The videoLicense parameter filters search results to only include videos with a particular license. YouTube lets video uploaders choose to attach either the Creative Commons license or the standard YouTube license to each of their videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoLicense: YoutubeSearchVideoLicense!
	/**
	The locationRadius parameter, in conjunction with the location parameter, defines a circular geographic area.
	
	The parameter value must be a floating point number followed by a measurement unit. Valid measurement units are m, km, ft, and mi. For example, valid parameter values include 1500m, 5km, 10000ft, and 0.75mi. The API does not support locationRadius parameter values larger than 1000 kilometers.
	
	Note: See the definition of the location parameter for more information.*/
	open var locationRadius: String!
	/// The relevanceLanguage parameter instructs the API to return search results that are most relevant to the specified language. The parameter value is typically an ISO 639-1 two-letter language code. However, you should use the values zh-Hans for simplified Chinese and zh-Hant for traditional Chinese. Please note that results in other languages will still be returned if they are highly relevant to the search query term.
	open var relevanceLanguage: String!
	/// The forMine parameter restricts the search to only retrieve videos owned by the authenticated user. If you set this parameter to true, then the type parameter's value must also be set to video.
	open var forMine: Bool!
	/// The channelType parameter lets you restrict a search to a particular type of channel.
	open var channelType: YoutubeSearchChannelType!
	/// The videoCaption parameter indicates whether the API should filter video search results based on whether they have captions. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoCaption: YoutubeSearchVideoCaption!
	/// The videoCategoryId parameter filters video search results based on their category. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoCategoryId: String!
	/// The videoType parameter lets you restrict a search to a particular type of videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var videoType: YoutubeSearchVideoType!
	/// The publishedAfter parameter indicates that the API response should only contain resources created after the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
	open var publishedAfter: Date!
	/// The relatedToVideoId parameter retrieves a list of videos that are related to the video that the parameter value identifies. The parameter value must be set to a YouTube video ID and, if you are using this parameter, the type parameter must be set to video.
	open var relatedToVideoId: String!
	/// The eventType parameter restricts a search to broadcast events. If you specify a value for this parameter, you must also set the type parameter's value to video.
	open var eventType: YoutubeSearchEventType!
	/// The safeSearch parameter indicates whether the search results should include restricted content as well as standard content.
	open var safeSearch: YoutubeSearchSafeSearch!
	/// The topicId parameter indicates that the API response should only contain resources associated with the specified topic. The value identifies a Freebase topic ID.
	open var topicId: String!
	
	/// Returns a collection of search results that match the query parameters specified in the API request. By default, a search result set identifies matching video, channel, and playlist resources, but you can also configure queries to only retrieve a specific type of resource.
	open func listSearch(_ part: String, completionHandler: @escaping (_ searchListResponse: YoutubeSearchListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let forContentOwner = forContentOwner {
			queryParams.updateValue(forContentOwner.toJSONString(), forKey: "forContentOwner")
		}
		if let location = location {
			queryParams.updateValue(location, forKey: "location")
		}
		if let videoSyndicated = videoSyndicated {
			queryParams.updateValue(videoSyndicated.rawValue, forKey: "videoSyndicated")
		}
		if let videoDefinition = videoDefinition {
			queryParams.updateValue(videoDefinition.rawValue, forKey: "videoDefinition")
		}
		if let videoDimension = videoDimension {
			queryParams.updateValue(videoDimension.rawValue, forKey: "videoDimension")
		}
		if let q = q {
			queryParams.updateValue(q, forKey: "q")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let videoDuration = videoDuration {
			queryParams.updateValue(videoDuration.rawValue, forKey: "videoDuration")
		}
		if let publishedBefore = publishedBefore {
			queryParams.updateValue(publishedBefore.toJSONString(), forKey: "publishedBefore")
		}
		if let videoEmbeddable = videoEmbeddable {
			queryParams.updateValue(videoEmbeddable.rawValue, forKey: "videoEmbeddable")
		}
		if let forDeveloper = forDeveloper {
			queryParams.updateValue(forDeveloper.toJSONString(), forKey: "forDeveloper")
		}
		queryParams.updateValue(type, forKey: "type")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(order.rawValue, forKey: "order")
		if let videoLicense = videoLicense {
			queryParams.updateValue(videoLicense.rawValue, forKey: "videoLicense")
		}
		if let locationRadius = locationRadius {
			queryParams.updateValue(locationRadius, forKey: "locationRadius")
		}
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let relevanceLanguage = relevanceLanguage {
			queryParams.updateValue(relevanceLanguage, forKey: "relevanceLanguage")
		}
		if let forMine = forMine {
			queryParams.updateValue(forMine.toJSONString(), forKey: "forMine")
		}
		if let channelType = channelType {
			queryParams.updateValue(channelType.rawValue, forKey: "channelType")
		}
		if let videoCaption = videoCaption {
			queryParams.updateValue(videoCaption.rawValue, forKey: "videoCaption")
		}
		if let videoCategoryId = videoCategoryId {
			queryParams.updateValue(videoCategoryId, forKey: "videoCategoryId")
		}
		if let videoType = videoType {
			queryParams.updateValue(videoType.rawValue, forKey: "videoType")
		}
		if let publishedAfter = publishedAfter {
			queryParams.updateValue(publishedAfter.toJSONString(), forKey: "publishedAfter")
		}
		if let relatedToVideoId = relatedToVideoId {
			queryParams.updateValue(relatedToVideoId, forKey: "relatedToVideoId")
		}
		if let eventType = eventType {
			queryParams.updateValue(eventType.rawValue, forKey: "eventType")
		}
		if let safeSearch = safeSearch {
			queryParams.updateValue(safeSearch.rawValue, forKey: "safeSearch")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let topicId = topicId {
			queryParams.updateValue(topicId, forKey: "topicId")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "search", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let searchListResponse = Mapper<YoutubeSearchListResponse>().map(JSON: json)
				completionHandler(searchListResponse, nil)
			}
		}
	}

	/// Returns a list of categories that can be associated with YouTube channels.
	open func listGuideCategories(_ part: String, completionHandler: @escaping (_ guideCategoryListResponse: YoutubeGuideCategoryListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "guideCategories", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let guideCategoryListResponse = Mapper<YoutubeGuideCategoryListResponse>().map(JSON: json)
				completionHandler(guideCategoryListResponse, nil)
			}
		}
	}

	/**
	Posts a bulletin for a specific channel. (The user submitting the request must be authorized to act on the channel's behalf.)
	
	Note: Even though an activity resource can contain information about actions like a user rating a video or marking a video as a favorite, you need to use other API methods to generate those activity resources. For example, you would use the API's videos.rate() method to rate a video and the playlistItems.insert() method to mark a video as a favorite.*/
	open func insertActivities(_ activity: YoutubeActivity, part: String, completionHandler: @escaping (_ activity: YoutubeActivity?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "activities", queryParams: queryParams, postBody: Mapper<YoutubeActivity>().toJSON(activity) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let activity = Mapper<YoutubeActivity>().map(JSON: json)
				completionHandler(activity, nil)
			}
		}
	}

	/// Set this parameter's value to true to retrieve the activity feed that displays on the YouTube home page for the currently authenticated user.
	open var home: Bool!
	
	/// Returns a list of channel activity events that match the request criteria. For example, you can retrieve events associated with a particular channel, events associated with the user's subscriptions and Google+ friends, or the YouTube home page feed, which is customized for each user.
	open func listActivities(_ part: String, completionHandler: @escaping (_ activityListResponse: YoutubeActivityListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let publishedAfter = publishedAfter {
			queryParams.updateValue(publishedAfter.toJSONString(), forKey: "publishedAfter")
		}
		queryParams.updateValue(part, forKey: "part")
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let publishedBefore = publishedBefore {
			queryParams.updateValue(publishedBefore.toJSONString(), forKey: "publishedBefore")
		}
		if let home = home {
			queryParams.updateValue(home.toJSONString(), forKey: "home")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "activities", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let activityListResponse = Mapper<YoutubeActivityListResponse>().map(JSON: json)
				completionHandler(activityListResponse, nil)
			}
		}
	}

	/// Creates a new top-level comment. To add a reply to an existing comment, use the comments.insert method instead.
	open func insertCommentThreads(_ commentThread: YoutubeCommentThread, part: String, completionHandler: @escaping (_ commentThread: YoutubeCommentThread?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "commentThreads", queryParams: queryParams, postBody: Mapper<YoutubeCommentThread>().toJSON(commentThread) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let commentThread = Mapper<YoutubeCommentThread>().map(JSON: json)
				completionHandler(commentThread, nil)
			}
		}
	}

	/**
	Set this parameter to limit the returned comment threads to a particular moderation state.
	
	Note: This parameter is not supported for use in conjunction with the id parameter.*/
	open var moderationStatus: YoutubeCommentThreadsModerationStatus = .Published
	/**
	The searchTerms parameter instructs the API to limit the API response to only contain comments that contain the specified search terms.
	
	Note: This parameter is not supported for use in conjunction with the id parameter.*/
	open var searchTerms: String!
	/// The allThreadsRelatedToChannelId parameter instructs the API to return all comment threads associated with the specified channel. The response can include comments about the channel or about the channel's videos.
	open var allThreadsRelatedToChannelId: String!
	/// The videoId parameter instructs the API to return comment threads associated with the specified video ID.
	open var videoId: String!
	
	/// Returns a list of comment threads that match the API request parameters.
	open func listCommentThreads(_ part: String, completionHandler: @escaping (_ commentThreadListResponse: YoutubeCommentThreadListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(moderationStatus.rawValue, forKey: "moderationStatus")
		if let searchTerms = searchTerms {
			queryParams.updateValue(searchTerms, forKey: "searchTerms")
		}
		if let allThreadsRelatedToChannelId = allThreadsRelatedToChannelId {
			queryParams.updateValue(allThreadsRelatedToChannelId, forKey: "allThreadsRelatedToChannelId")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let videoId = videoId {
			queryParams.updateValue(videoId, forKey: "videoId")
		}
		queryParams.updateValue(textFormat.rawValue, forKey: "textFormat")
		queryParams.updateValue(order.rawValue, forKey: "order")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "commentThreads", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let commentThreadListResponse = Mapper<YoutubeCommentThreadListResponse>().map(JSON: json)
				completionHandler(commentThreadListResponse, nil)
			}
		}
	}

	/// Modifies the top-level comment in a comment thread.
	open func updateCommentThreads(_ commentThread: YoutubeCommentThread, part: String, completionHandler: @escaping (_ commentThread: YoutubeCommentThread?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "commentThreads", queryParams: queryParams, postBody: Mapper<YoutubeCommentThread>().toJSON(commentThread) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let commentThread = Mapper<YoutubeCommentThread>().map(JSON: json)
				completionHandler(commentThread, nil)
			}
		}
	}

	/// Returns a list of abuse reasons that can be used for reporting abusive videos.
	open func listVideoAbuseReportReasons(_ part: String, completionHandler: @escaping (_ videoAbuseReportReasonListResponse: YoutubeVideoAbuseReportReasonListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videoAbuseReportReasons", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let videoAbuseReportReasonListResponse = Mapper<YoutubeVideoAbuseReportReasonListResponse>().map(JSON: json)
				completionHandler(videoAbuseReportReasonListResponse, nil)
			}
		}
	}

	/// Creates a video stream. The stream enables you to send your video to YouTube, which can then broadcast the video to your audience.
	open func insertLiveStreams(_ liveStream: YoutubeLiveStream, part: String, completionHandler: @escaping (_ liveStream: YoutubeLiveStream?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams, postBody: Mapper<YoutubeLiveStream>().toJSON(liveStream) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveStream = Mapper<YoutubeLiveStream>().map(JSON: json)
				completionHandler(liveStream, nil)
			}
		}
	}

	/// Deletes a video stream.
	open func deleteLiveStreams(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Returns a list of video streams that match the API request parameters.
	open func listLiveStreams(_ part: String, completionHandler: @escaping (_ liveStreamlistResponse: YoutubeLiveStreamListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveStreamlistResponse = Mapper<YoutubeLiveStreamListResponse>().map(JSON: json)
				completionHandler(liveStreamlistResponse, nil)
			}
		}
	}

	/// Updates a video stream. If the properties that you want to change cannot be updated, then you need to create a new stream with the proper settings.
	open func updateLiveStreams(_ liveStream: YoutubeLiveStream, part: String, completionHandler: @escaping (_ liveStream: YoutubeLiveStream?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveStreams", queryParams: queryParams, postBody: Mapper<YoutubeLiveStream>().toJSON(liveStream) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveStream = Mapper<YoutubeLiveStream>().map(JSON: json)
				completionHandler(liveStream, nil)
			}
		}
	}

	/// Adds a subscription for the authenticated user's channel.
	open func insertSubscriptions(_ subscription: YoutubeSubscription, part: String, completionHandler: @escaping (_ subscription: YoutubeSubscription?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "subscriptions", queryParams: queryParams, postBody: Mapper<YoutubeSubscription>().toJSON(subscription) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let subscription = Mapper<YoutubeSubscription>().map(JSON: json)
				completionHandler(subscription, nil)
			}
		}
	}

	/// The forChannelId parameter specifies a comma-separated list of channel IDs. The API response will then only contain subscriptions matching those channels.
	open var forChannelId: String!
	
	/// Returns subscription resources that match the API request criteria.
	open func listSubscriptions(_ part: String, completionHandler: @escaping (_ subscriptionListResponse: YoutubeSubscriptionListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let channelId = channelId {
			queryParams.updateValue(channelId, forKey: "channelId")
		}
		if let forChannelId = forChannelId {
			queryParams.updateValue(forChannelId, forKey: "forChannelId")
		}
		queryParams.updateValue(part, forKey: "part")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let mySubscribers = mySubscribers {
			queryParams.updateValue(mySubscribers.toJSONString(), forKey: "mySubscribers")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let mine = mine {
			queryParams.updateValue(mine.toJSONString(), forKey: "mine")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(order.rawValue, forKey: "order")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "subscriptions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let subscriptionListResponse = Mapper<YoutubeSubscriptionListResponse>().map(JSON: json)
				completionHandler(subscriptionListResponse, nil)
			}
		}
	}

	/// Deletes a subscription.
	open func deleteSubscriptions(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "subscriptions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Adds a resource to a playlist.
	open func insertPlaylistItems(_ playlistItem: YoutubePlaylistItem, part: String, completionHandler: @escaping (_ playlistItem: YoutubePlaylistItem?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams, postBody: Mapper<YoutubePlaylistItem>().toJSON(playlistItem) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let playlistItem = Mapper<YoutubePlaylistItem>().map(JSON: json)
				completionHandler(playlistItem, nil)
			}
		}
	}

	/// Deletes a playlist item.
	open func deletePlaylistItems(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// The playlistId parameter specifies the unique ID of the playlist for which you want to retrieve playlist items. Note that even though this is an optional parameter, every request to retrieve playlist items must specify a value for either the id parameter or the playlistId parameter.
	open var playlistId: String!
	
	/// Returns a collection of playlist items that match the API request parameters. You can retrieve all of the playlist items in a specified playlist or retrieve one or more playlist items by their unique IDs.
	open func listPlaylistItems(_ part: String, completionHandler: @escaping (_ playlistItemListResponse: YoutubePlaylistItemListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		if let playlistId = playlistId {
			queryParams.updateValue(playlistId, forKey: "playlistId")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let videoId = videoId {
			queryParams.updateValue(videoId, forKey: "videoId")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let playlistItemListResponse = Mapper<YoutubePlaylistItemListResponse>().map(JSON: json)
				completionHandler(playlistItemListResponse, nil)
			}
		}
	}

	/// Modifies a playlist item. For example, you could update the item's position in the playlist.
	open func updatePlaylistItems(_ playlistItem: YoutubePlaylistItem, part: String, completionHandler: @escaping (_ playlistItem: YoutubePlaylistItem?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "playlistItems", queryParams: queryParams, postBody: Mapper<YoutubePlaylistItem>().toJSON(playlistItem) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let playlistItem = Mapper<YoutubePlaylistItem>().map(JSON: json)
				completionHandler(playlistItem, nil)
			}
		}
	}

	/// The stabilize parameter indicates whether YouTube should adjust the video to remove shaky camera motions.
	open var stabilize: Bool!
	/// The autoLevels parameter indicates whether YouTube should automatically enhance the video's lighting and color.
	open var autoLevels: Bool!
	/// The notifySubscribers parameter indicates whether YouTube should send a notification about the new video to users who subscribe to the video's channel. A parameter value of True indicates that subscribers will be notified of newly uploaded videos. However, a channel owner who is uploading many videos might prefer to set the value to False to avoid sending a notification about each new video to the channel's subscribers.
	open var notifySubscribers: Bool = true
	
	/// Uploads a video to YouTube and optionally sets the video's metadata.
	open func insertVideos(_ video: YoutubeVideo, part: String, uploadParameters: UploadParameters, completionHandler: @escaping (_ video: YoutubeVideo?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let stabilize = stabilize {
			queryParams.updateValue(stabilize.toJSONString(), forKey: "stabilize")
		}
		if let onBehalfOfContentOwnerChannel = onBehalfOfContentOwnerChannel {
			queryParams.updateValue(onBehalfOfContentOwnerChannel, forKey: "onBehalfOfContentOwnerChannel")
		}
		queryParams.updateValue(part, forKey: "part")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let autoLevels = autoLevels {
			queryParams.updateValue(autoLevels.toJSONString(), forKey: "autoLevels")
		}
		queryParams.updateValue(notifySubscribers.toJSONString(), forKey: "notifySubscribers")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams, postBody: Mapper<YoutubeVideo>().toJSON(video) as [String: AnyObject], uploadParameters: uploadParameters) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let video = Mapper<YoutubeVideo>().map(JSON: json)
				completionHandler(video, nil)
			}
		}
	}

	/// Add a like or dislike rating to a video or remove a rating from a video.
	open func rateVideos(_ id: String, rating: YoutubeVideosRating, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		queryParams.updateValue(rating.rawValue, forKey: "rating")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos/rate", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Retrieves the ratings that the authorized user gave to a list of specified videos.
	open func getRatingVideos(_ id: String, completionHandler: @escaping (_ videoGetRatingResponse: YoutubeVideoGetRatingResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos/getRating", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let videoGetRatingResponse = Mapper<YoutubeVideoGetRatingResponse>().map(JSON: json)
				completionHandler(videoGetRatingResponse, nil)
			}
		}
	}

	/// Deletes a YouTube video.
	open func deleteVideos(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Report abuse for a video.
	open func reportAbuseVideos(_ videoAbuseReport: YoutubeVideoAbuseReport, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos/reportAbuse", queryParams: queryParams, postBody: Mapper<YoutubeVideoAbuseReport>().toJSON(videoAbuseReport) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Updates a video's metadata.
	open func updateVideos(_ video: YoutubeVideo, part: String, completionHandler: @escaping (_ video: YoutubeVideo?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.put, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams, postBody: Mapper<YoutubeVideo>().toJSON(video) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let video = Mapper<YoutubeVideo>().map(JSON: json)
				completionHandler(video, nil)
			}
		}
	}

	/// DEPRECATED
	open var locale: String!
	/// The chart parameter identifies the chart that you want to retrieve.
	open var chart: YoutubeVideosChart!
	/// Set this parameter's value to like or dislike to instruct the API to only return videos liked or disliked by the authenticated user.
	open var myRating: YoutubeVideosMyRating!
	
	/// Returns a list of videos that match the API request parameters.
	open func listVideos(_ part: String, completionHandler: @escaping (_ videoListResponse: YoutubeVideoListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let locale = locale {
			queryParams.updateValue(locale, forKey: "locale")
		}
		if let regionCode = regionCode {
			queryParams.updateValue(regionCode, forKey: "regionCode")
		}
		if let chart = chart {
			queryParams.updateValue(chart.rawValue, forKey: "chart")
		}
		queryParams.updateValue(part, forKey: "part")
		if let id = id {
			queryParams.updateValue(id, forKey: "id")
		}
		queryParams.updateValue(hl, forKey: "hl")
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(videoCategoryId, forKey: "videoCategoryId")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let onBehalfOfContentOwner = onBehalfOfContentOwner {
			queryParams.updateValue(onBehalfOfContentOwner, forKey: "onBehalfOfContentOwner")
		}
		if let myRating = myRating {
			queryParams.updateValue(myRating.rawValue, forKey: "myRating")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "videos", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let videoListResponse = Mapper<YoutubeVideoListResponse>().map(JSON: json)
				completionHandler(videoListResponse, nil)
			}
		}
	}

	/// The filter parameter specifies which channel sponsors to return.
	open var filter: YoutubeSponsorsFilter = .Newest
	
	/// Lists sponsors for a channel.
	open func listSponsors(_ part: String, completionHandler: @escaping (_ sponsorListResponse: YoutubeSponsorListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		queryParams.updateValue(filter.rawValue, forKey: "filter")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "sponsors", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let sponsorListResponse = Mapper<YoutubeSponsorListResponse>().map(JSON: json)
				completionHandler(sponsorListResponse, nil)
			}
		}
	}

	/// Returns a list of content regions that the YouTube website supports.
	open func listI18nRegions(_ part: String, completionHandler: @escaping (_ i18nRegionListResponse: YoutubeI18nRegionListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "i18nRegions", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let i18nRegionListResponse = Mapper<YoutubeI18nRegionListResponse>().map(JSON: json)
				completionHandler(i18nRegionListResponse, nil)
			}
		}
	}

	/// Adds a message to a live chat.
	open func insertLiveChatMessages(_ liveChatMessage: YoutubeLiveChatMessage, part: String, completionHandler: @escaping (_ liveChatMessage: YoutubeLiveChatMessage?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/messages", queryParams: queryParams, postBody: Mapper<YoutubeLiveChatMessage>().toJSON(liveChatMessage) as [String: AnyObject]) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveChatMessage = Mapper<YoutubeLiveChatMessage>().map(JSON: json)
				completionHandler(liveChatMessage, nil)
			}
		}
	}

	/// The profileImageSize parameter specifies the size of the user profile pictures that should be returned in the result set. Default: 88.
	open var profileImageSize: UInt!
	
	/// Lists live chat messages for a specific chat.
	open func listLiveChatMessages(_ liveChatId: String, part: String, completionHandler: @escaping (_ liveChatMessagelistResponse: YoutubeLiveChatMessageListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(liveChatId, forKey: "liveChatId")
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		if let profileImageSize = profileImageSize {
			queryParams.updateValue(profileImageSize.toJSONString(), forKey: "profileImageSize")
		}
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/messages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let liveChatMessagelistResponse = Mapper<YoutubeLiveChatMessageListResponse>().map(JSON: json)
				completionHandler(liveChatMessagelistResponse, nil)
			}
		}
	}

	/// Deletes a chat message.
	open func deleteLiveChatMessages(_ id: String, completionHandler: @escaping (_ success: Bool?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(id, forKey: "id")
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "liveChat/messages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Returns a list of application languages that the YouTube website supports.
	open func listI18nLanguages(_ part: String, completionHandler: @escaping (_ i18nLanguageListResponse: YoutubeI18nLanguageListResponse?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(hl, forKey: "hl")
		queryParams.updateValue(part, forKey: "part")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "i18nLanguages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let i18nLanguageListResponse = Mapper<YoutubeI18nLanguageListResponse>().map(JSON: json)
				completionHandler(i18nLanguageListResponse, nil)
			}
		}
	}

	func setUpQueryParams() -> [String: String] {
		var queryParams = [String: String]()
		if let userIp = userIp {
			queryParams.updateValue(userIp, forKey: "userIp")
		}
		queryParams.updateValue(prettyPrint.toJSONString(), forKey: "prettyPrint")
		if let quotaUser = quotaUser {
			queryParams.updateValue(quotaUser, forKey: "quotaUser")
		}
		if let fields = fields {
			queryParams.updateValue(fields, forKey: "fields")
		}
		queryParams.updateValue(alt.rawValue, forKey: "alt")
		return queryParams
	}
}

/**
	The order parameter specifies the order in which the API response should list comment threads. Valid values are: 
	- time - Comment threads are ordered by time. This is the default behavior.
	- relevance - Comment threads are ordered by relevance.Note: This parameter is not supported for use in conjunction with the id parameter.*/
public enum YoutubeCommentThreadsOrder: String {
	/// Order by relevance.
	case Relevance = "relevance"
	/// Order by time.
	case Time = "time"
}

/// Set this parameter's value to like or dislike to instruct the API to only return videos liked or disliked by the authenticated user.
public enum YoutubeVideosMyRating: String {
	/// Returns only videos disliked by the authenticated user.
	case Dislike = "dislike"
	/// Returns only video liked by the authenticated user.
	case Like = "like"
}

/// The videoSyndicated parameter lets you to restrict a search to only videos that can be played outside youtube.com. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoSyndicated: String {
	/// Return all videos, syndicated or not.
	case AnySyndicated = "any"
	/// Only retrieve syndicated videos.
	case True = "true"
}

/// The videoDuration parameter filters video search results based on their duration. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoDuration: String {
	/// Do not filter video search results based on their duration. This is the default value.
	case AnyDuration = "any"
	/// Only include videos longer than 20 minutes.
	case Long = "long"
	/// Only include videos that are between four and 20 minutes long (inclusive).
	case Medium = "medium"
	/// Only include videos that are less than four minutes long.
	case Short = "short"
}

/// The order parameter specifies the method that will be used to sort resources in the API response.
public enum YoutubeSubscriptionsOrder: String {
	/// Sort alphabetically.
	case Alphabetical = "alphabetical"
	/// Sort by relevance.
	case Relevance = "relevance"
	/// Sort by order of activity.
	case Unread = "unread"
}

/// This parameter indicates whether the API should return comments formatted as HTML or as plain text.
public enum YoutubeCommentsTextFormat: String {
	/// Returns the comments in HTML format. This is the default value.
	case Html = "html"
	/// Returns the comments in plain text format.
	case PlainText = "plainText"
}

/// The videoType parameter lets you restrict a search to a particular type of videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoType: String {
	/// Return all videos.
	case AnyType = "any"
	/// Only retrieve episodes of shows.
	case Episode = "episode"
	/// Only retrieve movies.
	case Movie = "movie"
}

/// The videoDimension parameter lets you restrict a search to only retrieve 2D or 3D videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoDimension: String {
	/// Restrict search results to exclude 3D videos.
	case X2d = "2d"
	/// Restrict search results to only include 3D videos.
	case X3d = "3d"
	/// Include both 3D and non-3D videos in returned results. This is the default value.
	case AnyDimension = "any"
}

/// The filter parameter specifies which channel sponsors to return.
public enum YoutubeSponsorsFilter: String {
	/// Return all sponsors, from newest to oldest.
	case All = "all"
	/// Return the most recent sponsors, from newest to oldest.
	case Newest = "newest"
}

/// The videoLicense parameter filters search results to only include videos with a particular license. YouTube lets video uploaders choose to attach either the Creative Commons license or the standard YouTube license to each of their videos. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoLicense: String {
	/// Return all videos, regardless of which license they have, that match the query parameters.
	case AnyLicense = "any"
	/// Only return videos that have a Creative Commons license. Users can reuse videos with this license in other videos that they create. Learn more.
	case CreativeCommon = "creativeCommon"
	/// Only return videos that have the standard YouTube license.
	case Youtube = "youtube"
}

/// The tfmt parameter specifies that the caption track should be returned in a specific format. If the parameter is not included in the request, the track is returned in its original format.
public enum YoutubeCaptionsTfmt: String {
	/// SubViewer subtitle.
	case Sbv = "sbv"
	/// Scenarist Closed Caption format.
	case Scc = "scc"
	/// SubRip subtitle.
	case Srt = "srt"
	/// Timed Text Markup Language caption.
	case Ttml = "ttml"
	/// Web Video Text Tracks caption.
	case Vtt = "vtt"
}

/// The eventType parameter restricts a search to broadcast events. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchEventType: String {
	/// Only include completed broadcasts.
	case Completed = "completed"
	/// Only include active broadcasts.
	case Live = "live"
	/// Only include upcoming broadcasts.
	case Upcoming = "upcoming"
}

/// Scopes for OAuth 2.0 authorization
public enum YoutubeOAuthScopes: String {
	/// View private information of your YouTube channel relevant during the audit process with a YouTube partner
	case YoutubePartnerChannelAudit = "https://www.googleapis.com/auth/youtubepartner-channel-audit"
	/// Manage your YouTube videos
	case Upload = "https://www.googleapis.com/auth/youtube.upload"
	/// Manage your YouTube account
	case Youtube = "https://www.googleapis.com/auth/youtube"
	/// View and manage your assets and associated content on YouTube
	case YoutubePartner = "https://www.googleapis.com/auth/youtubepartner"
	/// Manage your YouTube account
	case ForceSSL = "https://www.googleapis.com/auth/youtube.force-ssl"
	/// View your YouTube account
	case Readonly = "https://www.googleapis.com/auth/youtube.readonly"
}

/// Identifies the new moderation status of the specified comments.
public enum YoutubeCommentsModerationStatus: String {
	/// Marks a comment as awaiting review by a moderator.
	case HeldForReview = "heldForReview"
	/// Clears a comment for public display.
	case Published = "published"
	/**
	Rejects a comment as being unfit for display. This action also effectively hides all replies to the rejected comment.
	
	Note: The API does not currently provide a way to list or otherwise discover rejected comments. However, you can change the moderation status of a rejected comment if you still know its ID. If you were to change the moderation status of a rejected comment, the comment replies would subsequently be discoverable again as well.*/
	case Rejected = "rejected"
}

/// The channelType parameter lets you restrict a search to a particular type of channel.
public enum YoutubeSearchChannelType: String {
	/// Return all channels.
	case AnyType = "any"
	/// Only retrieve shows.
	case Show = "show"
}

/// The videoDefinition parameter lets you restrict a search to only include either high definition (HD) or standard definition (SD) videos. HD videos are available for playback in at least 720p, though higher resolutions, like 1080p, might also be available. If you specify a value for this parameter, you must also set the type parameter's value to video.
public enum YoutubeSearchVideoDefinition: String {
	/// Return all videos, regardless of their resolution.
	case AnyDefinition = "any"
	/// Only retrieve HD videos.
	case High = "high"
	/// Only retrieve videos in standard definition.
	case Standard = "standard"
}

/// Set this parameter's value to html or plainText to instruct the API to return the comments left by users in html formatted or in plain text.
public enum YoutubeCommentThreadsTextFormat: String {
	/// Returns the comments in HTML format. This is the default value.
	case Html = "html"
	/// Returns the comments in plain text format.
	case PlainText = "plainText"
}

/// The safeSearch parameter indicates whether the search results should include restricted content as well as standard content.
public enum YoutubeSearchSafeSearch: String {
	/// YouTube will filter some content from search results and, at the least, will filter content that is restricted in your locale. Based on their content, search results could be removed from search results or demoted in search results. This is the default parameter value.
	case Moderate = "moderate"
	/// YouTube will not filter the search result set.
	case None = "none"
	/// YouTube will try to exclude all restricted content from the search result set. Based on their content, search results could be removed from search results or demoted in search results.
	case Strict = "strict"
}

/// Data format for the response.
public enum YoutubeAlt: String {
	/// Responses with Content-Type of application/json
	case Json = "json"
}

/// The chart parameter identifies the chart that you want to retrieve.
public enum YoutubeVideosChart: String {
	/// Return the most popular videos for the specified content region and video category.
	case MostPopular = "mostPopular"
}

