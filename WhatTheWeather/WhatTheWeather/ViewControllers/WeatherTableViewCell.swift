//
//  WeatherTableViewCell.swift
//  WhatTheWeather
//
//  Created by Ruslan Zinko on 12/14/16.
//  Copyright © 2016 Ruslan Zinko. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var yearLabel        : UILabel!
    @IBOutlet weak var maxTempLabel     : UILabel!
    @IBOutlet weak var afDaysLabel      : UILabel!
    @IBOutlet weak var monthLabel       : UILabel!
    @IBOutlet weak var minTempLabel     : UILabel!
    @IBOutlet weak var rainLadel        : UILabel!
    @IBOutlet weak var sunHoursLabel    : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
