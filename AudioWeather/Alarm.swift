//
//  Alarm.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

import UserNotifications

struct Alarm : ReflectableProperty{
    
    var enabled: Bool = false
    var date: Date = Date()
    var repeatWeek = [Bool](repeating:false, count:7)
    var locationUpper:String = AddressMap.instance.current
    var locationLower:String = String()
    
    var uuid:String = UUID().uuidString

    func isRepeatWeek() -> Bool{
        
        for week in repeatWeek{
            
            if week == true{
                return true
            }
        }
        
        return false
    }
    
    
    func getNotificationCount() -> Int{
        
        var count:Int = 0
        
        if isRepeatWeek() == true {
            
            for week in repeatWeek{
                
                if week == true{
                    count += 1
                }
            }
        }
        else{
            count = 1
        }
        
        return count
    }
    
    
    init(enabled:Bool, date:Date, repeatWeek:[Bool], address:Address){
        
        self.enabled = enabled
        self.date = date
        self.repeatWeek = repeatWeek
        self.locationUpper = address.getUpper()
        self.locationLower = address.getLower()
        self.uuid = UUID().uuidString
    }
    
    
    init(dict: ReflectableProperty.RepresentationType){
        
        self.enabled = dict["enabled"] as! Bool
        self.date = dict["date"] as! Date
        self.repeatWeek = dict["repeatWeek"] as! [Bool]
        self.locationUpper = dict["locationUpper"] as! String
        self.locationLower = dict["locationLower"] as! String
        self.uuid = dict["uuid"] as! String
    }
    
    

    func getUUID() -> String{
        
        return uuid;
    }

    
    mutating func refreshNewDate(){
        
        if isRepeatWeek() == true{
            return
        }
        
        if self.date > Date() {
            return
        }
        
        let newDate = makeStartDate(alarmDate: self.date)

        self.date = newDate
    }
    
    
    func makeTodayDate(alarmDate:Date) -> Date{
        
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

    
    func makeStartDate(alarmDate:Date) -> Date{
        
        let todayDate = makeTodayDate(alarmDate: alarmDate)
        
        if todayDate < Date(){
            
            return Calendar.current.date(byAdding: .day, value: 1, to: todayDate)!
        }
        else{
            return todayDate
        }
    }
    
    
    var address:Address{
        
        get{
            
            return Address(upper:self.locationUpper, lower:self.locationLower)
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
    

    func findIndex(uuid:String) -> Int{

        var index = 0
        
        for alarm in alarms {
            
            if alarm.getUUID() == uuid {
                
                return index
            }
            
            index += 1
        }
        
        return -1
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
                
                let daySpace = (space == 0 && startDate <= Date()) || (space < 0) ? space + 7 : space
                
                let nextDate = Calendar.current.date(byAdding: .day, value: daySpace, to: startDate)
    
                weeklyDateList.append(nextDate!)
                
            }
        }
        
        return weeklyDateList
    }
    

    func addNotification(uuid:String, date:Date, weekly:Bool){
        
        let content = UNMutableNotificationContent()
        content.title = "일어나세요"
        content.body = "날씨를 알려주세요"
        content.sound = UNNotificationSound(named:"bell.mp3")
        content.categoryIdentifier = UUID().uuidString
        content.userInfo = ["uuid":uuid]

        let current = Calendar.current
    
        let triggerDate =  weekly == true ? current.dateComponents([.weekday, .hour, .minute, .second], from: date) : current.dateComponents([.month, .day, .hour, .minute, .second], from: date)

        let trigger = weekly == true ? UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true) : UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let identifier = UUID().uuidString
        
        print(triggerDate)
    
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        
    }
    
    
    func getRescentDate(completionHandler: @escaping (Date?) -> Swift.Void){
        
        var rescent:Date? = nil
        
        UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { requests in
            
            for request in requests {
                
                guard let trigger = request.trigger as? UNCalendarNotificationTrigger else{
                    return
                }
                
                guard let date = trigger.nextTriggerDate() else{
                    return
                }
                
                if rescent == nil{
                    
                    rescent = date
                }
                else if rescent! > date {
                
                    rescent = date
                }
            }
            
            completionHandler(rescent)
        })
        
    }
    
    
    func getNotificationCount() -> Int{
        
        var count:Int = 0
        let alarms = self.alarms
        
        for alarm in alarms{
            
            if alarm.enabled == false {
                continue
            }

            count += alarm.getNotificationCount()
        }

        return count
    }
    
    
    func setNotification() {
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
        let alarms = self.alarms
        
        for alarm in alarms{
            

            if alarm.enabled == false {
                
                continue
            }
            
            if alarm.isRepeatWeek() == true{
                
                let dates = getWeeklyDate(alarm:alarm)
                
                for date in dates {

                    addNotification(uuid:alarm.uuid, date: date, weekly: true)
                }
            }
            else{

                addNotification(uuid:alarm.uuid, date: alarm.date, weekly: false)
            }
        }
    }
}
