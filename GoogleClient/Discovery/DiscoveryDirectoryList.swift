//
//  DiscoveryDirectoryList.swift
//  
//
//  Created by Matthew Wyskiel on 6/13/15.
//
//

import Foundation
import ObjectMapper

open class DiscoveryDirectoryList: GoogleObjectList {
    open var kind: String = "discovery#directoryList"
    open var discoveryVersion: String!
    public typealias `Type` = DiscoveryDirectoryItem
    open var items: [Type]!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        kind <- map["kind"]
        discoveryVersion <- map["discoveryVersion"]
        items <- map["items"]
    }
    
    public required init(arrayLiteral elements: Type...) {
        items = elements
    }
    
    public typealias Iterator = IndexingIterator<[Type]>
    
    open func makeIterator() -> Iterator {
        let objects = items as [Type]
        return objects.makeIterator()
    }
    
    open subscript(position: Int) -> Type {
        return items[position]
    }
}

open class DiscoveryDirectoryItem: GoogleObject {
    open var kind: String = "discovery#directoryList"
    open var identifier: String! // id
    open var name: String!
    open var version: String!
    open var title: String!
    open var APIDescription: String! // description
    open var icons: DiscoveryAPIIcon!
    open var documentationLink: URL!
    open var discoveryRestURL: URL! // discoveryRestUrl
    open var discoveryLink: String!
    open var labels: [String]!
    open var preferred: Bool!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        kind <- map["kind"]
        identifier <- map["id"]
        name <- map["name"]
        version <- map["version"]
        title <- map["title"]
        APIDescription <- map["description"]
        icons <- map["icons"]
        documentationLink <- (map["documentationLink"], URLTransform())
        discoveryRestURL <- (map["discoveryRestUrl"], URLTransform())
        discoveryLink <- map["discoveryLink"]
        labels <- map["labels"]
        preferred <- map["preferred"]
    }
}
