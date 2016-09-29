//
//  Blogger.swift
//  GoogleAPISwiftClient
//
//  Created by Matthew Wyskiel on 6/23/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation
import ObjectMapper

///
public enum BloggerPostUserInfosStatus: String {
	/// Draft posts
	case Draft = "draft"
	/// Published posts
	case Live = "live"
	/// Posts that are scheduled to publish in future.
	case Scheduled = "scheduled"
}

/// Data format for the response.
public enum BloggerAlt: String {
	/// Responses with Content-Type of application/json
	case JSON = "json"
}

/// Statuses to include in the results.
public enum BloggerPostsStatus: String {
	/// Draft (non-published) posts.
	case Draft = "draft"
	/// Published posts
	case Live = "live"
	/// Posts that are scheduled to publish in the future.
	case Scheduled = "scheduled"
}

/// Access level with which to view the returned result. Note that some fields require escalated access.
public enum BloggerPostsView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// Access level with which to view the blog. Note that some fields require elevated access.
public enum BloggerBlogsView: String {
	/// Admin level detail.
	case Admin = "ADMIN"
	/// Author level detail.
	case Author = "AUTHOR"
	/// Reader level detail.
	case Reader = "READER"
}

/// Sort order applied to search results. Default is published.
public enum BloggerPostUserInfosOrderBy: String {
	/// Order by the date the post was published
	case Published = "published"
	/// Order by the date the post was last updated
	case Updated = "updated"
}

///
public enum BloggerPagesStatus: String {
	/// Draft (unpublished) Pages
	case Draft = "draft"
	/// Pages that are publicly visible
	case Live = "live"
}

/// Blog statuses to include in the result (default: Live blogs only). Note that ADMIN access is required to view deleted blogs.
public enum BloggerBlogsStatus: String {
	/// Blog has been deleted by an administrator.
	case Deleted = "DELETED"
	/// Blog is currently live.
	case Live = "LIVE"
}

/// Access level with which to view the returned result. Note that some fields require elevated access.
public enum BloggerPagesView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// Scopes for OAuth 2.0 authorization
public enum BloggerOAuthScopes: String {
	/// View your Blogger account
	case Readonly = "https://www.googleapis.com/auth/blogger.readonly"
	/// Manage your Blogger account
	case Blogger = "https://www.googleapis.com/auth/blogger"
}

/// Sort search results
public enum BloggerPostsOrderBy: String {
	/// Order by the date the post was published
	case Published = "published"
	/// Order by the date the post was last updated
	case Updated = "updated"
}

/// Access level with which to view the returned result. Note that some fields require elevated access.
public enum BloggerCommentsView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// Access level with which to view the returned result. Note that some fields require elevated access.
public enum BloggerPostUserInfosView: String {
	/// Admin level detail
	case Admin = "ADMIN"
	/// Author level detail
	case Author = "AUTHOR"
	/// Reader level detail
	case Reader = "READER"
}

/// User access types for blogs to include in the results, e.g. AUTHOR will return blogs where the user has author level access. If no roles are specified, defaults to ADMIN and AUTHOR roles.
public enum BloggerBlogsRole: String {
	/// Admin role - Blogs where the user has Admin level access.
	case Admin = "ADMIN"
	/// Author role - Blogs where the user has Author level access.
	case Author = "AUTHOR"
	/// Reader role - Blogs where the user has Reader level access (to a private blog).
	case Reader = "READER"
}

///
public enum BloggerPageViewsRange: String {
	/// Page view counts from the last thirty days.
	case X30Days = "30DAYS"
	/// Page view counts from the last seven days.
	case X7Days = "7DAYS"
	/// Total page view counts from all time.
	case All = "all"
}

///
public enum BloggerCommentsStatus: String {
	/// Comments that have had their content removed
	case Emptied = "emptied"
	/// Comments that are publicly visible
	case Live = "live"
	/// Comments that are awaiting administrator approval
	case Pending = "pending"
	/// Comments marked as spam by the administrator
	case Spam = "spam"
}

