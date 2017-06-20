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
    
    var uuid:String = ""
    
    func updateAlarm(uuid:String){
    
        self.uuid = uuid
        
        let index = AlarmManager().findIndex(uuid:uuid)
        
        if index == -1 {
            return
        }
    
        let alarm = AlarmManager().alarms[index]
        
        time.text = getTime(alarm:alarm)
        date.text = "ggadfaefa"
        enable.isOn = alarm.enabled
        updateColor(enabled:alarm.enabled)
    }
    
    
    func getTime(alarm:Alarm) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: alarm.date)
    }
    
    
    func updateColor(enabled:Bool){
        
        time.textColor = enabled ? UIColor.black : UIColor.lightGray
        date.textColor = enabled ? UIColor.darkGray : UIColor.lightGray
    }
    
    
    @IBAction func tapped(_ sender: UISwitch) {
        
        let index = AlarmManager().findIndex(uuid:uuid)
        
        if index == -1 {
            return
        }
        
        AlarmManager().alarms[index].enabled = sender.isOn
        
        AlarmManager().setNotification()
        
        updateColor(enabled:sender.isOn)
    }
}
