//
//  DiscoveryRestDescription.swift
//  
//
//  Created by Matthew Wyskiel on 6/13/15.
//
//

import Foundation
import ObjectMapper

open class DiscoveryRestDescription: GoogleObject {
    open var kind: String = "discovery#restDescription"
    open var discoveryVersion: String!
    open var identifier: String! // id
    open var name: String!
    open var version: String!
    open var revision: String!
    open var title: String!
    open var APIDescription: String! // description
    open var icons: DiscoveryAPIIcon!
    open var documentationLink: URL!
    open var labels: [String]!
    open var APIProtocol: String! // protocol
    open var rootURL: String! // rootUrl
    open var baseURL: String! // baseUrl; DEPRECATED
    open var basePath: String! // DEPRECATED
    open var servicePath: String!
    open var batchPath: String!
    open var parameters: [String: DiscoveryJSONSchema]!
    open var auth: DiscoveryAuth!
    open var features: [String]!
    open var schemas: [String: DiscoveryJSONSchema]!
    open var methods: [String: DiscoveryRestMethod]!
    open var resources: [String: DiscoveryResource]!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        kind <- map["kind"]
        discoveryVersion <- map["discoveryVersion"]
        identifier <- map["id"]
        name <- map["name"]
        version <- map["version"]
        revision <- map["revision"]
        title <- map["title"]
        APIDescription <- map["description"]
        icons <- map["icons"]
        documentationLink <- (map["documentationLink"], URLTransform())
        labels <- map["labels"]
        APIProtocol <- map["protocol"]
        rootURL <- map["rootUrl"]
        baseURL <- map["baseUrl"]
        basePath <- map["basePath"]
        servicePath <- map["servicePath"]
        batchPath <- map["batchPath"]
        parameters <- map["parameters"]
        auth <- map["auth"]
        features <- map["features"]
        schemas <- map["schemas"]
        methods <- map["methods"]
        resources <- map["resources"]
    }
}

open class DiscoveryAPIIcon: Mappable {
    open var x16: URL!
    open var x32: URL!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        x16 <- (map["x16"], URLTransform())
        x32 <- (map["x32"], URLTransform())
    }
}

open class DiscoveryAuth: Mappable { // assuming OAuth 2
    open var OAuthScopes: [String: DiscoveryAuthScope]! // oauth2.scopes
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        OAuthScopes <- map["oauth2.scopes"]
    }
}

open class DiscoveryAuthScope: Mappable {
    open var scopeDescription: String! // description
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        scopeDescription <- map["description"]
    }
}

open class DiscoveryJSONSchema: Mappable {
    open var identifier: String! // id
    open var type: String!
    open var xRef: String! // $ref
    open var schemaDescription: String! // description
    open var defaultValue: String? // default
    open var required: Bool!
    open var format: String!
    open var pattern: String!
    open var minimum: String!
    open var maximum: String!
    open var enumValues: [String]! // enum
    open var enumDescriptions: [String]!
    open var repeated: Bool!
    open var location: String!
    open var properties: [String: DiscoveryJSONSchema]!
    open var additionalProperties: DiscoveryJSONSchema!
    open var items: DiscoveryJSONSchema!
    open var annotations: DiscoveryJSONSchemaAnnotations!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        identifier <- map["id"]
        type <- map["type"]
        xRef <- map["$ref"]
        schemaDescription <- map["description"]
        defaultValue <- map["default"]
        required <- map["required"]
        format <- map["format"]
        pattern <- map["pattern"]
        minimum <- map["minimum"]
        maximum <- map["maximum"]
        enumValues <- map["enum"]
        enumDescriptions <- map["enumDescriptions"]
        repeated <- map["repeated"]
        location <- map["location"]
        properties <- map["properties"]
        additionalProperties <- map["additionalProperties"]
        items <- map["items"]
        annotations <- map["annotations"]
    }
}

open class DiscoveryJSONSchemaAnnotations: Mappable {
    open var required: [String]!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        required <- map["required"]
    }
}

open class DiscoveryRestMethod: Mappable {
    open var identifier: String! // id
    open var path: String!
    open var httpMethod: String!
    open var methodDescription: String! // description
    open var parameters: [String: DiscoveryJSONSchema]!
    open var parameterOrder: [String]!
    open var requestRef: String! // request.$ref
    open var responseRef: String! // response.$ref
    open var scopes: [String]!
    open var supportsMediaDownload: Bool!
    open var supportsMediaUpload: Bool!
    open var mediaUpload: DiscoveryRestMethodMediaUpload!
    open var supportsSubscription: Bool!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        identifier <- map["id"]
        path <- map["path"]
        httpMethod <- map["httpMethod"]
        methodDescription <- map["description"]
        parameters <- map["parameters"]
        parameterOrder <- map["parameterOrder"]
        requestRef <- map["request.$ref"]
        responseRef <- map["response.$ref"]
        scopes <- map["scopes"]
        supportsMediaDownload <- map["supportsMediaDownload"]
        supportsMediaUpload <- map["supportsMediaUpload"]
        mediaUpload <- map["mediaUpload"]
        supportsSubscription <- map["supportsSubscription"]
    }
}

open class DiscoveryRestMethodMediaUpload: Mappable {
    open var accept: [String]!
    open var maxSize: String!
    open var protocols: [String: DiscoveryRestMethodMediaUploadProtocol]!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        accept <- map["accept"]
        maxSize <- map["maxSize"]
        protocols <- map["protocols"]
    }
}

public enum DiscoveryRestMethodMediaUploadProtocolType: String {
    case Simple = "simple"
    case Resumable = "resumable"
}

open class DiscoveryRestMethodMediaUploadProtocol: Mappable {
    open var multipart: Bool = true
    open var path: String!
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        path <- map["path"]
    }
}

open class DiscoveryResource: Mappable {
    open var methods: [String: DiscoveryRestMethod]!
    open var subResources: [String: DiscoveryResource]! // resources
    
    public required init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        methods <- map["methods"]
        subResources <- map["resources"]
    }
}

