//
//  TableViewCellAlarm.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 12..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class TableViewCellAlarm: UITableViewCell {

    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var date: UILabel!
    
    func updateAlarm(alarm:Alarm){
    
        time.text = "gege"
        date.text = "ggadfaefa"
    }
}
