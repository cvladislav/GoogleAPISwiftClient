//
//  GoogleService.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 5/18/15.
//  Copyright (c) 2015 Matthew Wyskiel. All rights reserved.
//

import Foundation
import Alamofire

protocol GoogleService {
    var apiNameInURL: String {
        get
    }
    /** begins with 'v' followed by number */
    var apiVersionString: String {
        get
    }
    var fetcher: GoogleServiceFetcher {
        get
    }

    init()
}

open class GoogleServiceFetcher {
    let baseURL = "https://www.googleapis.com"
    open var accessToken: String? {
        didSet {
            if apiKey != nil {
                apiKey = nil
            }
        }
    }
    open var apiKey: String? {
        didSet {
            if accessToken != nil {
                accessToken = nil
            }
        }
    }

    func performRequest(_ method: Alamofire.HTTPMethod = .get,
                        serviceName: String, apiVersion: String,
                        endpoint: String, queryParams: [String: String],
                        postBody: [String: AnyObject]? = nil,
                        uploadParameters: UploadParameters? = nil,
                        completionHandler: @escaping (_ JSON: [String: AnyObject]?, _ error: NSError?) -> ()) {

        if uploadParameters != nil {
            performFileUpload(method, serviceName: serviceName, apiVersion: apiVersion, endpoint: endpoint, queryParams: queryParams, postBody: postBody, uploadParameters: uploadParameters!, completionHandler: { (JSON, error) in
                completionHandler(JSON, error)
            })
            return
        }

        let url = baseURL + "/\(serviceName)/\(apiVersion)/\(endpoint)"
        var finalQueryParams = queryParams
        var headers: [String: String] = [:]
        if accessToken != nil {
            headers.updateValue("Bearer \(accessToken!)", forKey: "Authorization")
        } else if apiKey != nil {
            finalQueryParams.updateValue(apiKey!, forKey: "key")
        }
        let request = multiEncodedURLRequest(method, URLString: url, URLParameters: finalQueryParams, bodyParameters: postBody, headers: headers)
        AF.request(request)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? [String : AnyObject], nil)
                case .failure(let error):
                    let alamofireError = error
                    if let responseData = response.data {
                        do {
                            let JSON = try JSONSerialization.jsonObject(with: responseData) as! [String: AnyObject]
                            let errJSON = JSON["error"] as! [String: AnyObject]
                            let errSpecificsArr = errJSON["errors"] as! [[String: AnyObject]]
                            let errSpecifics = errSpecificsArr[0]
                            let errorObj = NSError(domain: errSpecifics["domain"] as! String, code: errJSON["code"] as! Int, userInfo: errSpecifics)

                            completionHandler(nil, errorObj)
                        } catch {
                            completionHandler(nil, alamofireError as NSError?)
                        }

                    }
                }
        }
    }

    fileprivate func performFileUpload(_ method: Alamofire.HTTPMethod = .get, serviceName: String, apiVersion: String, endpoint: String, queryParams: [String: String], postBody: [String: AnyObject]? = nil, uploadParameters: UploadParameters, completionHandler: @escaping (_ JSON: [String: AnyObject]?, _ error: NSError?) -> ()) {
        let url = baseURL + "/\(serviceName)/\(apiVersion)/\(endpoint)"
        var finalQueryParams = queryParams
        var headers: [String: String] = ["Content-Type":uploadParameters.MIMEType]
        if accessToken != nil {
            headers.updateValue("Bearer \(accessToken!)", forKey: "Authorization")
        } else if apiKey != nil {
            finalQueryParams.updateValue(apiKey!, forKey: "key")
        }
        let request = multiEncodedURLRequest(method, URLString: url, URLParameters: queryParams, bodyParameters: postBody, headers: headers)
        

            
        AF.upload(uploadParameters.data, with: request).uploadProgress { (progress) in
                //uploadParameters.progressHandler?(bytesWritten: 0, totalBytesWritten: 0, totalBytesExpectedToWrite: 0)

                // This closure is NOT called on the main queue for performance
                // reasons. To update your ui, dispatch to the main queue.
            }
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? [String : AnyObject], nil)
                case .failure(let error):
                    let alamofireError = error
                    if let responseData = response.data {
                        do {
                            let JSON = try JSONSerialization.jsonObject(with: responseData) as! [String: AnyObject]
                            let errJSON = JSON["error"] as! [String: AnyObject]
                            let errSpecificsArr = errJSON["errors"] as! [[String: AnyObject]]
                            let errSpecifics = errSpecificsArr[0]
                            let errorObj = NSError(domain: errSpecifics["domain"] as! String, code: errJSON["code"] as! Int, userInfo: errSpecifics)

                            completionHandler(nil, errorObj)
                        } catch {
                            completionHandler(nil, alamofireError as NSError?)
                        }
                    }
                }
            }
    }

    fileprivate func multiEncodedURLRequest(
        _ method: Alamofire.HTTPMethod,
        URLString: URLConvertible,
        URLParameters: [String: String],
        bodyParameters: [String: AnyObject]?,
        headers: [String: String]) -> URLRequest
    {
        let tempURLRequest = Foundation.URLRequest(url: try! URLString.asURL())

        let URLRequest = try? URLEncoding().encode(tempURLRequest, with: URLParameters)
        let bodyRequest = try? JSONEncoding().encode(tempURLRequest, with: bodyParameters)

        var compositeRequest = URLRequest!
        compositeRequest.httpMethod = method.rawValue
        compositeRequest.httpBody = bodyRequest?.httpBody
        for (key, value) in headers {
            compositeRequest.addValue(value, forHTTPHeaderField: key)
        }
        compositeRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return compositeRequest
    }
}
