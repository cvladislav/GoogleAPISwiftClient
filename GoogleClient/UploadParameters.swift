//
//  UploadParameters.swift
//  GoogleClient
//
//  Created by Matthew Wyskiel on 3/31/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation

public struct UploadParameters {
    public var progressHandler: ((_ bytesWritten: Int64, _ totalBytesWritten: Int64, _ totalBytesExpectedToWrite: Int64) -> ())? = nil
    public var MIMEType: String
    public var data: Data
    
    public init(data: Data, MIMEType: String) {
        self.data = data
        self.MIMEType = MIMEType
    }
}