/// API for access to the data within Blogger.
open class Blogger: GoogleService {
	var apiNameInURL: String = "blogger"
	var apiVersionString: String = "v3"

	open let fetcher: GoogleServiceFetcher = GoogleServiceFetcher()

	public required init() {

	}

	/// IP address of the site where the request originates. Use this if you want to enforce per-user limits.
	open var userIp: String!
	/// Returns response with indentations and line breaks.
	open var prettyPrint: Bool = true
	/// Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
	open var quotaUserId: String!
	/// Selector specifying which fields to include in a partial response.
	open var fields: String!
	/// Data format for the response.
	open var alt: BloggerAlt = .JSON

	/// Whether the body content of posts is included. Default is false.
	open var fetchBodies: Bool = false
	open var status: BloggerPostUserInfosStatus!
	/// Access level with which to view the returned result. Note that some fields require elevated access.
	open var view: BloggerPostUserInfosView!
	/// Latest post date to fetch, a date-time with RFC 3339 formatting.
	open var endDate: Date!
	/// Comma-separated list of labels to search for.
	open var labels: String!
	/// Continuation token if the request is paged.
	open var pageToken: String!
	/// Sort order applied to search results. Default is published.
	open var orderBy: BloggerPostUserInfosOrderBy = .Published
	/// Maximum number of posts to fetch.
	open var maxResults: UInt!
	/// Earliest post date to fetch, a date-time with RFC 3339 formatting.
	open var startDate: Date!

	/// Retrieves a list of post and post user info pairs, possibly filtered. The post user info contains per-user information about the post, such as access rights, specific to the user.
	open func listPostUserInfos(forUserId userId: String, blogId: String, completionHandler: @escaping (_ postUserInfosList: BloggerPostUserInfosList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let labels = labels {
			queryParams.updateValue(labels, forKey: "labels")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let postUserInfosList = Mapper<BloggerPostUserInfosList>().map(JSON: JSON!)
				completionHandler(postUserInfosList, nil)
			}
		}
	}

	/// Maximum number of comments to pull back on a post.
	open var maxComments: UInt!

