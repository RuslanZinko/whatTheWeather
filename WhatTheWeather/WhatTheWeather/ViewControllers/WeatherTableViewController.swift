//
//  WeatherTableViewController.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/13/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController, ParseManagerDelegate {
    
    var objectsData : [AnyObject] = []
    var indicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator()
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.white
        ParseManager.sharedInstance.deledate = self
        ParseManager.sharedInstance.parseExistFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ParseManagerDelegate
    
    func updateWith(data: Array<AnyObject>) {
        objectsData = data
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        
        let dataForRow = objectsData[indexPath.row] as! DataModel
        cell.yearLabel.text     = dataForRow.year
        cell.monthLabel.text    = dataForRow.month
        cell.maxTempLabel.text  = dataForRow.maxTemperature
        cell.minTempLabel.text  = dataForRow.minTemperature
        cell.afDaysLabel.text   = dataForRow.afDays
        cell.rainLadel.text     = dataForRow.rain
        cell.sunHoursLabel.text = dataForRow.sunHours
    
        return cell
    }
    
    
    //MARK: Activity Indicator
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect (x: 0, y: 0, width: 40.0, height: 40.0))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }

   }

