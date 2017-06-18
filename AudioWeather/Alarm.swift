//
//  Alarm.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

struct Alarm : ReflectableProperty{
    
    var enabled: Bool = false
    var date: Date = Date()
    var repeatWeek = [Bool](repeating:false, count:7)
    var repeatCount:Int = 3
    
    var locationUpper:String = AddressMap.instance.current
    var locationLower:String = String()

    func isRepeatWeek() -> Bool{
        
        for week in repeatWeek{
            
            if week == true{
                return true
            }
        }
        
        return false
    }
    
    
    init(enabled:Bool, date:Date, repeatWeek:[Bool], repeatCount:Int, location:(upper:String, lower:String)){
        
        self.enabled = enabled
        self.date = date
        self.repeatWeek = repeatWeek
        self.repeatCount = repeatCount
        self.locationUpper = location.upper
        self.locationLower = location.lower
    }
    
    
    init(dict: ReflectableProperty.RepresentationType){
        
        self.enabled = dict["enabled"] as! Bool
        self.date = dict["date"] as! Date
        self.repeatWeek = dict["repeatWeek"] as! [Bool]
        self.repeatCount = dict["repeatCount"] as! Int
        self.locationUpper = dict["locationUpper"] as! String
        self.locationLower = dict["locationLower"] as! String
    }
    
    
    var location:(upper:String, lower:String){
        
        get{
            
            return (upper:self.locationUpper, lower:self.locationLower)
        }
    }
    
    static let propertyCount: Int = 6
}



class AlarmManager{
    
    let ud: UserDefaults = UserDefaults.standard
    let persistKey: String = "alarmKey"
    
    
    init() {
        
        alarms = getAlarms()
    }
    
    
    var alarms: [Alarm] = [] {
        
        didSet{
            persist()
        }
    }
    
    
    private func getRepresentation()->[ReflectableProperty.RepresentationType] {
        
        return alarms.map {$0.representation}
    }

    
    private func persist() {

        ud.set(getRepresentation(), forKey: persistKey)
        ud.synchronize()
    }
    
    
    private func unpersist() {
        
        for key in ud.dictionaryRepresentation().keys {
            
            UserDefaults.standard.removeObject(forKey: key.description)
        }
    }
    
    
    var count: Int {
        
        return alarms.count
    }
    
    
    private func getAlarms() -> [Alarm] {
        
        let array = UserDefaults.standard.array(forKey: persistKey)
        
        guard let alarmArray = array else {
            
            return [Alarm]()
        }
        
        if let dicts = alarmArray as? [ReflectableProperty.RepresentationType]{
            
            if dicts.first?.count == Alarm.propertyCount {
                
                return dicts.map{Alarm(dict:$0)}
            }
        }
        
        unpersist()
        
        return [Alarm]()
    }

    
    func makeStartDate(alarmDate:Date) -> Date{
        
        let calendar = Calendar.current
        
        let date = Date()
        
        let year = calendar.component(.year, from: date)
        
        let month = calendar.component(.month, from: date)
        
        let day = calendar.component(.day, from: date)
        
        let hour = calendar.component(.hour, from: alarmDate)
        
        let minute = calendar.component(.minute, from: alarmDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd/HH:mm:ss"
        let stringTime = "\(year)-\(month)-\(day)/\(hour):\(minute):0"
        
        return dateFormatter.date(from: stringTime)!
    }
    
    
    
    func getWeeklyDate(alarm:Alarm) -> [Date]{
        
        let count = alarm.repeatWeek.count
        
        let startDate = makeStartDate(alarmDate:alarm.date)

        let weekInt = Calendar.current.component(.weekday, from: startDate) - 1
        
        var weeklyDateList:[Date] = []
    
        for weekIndex in 0..<count{
            
            if alarm.repeatWeek[weekIndex] == true{
                
                let space = weekIndex - weekInt
                
                let daySpace = (space == 0 && startDate < Date()) || (space < 0) ? space + 7 : space
                
                let nextDate = Calendar.current.date(byAdding: .day, value: daySpace, to: startDate)
    
                weeklyDateList.append(nextDate!)
                
                print(nextDate!.description(with: Locale.current))
                
            }
        }
        
        return weeklyDateList
    }
    
    
    func setNotificationWeekly(alarm:Alarm){
        
        let dates = getWeeklyDate(alarm:alarm)
        
        print(dates.count)
    }
    
    
    func setNotificationFixDate(alarm:Alarm){
        
        
        
    }
    
    
    func setNotification() {
        
        let alarms = getAlarms()
        
        for alarm in alarms{
            
            if alarm.enabled == false {
                continue
            }
            
            if alarm.isRepeatWeek() == true{
                
                setNotificationWeekly(alarm:alarm)
            }
            else{
                
            }
            
        }
        
    
    }
}