	/// Gets one post and user info pair, by post ID and user ID. The post user info contains per-user information about the post, such as access rights, specific to the user.
	open func getPostUserInfo(forUserId userId: String, blogId: String, postId: String, completionHandler: @escaping (_ postUserInfo: BloggerPostUserInfo?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let postUserInfo = Mapper<BloggerPostUserInfo>().map(JSON: json)
				completionHandler(postUserInfo, nil)
			}
		}
	}

	open var range: BloggerPageViewsRange!

	/// Retrieve pageview stats for a Blog.
	open func getPageViews(forBlogWithId blogId: String, completionHandler: @escaping (_ pageviews: BloggerPageviews?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let range = range {
			queryParams.updateValue(range.rawValue, forKey: "range")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pageviews", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
				let pageviews = Mapper<BloggerPageviews>().map(JSON: json)
				completionHandler(pageviews, nil)
			}
		}
	}

	/// Whether to create the post as a draft (default: false).
	open var isDraft: Bool!
	/// Whether the body content of the post is included with the result (default: true).
	open var fetchBody: Bool = true
	/// Whether image URL metadata for each post is included in the returned result (default: false).
	open var fetchImages: Bool!

	/// Add a post.
	open func insertPost(_ post: BloggerPost, toBlogWithId blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONString(), forKey: "isDraft")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}

		fetcher.performRequest(.post,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/posts", queryParams: queryParams,
		                       postBody: Mapper<BloggerPost>().toJSON(post) as [String: AnyObject] ) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Optional date and time to schedule the publishing of the Blog. If no publishDate parameter is given, the post is either published at the a previously saved schedule date (if present), or the current time. If a future date is given, the post will be scheduled to be published.
	open var publishDate: Date!

	/// Publishes a draft post, optionally at the specific time of the given publishDate parameter.
	open func publishPost(withId postId: String, toBlogWithId blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publishDate = publishDate {
			queryParams.updateValue(publishDate.toJSONString(), forKey: "publishDate")
		}
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Delete a post by ID.
	open func deletePost(withId postId: String, fromBlogWithId blogId: String, completionHandler: @escaping (_ success: Bool, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Whether a publish action should be performed when the post is updated (default: false).
	open var publish: Bool!
	/// Whether a revert action should be performed when the post is updated (default: false).
	open var revert: Bool!

	/// Update a post. This method supports patch semantics.
	open func patchPost(_ post: BloggerPost, forPostID postId: String, blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		fetcher.performRequest(.patch,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/posts/\(postId)",
                               queryParams: queryParams,
                               postBody: Mapper<BloggerPost>().toJSON(post) as [String: AnyObject] ) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Retrieve a Post by Path.
	open func getPost(byPath path: String, blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(path, forKey: "path")
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/bypath", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Update a post.
	open func updatePost(_ post: BloggerPost, withPostId postId: String, blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		fetcher.performRequest(.put,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/posts/\(postId)",
                               queryParams: queryParams,
                               postBody: Mapper<BloggerPost>().toJSON(post) as [String: AnyObject] ) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Get a post by ID.
	open func getPost(withId postId: String, blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBody.toJSONString(), forKey: "fetchBody")
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxComments = maxComments {
			queryParams.updateValue(maxComments.toJSONString(), forKey: "maxComments")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Revert a published or scheduled post to draft state.
	open func revertPost(withId postId: String, blogId: String, completionHandler: @escaping (_ post: BloggerPost?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.post,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/posts/\(postId)/revert",
                               queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let post = Mapper<BloggerPost>().map(JSON: json)
				completionHandler(post, nil)
			}
		}
	}

	/// Search for a post.
	open func searchPosts(query q: String, blogId: String, completionHandler: @escaping (_ postList: BloggerPostList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		queryParams.updateValue(q, forKey: "q")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/search", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let postList = Mapper<BloggerPostList>().map(JSON: json)
				completionHandler(postList, nil)
			}
		}
	}

	/// Retrieves a list of posts, possibly filtered.
	open func listPosts(_ blogId: String, completionHandler: @escaping (_ postList: BloggerPostList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let fetchImages = fetchImages {
			queryParams.updateValue(fetchImages.toJSONString(), forKey: "fetchImages")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let labels = labels {
			queryParams.updateValue(labels, forKey: "labels")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		queryParams.updateValue(orderBy.rawValue, forKey: "orderBy")
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let postList = Mapper<BloggerPostList>().map(JSON: json)
				completionHandler(postList, nil)
			}
		}
	}

	/// Gets one user by ID.
	open func getUser(withId userId: String, completionHandler: @escaping (_ user: BloggerUser?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let user = Mapper<BloggerUser>().map(JSON: json)
				completionHandler(user, nil)
			}
		}
	}

	/// Marks a comment as spam.
	open func markCommentAsSpam(withId commentId: String, inPostWithId postId: String, blogId: String, completionHandler: @escaping (_ comment: BloggerComment?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/spam", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let comment = Mapper<BloggerComment>().map(JSON: json)
				completionHandler(comment, nil)
			}
		}
	}

	/// Removes the content of a comment.
	open func removeContentFromComment(withId commentId: String, inPostWithId postId: String, blogId: String, completionHandler: @escaping (_ comment: BloggerComment?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/removecontent", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let comment = Mapper<BloggerComment>().map(JSON: json)
				completionHandler(comment, nil)
			}
		}
	}

	/// Delete a comment by ID.
	open func deleteComment(withId commentId: String, fromPostWithId postId: String, blogId: String, completionHandler: @escaping (_ success: Bool?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Gets one comment by ID.
	open func getComment(forId commentId: String, postId: String, blogId: String, completionHandler: @escaping (_ comment: BloggerComment?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let comment = Mapper<BloggerComment>().map(JSON: json)
				completionHandler(comment, nil)
			}
		}
	}

	/// Retrieves the comments for a post, possibly filtered.
	open func listComments(forPostWithId postId: String, blogId: String, completionHandler: @escaping (_ commentList: BloggerCommentList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let commentList = Mapper<BloggerCommentList>().map(JSON: json)
				completionHandler(commentList, nil)
			}
		}
	}

	/// Marks a comment as not spam.
	open func approveComment(withId commentId: String, forPostWithId postId: String, blogId: String, completionHandler: @escaping (_ comment: BloggerComment?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/posts/\(postId)/comments/\(commentId)/approve", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let comment = Mapper<BloggerComment>().map(JSON: json)
				completionHandler(comment, nil)
			}
		}
	}

	/// Retrieves the comments for a blog, across all posts, possibly filtered.
	open func listComments(forBlogWithId blogId: String, completionHandler: @escaping (_ commentList: BloggerCommentList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let endDate = endDate {
			queryParams.updateValue(endDate.toJSONString(), forKey: "endDate")
		}
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let startDate = startDate {
			queryParams.updateValue(startDate.toJSONString(), forKey: "startDate")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/comments", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let commentList = Mapper<BloggerCommentList>().map(JSON: json)
				completionHandler(commentList, nil)
			}
		}
	}

	/// Maximum number of posts to pull back with the blog.
	open var maxPosts: UInt!

	/// Gets one blog by ID.
	open func getBlog(forId blogId: String, completionHandler: @escaping (_ blog: BloggerBlog?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts.toJSONString(), forKey: "maxPosts")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let blog = Mapper<BloggerBlog>().map(JSON: json)
				completionHandler(blog, nil)
			}
		}
	}

	/// User access types for blogs to include in the results, e.g. AUTHOR will return blogs where the user has author level access. If no roles are specified, defaults to ADMIN and AUTHOR roles.
	open var role: BloggerBlogsRole!
	/// Whether the response is a list of blogs with per-user information instead of just blogs.
	open var fetchUserInfo: Bool!

	/// Retrieves a list of blogs, possibly filtered.
	open func listBlogs(forUserWithId userId: String, completionHandler: @escaping (_ blogList: BloggerBlogList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		queryParams.updateValue(status.rawValue, forKey: "status")
		if let role = role {
			queryParams.updateValue(role.rawValue, forKey: "role")
		}
		if let fetchUserInfo = fetchUserInfo {
			queryParams.updateValue(fetchUserInfo.toJSONString(), forKey: "fetchUserInfo")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let blogList = Mapper<BloggerBlogList>().map(JSON: json)
				completionHandler(blogList, nil)
			}
		}
	}

	/// Retrieve a Blog by URL.
	open func getBlog(fromURL url: String, completionHandler: @escaping (_ blog: BloggerBlog?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		queryParams.updateValue(url, forKey: "url")
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/byurl", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let blog = Mapper<BloggerBlog>().map(JSON: json)
				completionHandler(blog, nil)
			}
		}
	}

	/// Add a page.
	open func insertPage(_ page: BloggerPage, toBlogWithId blogId: String, completionHandler: @escaping (_ page: BloggerPage?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let isDraft = isDraft {
			queryParams.updateValue(isDraft.toJSONString(), forKey: "isDraft")
		}
		fetcher.performRequest(.post,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/pages",
                               queryParams: queryParams,
                               postBody: Mapper<BloggerPage>().toJSON(page) as [String: AnyObject] ) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let page = Mapper<BloggerPage>().map(JSON: json)
				completionHandler(page, nil)
			}
		}
	}

	/// Publishes a draft page.
	open func publishPage(withId pageId: String, toBlogWithId blogId: String, completionHandler: @escaping (_ page: BloggerPage?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/publish", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let page = Mapper<BloggerPage>().map(JSON: json)
				completionHandler(page, nil)
			}
		}
	}

	/// Delete a page by ID.
	open func deletePage(withId pageId: String, fromBlogWithId blogId: String, completionHandler: @escaping (_ success: Bool, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.delete, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(false, error)
			} else {
				completionHandler(true, nil)
			}
		}
	}

	/// Update a page. This method supports patch semantics.
	open func patchPage(_ page: BloggerPage, forPageWithId pageId: String, blogId: String, completionHandler: @escaping (_ page: BloggerPage?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		fetcher.performRequest(.patch,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/pages/\(pageId)",
                               queryParams: queryParams,
                               postBody: Mapper<BloggerPage>().toJSON(page) as [String: AnyObject] ) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let page = Mapper<BloggerPage>().map(JSON: json)
				completionHandler(page, nil)
			}
		}
	}

	/// Update a page.
	open func updatePage(_ page: BloggerPage, forPageWithId pageId: String, blogId: String, completionHandler: @escaping (_ page: BloggerPage?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let publish = publish {
			queryParams.updateValue(publish.toJSONString(), forKey: "publish")
		}
		if let revert = revert {
			queryParams.updateValue(revert.toJSONString(), forKey: "revert")
		}
		fetcher.performRequest(.put,
		                       serviceName: apiNameInURL,
		                       apiVersion: apiVersionString,
		                       endpoint: "blogs/\(blogId)/pages/\(pageId)",
                               queryParams: queryParams,
                               postBody: Mapper<BloggerPage>().toJSON(page) as [String: AnyObject] ) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let page = Mapper<BloggerPage>().map(JSON: json)
				completionHandler(page, nil)
			}
		}
	}

	/// Gets one blog page by ID.
	open func getPages(_ blogId: String, pageId: String, completionHandler: @escaping (_ page: BloggerPage?, _ error: Error?) -> ()) {
		var queryParams = setUpQueryParams()
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let page = Mapper<BloggerPage>().map(JSON: json)
				completionHandler(page, nil)
			}
		}
	}

	/// Revert a published or scheduled page to draft state.

	open func revertPage(with pageId: String, inBlogWithId blogId: String, completionHandler: @escaping (_ page: BloggerPage?, _ error: NSError?) -> ()) {
		let queryParams = setUpQueryParams()
		fetcher.performRequest(.post, serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages/\(pageId)/revert", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let page = Mapper<BloggerPage>().map(JSON: json)
				completionHandler(page, nil)
			}
		}
	}


	open func listPages(forBlogWithId blogId: String, completionHandler: @escaping (_ pageList: BloggerPageList?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		queryParams.updateValue(fetchBodies.toJSONString(), forKey: "fetchBodies")
		if let pageToken = pageToken {
			queryParams.updateValue(pageToken, forKey: "pageToken")
		}
		if let view = view {
			queryParams.updateValue(view.rawValue, forKey: "view")
		}
		if let maxResults = maxResults {
			queryParams.updateValue(maxResults.toJSONString(), forKey: "maxResults")
		}
		if let status = status {
			queryParams.updateValue(status.rawValue, forKey: "status")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "blogs/\(blogId)/pages", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let pageList = Mapper<BloggerPageList>().map(JSON: json)
				completionHandler(pageList, nil)
			}
		}
	}

	/// Gets one blog and user info pair by blogId and userId.
	open func getBlogUserInfo(forBlogWithId blogId: String, userId: String, completionHandler: @escaping (_ blogUserInfo: BloggerBlogUserInfo?, _ error: NSError?) -> ()) {
		var queryParams = setUpQueryParams()
		if let maxPosts = maxPosts {
			queryParams.updateValue(maxPosts.toJSONString(), forKey: "maxPosts")
		}
		fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "users/\(userId)/blogs/\(blogId)", queryParams: queryParams) { (JSON, error) -> () in
			if error != nil {
				completionHandler(nil, error)
			} else if let json = JSON {
                let blogUserInfo = Mapper<BloggerBlogUserInfo>().map(JSON: json)
				completionHandler(blogUserInfo, nil)
			}
		}
	}

	func setUpQueryParams() -> [String: String] {
		var queryParams = [String: String]()
		if let userIp = userIp {
			queryParams.updateValue(userIp, forKey: "userIp")
		}
		queryParams.updateValue(prettyPrint.toJSONString(), forKey: "prettyPrint")
		if let quotaUserId = quotaUserId {
			queryParams.updateValue(quotaUserId, forKey: "quotaUser")
		}
		if let fields = fields {
			queryParams.updateValue(fields, forKey: "fields")
		}
		queryParams.updateValue(alt.rawValue, forKey: "alt")
		return queryParams
	}
}
