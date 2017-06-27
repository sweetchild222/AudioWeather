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
        date.text = getDate(alarm:alarm)
    
        enable.isOn = alarm.enabled
        updateColor(enabled:alarm.enabled)
    }
    
    
    func getWeekString(repeatWeek:[Bool]) -> String{
        
        let weekString = ["일", "월", "화", "수", "목", "금", "토"]
        
        var text:String = String()
        
        for index in 0..<repeatWeek.count {
            
            if repeatWeek[index] == true {
                
                text += (weekString[index] + ", ")
            }
        }
        
        
        return String(text.characters.dropLast(2))
    }
    
    
    func getDate(alarm:Alarm) -> String{
        
        if alarm.isRepeatWeek() == true{
            
            return getWeekString(repeatWeek:alarm.repeatWeek)
        }
        else if alarm.enabled == true{
            
            return getFixDate(date:alarm.date)
        }
        else{
            
            return String()
        }

    }
    
    
    func getFixDate(date:Date) -> String{
        
        let weekInt = Calendar.current.component(.weekday, from: date)

        let weekString = ["일", "월", "화", "수", "목", "금", "토"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일 (" + weekString[weekInt - 1] + ")"
        return dateFormatter.string(from: date)
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
    
    
    func checkMaxNotification(index:Int) -> Bool{

        let notiCount = AlarmManager().alarms[index].getNotificationCount()
        
        if (AlarmManager().getNotificationCount() + (notiCount)) > 64{
            
            return true
        }
        
        return false
    }

    @IBAction func tapped(_ sender: UISwitch) {
        
        let index = AlarmManager().findIndex(uuid:uuid)
        
        if index == -1 {
            return
        }
        
        if sender.isOn == true && checkMaxNotification(index:index) == true{
            
            sender.isOn = false
            NotificationCenter.default.post(name: Notification.Name("showOverMax"), object: nil)
            return
        }
        
        AlarmManager().alarms[index].enabled = sender.isOn
        
        if sender.isOn == true{

            AlarmManager().alarms[index].refreshNewDate()
        }
        
        AlarmManager().setNotification()

        date.text = getDate(alarm:AlarmManager().alarms[index])
        updateColor(enabled:sender.isOn)
        
        NotificationCenter.default.post(name: Notification.Name("showRescent"), object: nil)
    }
}
