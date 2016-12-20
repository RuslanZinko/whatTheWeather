//
//  DataManager.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/20/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var dataArray : Array<AnyObject>? = []
    
    static let sharedInstance : DataManager = {
        let instance = DataManager()
        return instance
    } ()
}
