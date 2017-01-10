//
//  WeatherChartViewController.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/31/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit
import Charts

class WeatherChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    var year: String?
    private var maxTemp: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setChart(values: DataManager.sharedInstance.getTemperatureList(year: self.year!, isMaxTemperature: maxTemp)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<values.count {
            let dataEntry = BarChartDataEntry(x:Double(i+1), y:values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: self.maxTemp == false ? "Min Temperature" : "Max Temperature")
        chartDataSet.colors = self.maxTemp == false ? [NSUIColor(red: 140.0/255.0, green: 234.0/255.0, blue: 255.0/255.0, alpha: 1.0)] : [NSUIColor.red]
        let chartData = BarChartData(dataSets: [chartDataSet])
        barChartView.data = chartData
        barChartView.xAxis.labelPosition = .bottom
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInQuad)
        barChartView.chartDescription?.text = ""
    }
    
    //MARK: Segmented control 
    
    @IBAction func segmentedControlValueChanged(segment: UISegmentedControl) {
        self.maxTemp = segment.selectedSegmentIndex == 1
        self.setChart(values: DataManager.sharedInstance.getTemperatureList(year: self.year!, isMaxTemperature: self.maxTemp)!)
    }
}
