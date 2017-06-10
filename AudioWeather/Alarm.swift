//
//  Alarm.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class Alarm : ReflectableProperty{
    
    var enabled: Bool = false
    var date: Date = Date()
    var repeatWeek = [Bool](repeating:false, count:7)
    var repeatCount:Int = 3
    
    var locationUpper:String = AddressMap.instance.current
    var locationLower:String = ""

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
    
    
    required init(dict: ReflectableProperty.RepresentationType){
        
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
}
