//
//  DataManager.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/20/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var dataArray: Array<AnyObject>? = []
    
    static let sharedInstance : DataManager = {
        let instance = DataManager()
        return instance
    } ()
    
    func getYearsList() -> Array<String>? {
        var yearList: Array<String>? = []
        
        if let array = self.dataArray as! Array<DataModel>? {
            for element in array {
                if yearList?.contains(element.year) == false {
                    yearList?.append(element.year)
                }
            }
        }
        
        return yearList?.reversed()
    }
    
    func getTemperatureList(year:String, isMaxTemperature: Bool) -> Array<Double>? {
        var minTemperature: Array<Double>? = []
        
        if let array = self.dataArray as! Array<DataModel>? {
            for element in array {
                if element.year == year {
                    minTemperature?.append(Double(isMaxTemperature == true ? element.maxTemperature : element.minTemperature)!)
                }
            }
        }
        
        return minTemperature
    }
}
