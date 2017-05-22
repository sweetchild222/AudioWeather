//
//  ItemSetWillRainSnow.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 22..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetWillRainSnow : ItemSet{
    
    let weatherData:WeatherData
    let weatherDataTimeList:[WeatherData]
    let weatherDataSpaceList:WeatherDataSpaceList
    
    init(weatherData:WeatherData, weatherDataTimeList:[WeatherData], weatherDataSpaceList:WeatherDataSpaceList){
        self.weatherData = weatherData
        self.weatherDataTimeList = weatherDataTimeList
        self.weatherDataSpaceList = weatherDataSpaceList
    }
    
    
    func getItemSet() -> [Item]{
        
        return getStartTime() + getEndTime() + getWillRainSnow()
    }
    
    
    func getPtyCode() -> WeatherData.PtyCode{
        
        for data in weatherDataTimeList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.pty
            }
        }
        
        for spaceData in weatherDataSpaceList.dataList{
            
            if spaceData.pty != WeatherData.PtyCode.clean {
                
                return spaceData.pty
            }
        }
        
        return WeatherData.PtyCode.clean // error
    }
    
    
    func getWillRainSnow() ->[Item]{
        
        let code = getPtyCode()
        
        var set:[Item] = []
        
        set.append(Item(text:ptyCodeToText(code:code), audio:ptyCodeToAudio(code:code)))
        
        return set;
    }
    
    
    
    func ptyCodeToAudio(code:WeatherData.PtyCode) -> String{
        
        switch code{
            
        case WeatherData.PtyCode.rain:
            return "will_rain"
        case WeatherData.PtyCode.rainsnow:
            return "will_rain_snow"
        case WeatherData.PtyCode.snow:
            return "will_snow"
        default:
            return "will_rain"
        }
    }
    
    
    func ptyCodeToText(code:WeatherData.PtyCode) -> String{
        
        switch code{
            
        case WeatherData.PtyCode.rain:
            return "비가 오겠습니다"
        case WeatherData.PtyCode.rainsnow:
            return "눈과 비가 오겠습니다"
        case WeatherData.PtyCode.snow:
            return "눈이 오겠습니다"
        default:
            return "비가 오겠습니다"
        }
    }
    
    
    func getStartTime() -> [Item] {
        
        var set:[Item] = []
        
        let hour = findStartTime()
        
        if hour != -1 {
            set.append(Item(text:startHourToText(hour: hour), audio:startHourToAudio(hour: hour)))
        }
        
        return set;
    }
    
    
    func findStartTimeOnSpace() -> Int{
        
        let spaceDataList = weatherDataSpaceList.getDataList()
        
        for data in spaceDataList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    
    func findStartTimeOnTime() -> Int{
        
        for data in weatherDataTimeList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    
    func findStartTime() -> Int{
        
        let startTimeSpace = findStartTimeOnSpace()
        
        let startTimeTime = findStartTimeOnTime()
        
        if startTimeSpace == -1 && startTimeTime == -1{  //error
            return -1
        }
        
        if startTimeSpace == -1{
            return startTimeTime
        }
        
        if startTimeTime == -1{
            return startTimeSpace
        }
        
        if startTimeSpace < startTimeTime{
            return startTimeSpace
        }
        else{
            return startTimeTime
        }
    }
    

    
    func findEndTimeOnSpace() -> Int{
        
        let spaceDataList = weatherDataSpaceList.getDataList()
        
        for data in spaceDataList.reversed() {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm + data.hrs
            }
        }
        
        return -1
    }
    
    
    
    func findEndTimeOnTime() -> Int{
        
        for data in weatherDataTimeList.reversed() {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm + data.hrs
            }
        }
        
        return -1
    }
    
    
    
    func findEndTime() -> Int{
        
        let endTimeSpace = findEndTimeOnSpace()
        
        let endTimeTime = findEndTimeOnTime()
        
        if endTimeSpace == -1 && endTimeTime == -1{
            return -1
        }
                
        if endTimeSpace > endTimeTime{
            return endTimeSpace
        }
        else{
            return endTimeTime
        }
    }
    
    
    func getEndTime() -> [Item] {
        
        var set:[Item] = []
        
        let hour = findEndTime()
        
        if hour != -1 {
            
            set.append(Item(text:endHourToText(hour:hour), audio:endHourToAudio(hour:hour)))
        }
        
        return set;
    }
    
    
    
    func startHourToAudio(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("from_hour_") + String(index) + String(am == true ? "am" : "pm")
    }
    
    
    
    func startHourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시 부터")
    }

    
    
    func endHourToAudio(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("to_hour_") + String(index) + String(am == true ? "am" : "pm")
    }
    
    
    
    func endHourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시 까지")
    }


}
