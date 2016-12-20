//
//  DataModel.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/13/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class DataModel {
    
    var year            : String
    var month           : String
    var maxTemperature  : String
    var minTemperature  : String
    var afDays          : String
    var rain            : String
    var sunHours        : String
    var provisional     : String
    
    
    init(array: [String]?) {
        
        self.year              = (array?[0])!
        self.month             = (array?[1])!
        self.maxTemperature    = (array?[2])!
        self.minTemperature    = (array?[3])!
        self.afDays            = (array?[4])!
        self.rain              = (array?[5])!
        self.sunHours          = (array?[6])!
       
        if (array?.count)! == 8 {
            self.provisional = (array?[7])!
        } else {
            self.provisional = ""
        }
    }
}
