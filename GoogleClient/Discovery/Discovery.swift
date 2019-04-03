//
//  Discovery.swift
//  
//
//  Created by Matthew Wyskiel on 6/13/15.
//
//

import Foundation
import ObjectMapper

open class Discovery: GoogleService {
    var apiNameInURL: String = "discovery"
    var apiVersionString: String = "v1"
    
    public let fetcher : GoogleServiceFetcher = GoogleServiceFetcher()
    
    public required init() {
        
    }
    
    open var alt: DiscoveryAlt?
    open var fields: String?
    open var prettyPrint: Bool?
    open var quotaUser: String?
    open var userIp: String?
    
    open func getDiscoveryDocument(forAPI api: String, version /* begins with 'v' followed by number */: String, completionHandler: @escaping (_ restDescription: DiscoveryRestDescription?, _ error: Error?) -> ()) {
        let queryParams = setUpQueryParams()
        fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "apis/\(api)/\(version)/rest", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(nil, error)
            } else if let json = JSON {
                let restDescription = Mapper<DiscoveryRestDescription>().map(JSON: json)
                completionHandler(restDescription, nil)
            }
        }
    }
    
    open var name: String?
    open var preferred: Bool?
    
    open func listAPIs(_ completionHandler: @escaping (_ list: DiscoveryDirectoryList?, _ error: Error?) -> ()) {
        var queryParams = setUpQueryParams()
        if let name = name {
            queryParams.updateValue(name, forKey: "name")
        }
        if let preferred = preferred {
            queryParams.updateValue(preferred.toJSONString(), forKey: "preferred")
        }
        
        fetcher.performRequest(serviceName: apiNameInURL, apiVersion: apiVersionString, endpoint: "apis", queryParams: queryParams) { (JSON, error) -> () in
            if error != nil {
                completionHandler(nil, error)
            } else if let json = JSON {
                let list = Mapper<DiscoveryDirectoryList>().map(JSON: json)
                completionHandler(list, nil)
            }
        }
    }
    
    func setUpQueryParams() -> [String: String] {
        var queryParams = [String: String]()
        if let alt = alt {
            queryParams.updateValue(alt.rawValue, forKey: "alt")
        }
        if let fields = fields {
            queryParams.updateValue(fields, forKey: "fields")
        }
        if let prettyPrint = prettyPrint {
            queryParams.updateValue(prettyPrint.toJSONString(), forKey: "prettyPrint")
        }
        if let quotaUser = quotaUser {
            queryParams.updateValue(quotaUser, forKey: "quotaUser")
        }
        if let userIp = userIp {
            queryParams.updateValue(userIp, forKey: "userIp")
        }
        return queryParams
    }
    
}

public enum DiscoveryAlt: String {
    case JSON = "json"
}
