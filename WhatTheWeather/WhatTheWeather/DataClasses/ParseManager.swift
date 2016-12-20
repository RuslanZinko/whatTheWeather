//
//  ParseManager.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/13/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

protocol ParseManagerDelegate {
    func updateWith(data: Array<AnyObject>)
}

class ParseManager: NSObject {
    
    static let sharedInstance : ParseManager = {
        let instance = ParseManager()
        return instance
    }()
    
    var deledate : ParseManagerDelegate?
    
    var objArray : Array<AnyObject>? = []
    
    func parseExistFile() {
        DownloadManager.sharedInstance.startDownloadFile { (data, error) in
            let dataString =  String (data: data!, encoding: .utf8)
            let readings = dataString?.components(separatedBy: "\n")
            for index in 7...(readings?.count)! - 2{                                    //reading data which we need
                
                var weatherData = readings?[index].components(separatedBy: " ")
                weatherData = weatherData?.filter({!$0.isEmpty})                        //sorting data which we need
                
                let dataModel = DataModel(array: weatherData)
                
                self.objArray?.append(dataModel)
                
            }
            self.deledate?.updateWith(data: self.objArray!)                             //saving data for TableView viewing
            DataManager.sharedInstance.dataArray = self.objArray
        }
    }
}
