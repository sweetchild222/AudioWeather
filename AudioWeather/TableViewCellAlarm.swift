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
    
    @IBOutlet weak var enable: UISwitch!
    
    func updateAlarm(indexPath:IndexPath){
    
        let alarm = AlarmManager().alarms[indexPath.row]
        time.text = getTime(alarm:alarm)
        date.text = "ggadfaefa"
        enable.isOn = alarm.enabled
        enable.tag = indexPath.row
    
    }
    
    
    func getTime(alarm:Alarm) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: alarm.date)
    }
    
    
    @IBAction func tapped(_ sender: UISwitch) {
        
        AlarmManager().alarms[sender.tag].enabled = sender.isOn
        
        time.textColor = sender.isOn ? UIColor.black : UIColor.lightGray
        date.textColor = sender.isOn ? UIColor.darkGray : UIColor.lightGray
        
    }
}
