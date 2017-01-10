//
//  WeatherYearsListTableViewController.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/31/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class WeatherYearsListTableViewController: UITableViewController {

    private var dataSource: Array<String>? = DataManager.sharedInstance.getYearsList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource != nil ? (dataSource?.count)! : 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherYearCell = tableView.dequeueReusableCell(withIdentifier: "YearCell", for: indexPath) as! WeatherYearCell

        cell.yearLabel.text = dataSource?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Weather Chart View Controller")
        
        if let chartViewController = viewController as? WeatherChartViewController {
            chartViewController.year = dataSource?[indexPath.row]
            self.navigationController?.pushViewController(chartViewController, animated: true)
        }
    }
}
