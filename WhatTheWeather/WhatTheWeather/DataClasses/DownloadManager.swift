//
//  DownloadManager.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/13/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class DownloadManager: NSObject {
    
    static let sharedInstance : DownloadManager = {
        let instance = DownloadManager()
        return instance
    } ()
    
    typealias completionBlock = (_ result: Data?, _ error: Error?) -> Void
    
        public func startDownloadFile(completion: @escaping completionBlock) {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let destinationURLForFile = documents.appendingFormat("/file.txt")                              // name of file witch we want to save
        if Foundation.FileManager().fileExists(atPath: destinationURLForFile) {
            let fileData: Data? = Foundation.FileManager().contents(atPath: destinationURLForFile)      // if this file is already exist, we are read data from file
            completion(fileData, nil)
        } else {
            let url = URL (string: "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt")!
            URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
                do {
                    try data?.write(to: URL(fileURLWithPath: destinationURLForFile), options: .atomic)  // download file, if it wasn`t downloaded
                    completion(data, nil)
                } catch {
                    completion(nil, error)                                                              // if there is an error
                }
                }.resume()
        }
    }
}
