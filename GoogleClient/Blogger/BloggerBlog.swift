//
//  BloggerBlog.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/24/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import UIKit
import ObjectMapper

public class BloggerBlog: GoogleObject {
    public var kind: String = "blogger#blog"
    public var identifier: String!
    public var name: String!
    public var blogDescription: String!
    public var published: NSDate!
    public var updated: NSDate!
    public var url: NSURL!
    public var selfLink: NSURL!
    public var totalNumberOfPosts: Int! // "posts.totalItems"
    public var postsResourceURL: NSURL! // "posts.selfLink"
    // public var posts: GoogleObjectList<BloggerPost>? // "posts.items"
    public var totalNumberOfPages: Int! // "pages.totalItems"
    public var pagesResourceURL: NSURL! // "pages.selfLink"
    public var language: String! // "locale.language"
    public var country: String! // "locale.country"
    public var languageVariant: String! //"locale.variant"
    public var customMetaData: [String: String]?
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        kind <- map["kind"]
        identifier <- map["id"]
        name <- map["name"]
        blogDescription <- map["description"]
        published <- (map["published"], RFC3339Transform())
        updated <- (map["updated"], RFC3339Transform())
        url <- (map["url"], URLTransform())
        selfLink <- (map["selfLink"], URLTransform())
        totalNumberOfPosts <- map["posts.totalItems"]
        postsResourceURL <- (map["posts.selfLink"], URLTransform())
        // posts <- map["posts"]
        totalNumberOfPages <- map["pages.totalItems"]
        pagesResourceURL <- (map["pages.selfLink"], URLTransform())
        language <- map["locale.language"]
        country <- map["locale.country"]
        languageVariant <- map["locale.variant"]
        customMetaData <- map["customMetaData"]
    }
}

public class BloggerBlogList: GoogleObjectList { // TODO: Finish implementation
    public typealias Type = BloggerBlog
    public var kind: String = "blogger#blogList"
    public var items: [Type]!
    public var nextPageToken: String?
    public var ETag: String?
    
    public required init?(_ map: Map) {
        mapping(map)
    }
    
    public func mapping(map: Map) {
        items <- map["items"]
        nextPageToken <- map["nextPageToken"]
        ETag <- map["etag"]
    }
    
    public required init(arrayLiteral elements: Type...) {
        items = elements
    }
    
    public typealias Generator = IndexingGenerator<[Type]>
    
    public func generate() -> Generator {
        let objects = items as [Type]
        return objects.generate()
    }
    
    public subscript(position: Int) -> Type {
        return items[position]
    }
}