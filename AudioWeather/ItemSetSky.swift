//
//  ItemSetSky.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class ItemSetSky : ItemSet{
    
    let weatherData:WeatherData
    let weatherDataTimeList:[WeatherData]
    let weatherDataSpaceList:WeatherDataSpaceList
    
    init(weatherData:WeatherData, weatherDataTimeList:[WeatherData], weatherDataSpaceList:WeatherDataSpaceList){
        self.weatherData = weatherData
        self.weatherDataTimeList = weatherDataTimeList
        self.weatherDataSpaceList = weatherDataSpaceList
    }
    
    
    func getItemSet() -> [Item]{
        
        if weatherData.pty != WeatherData.PtyCode.clean {
            
            return getCurrentRainSnow() + getEndRainSnow() + getRnaRainSnow()
        }
        
        
        let code = getPtyCode()
        
        if code == WeatherData.PtyCode.clean {
            
            return getStartWillRainSnow() + getWillRainSnow(code: code)
        }
        

        let set:[Item] = []
        
        return set
    }
    
    
    func getPtyCode() -> WeatherData.PtyCode{
        
        for data in weatherDataTimeList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.pty
            }
        }
        

        for spaceData in weatherDataSpaceList.dataList.reversed(){
            
            if spaceData.pty != WeatherData.PtyCode.clean {
                
                return spaceData.pty
            }
        }

        return WeatherData.PtyCode.clean
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
            return ""
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
            return ""
        }
    }
    
    
    func getWillRainSnow(code:WeatherData.PtyCode) ->[Item]{
        
        var set:[Item] = []
        
        set.append(Item(text:ptyCodeToText(code:code), audio:ptyCodeToAudio(code:code)))
        
        return set;
    }
    
    
    func getStartWillRainSnow() -> [Item] {
        
        var set:[Item] = []
        
        let hour = findStartTimeRainSnow()
        
        if hour == -1 {
            
            set.append(Item(text:"하루 종일 맑겠습니다", audio:"allday_clean")) // error
        }
        else{

            set.append(Item(text:"하루 종일 맑겠습니다", audio:"allday_clean")) // error

        }
        
        return set;
    }

    
    func findStartTimeRainSnowOnSpace() -> Int{
        
        let spaceDataList = weatherDataSpaceList.getDataList()
        
        for data in spaceDataList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    
    func findStartTimeRainSnowOnTime() -> Int{
        
        for data in weatherDataTimeList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    
    func findStartTimeRainSnow() -> Int{
        
        let startTimeSpace = findStartTimeRainSnowOnSpace()
        
        let startTimeTime = findStartTimeRainSnowOnTime()
        
        if startTimeSpace == -1 && startTimeTime == -1{
            return -1
        }
        
        if startTimeSpace < startTimeTime{
            return startTimeSpace
        }
        else{
            return startTimeTime
        }
    }
    
    
    
    
    func findEndTimeRainSnowOnSpace() -> Int{
        
        let spaceDataList = weatherDataSpaceList.getDataList()
    
        for data in spaceDataList.reversed() {
            
            if data.pty != WeatherData.PtyCode.clean {
            
                return data.htm + data.hrs
            }
        }
        
        return -1
    }
    
    
    
    func findEndTimeRainSnowOnTime() -> Int{
        
        for data in weatherDataTimeList.reversed() {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm + data.hrs
            }
        }
        
        return -1
    }

    
    
    func findEndTimeRainSnow() -> Int{
        
        let endTimeSpace = findEndTimeRainSnowOnSpace()
        
        let endTimeTime = findEndTimeRainSnowOnTime()
        
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
    
    
    
    func getEndRainSnow() -> [Item] {
        
        var set:[Item] = []
        
        let hour = findEndTimeRainSnow()
        
        if hour == -1 {
            
            set.append(Item(text:"하루 종일 이어지겠습니다", audio:"current_allday"))
        }
        else{
            
            set.append(Item(text:hourToText(hour:hour), audio:hourToAudio(hour:hour)))
        }
        
        return set;
    }
    
    
    
    func hourToAudio(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("current_hour_") + String(index) + String(am == true ? "am" : "pm")
    }
    
    
    
    func hourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시 까지 이어지겠습니다")
    }
    
    
    func calcRnaRainSnow() -> Int{
        
        var rnaSum:Int = 0
        var timeSpanSum:Int = 0
        
        for data in weatherDataTimeList {
            
            if data.rna > 0 {
                
                rnaSum += data.rna
                timeSpanSum += data.hrs
            }
        }
        
        
        let spaceDataList = weatherDataSpaceList.getDataList()
        
        for data in spaceDataList {
            
            if data.rna > 0 {
                
                rnaSum += data.rna
                timeSpanSum += data.hrs
            }
        }
        
        
        if weatherData.rna > 0 {
            
            rnaSum += weatherData.rna
            timeSpanSum += weatherData.hrs
        }
        
        if timeSpanSum == 0 {
            return 0
        }
        
        return rnaSum / timeSpanSum
        
    }
    
    
    func getRnaRainSnow() -> [Item] {
        
        let rna = calcRnaRainSnow()
    
        return [Item(text:"강수량은 시간당 " + String(rna) + "밀리미터 입니다", audio:rnaToAudio(rna:rna))]
    }
    
    
    func rnaToAudio(rna:Int) -> String{
        
        return String("rna") + String(rna)
    }
    
    
    func getCurrentRainSnow() -> [Item]{
        
        if weatherData.pty == WeatherData.PtyCode.rain{
            return [Item(text:"현재는 비가 오고 있고", audio:"current_rain")]
        }
        else if weatherData.pty == WeatherData.PtyCode.rainsnow {
            return [Item(text:"현재는 눈과 비가 오고 있고", audio:"current_rain_snow")]
        }
        else if weatherData.pty == WeatherData.PtyCode.snow {
            return [Item(text:"현재는 눈이 오고 있고", audio:"current_snow")]
        }
        
        return [];
        
    }
    
}

