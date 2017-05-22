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

        
        let set:[Item] = []
        
        return set
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
        
        var set:[Item] = []
        
        set.append(Item(text:"강수량은 시간당 " + String(rna) + "밀리미터 입니다", audio:rnaToAudio(rna:rna)))
        
        return set
    }
    
    
    func rnaToAudio(rna:Int) -> String{
        
        return String("rna") + String(rna)
    }
    
    
    func getCurrentRainSnow() -> [Item]{
        
        var set:[Item] = []
        
        if weatherData.pty == WeatherData.PtyCode.rain{
            set.append(Item(text:"현재는 비가 오고 있고", audio:"current_rain"))
        }
        else if weatherData.pty == WeatherData.PtyCode.rainsnow {
            set.append(Item(text:"현재는 눈과 비가 오고 있고", audio:"current_rain_snow"))
        }
        else if weatherData.pty == WeatherData.PtyCode.snow {
            set.append(Item(text:"현재는 눈이 오고 있고", audio:"current_snow"))
        }
        
        return set;
        
    }
    
}

