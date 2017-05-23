//
//  ItemSetWillRainSnow.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 22..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetWillRainSnow : ItemSet{
    
    let dataManager:WeatherDataManager
    
    init(dataManager:WeatherDataManager){
        self.dataManager = dataManager
    }
    

    func getItemSet() -> [Item]{
        
        return getStartHour() + getEndHour() + getWillRainSnow()
    }
    
        
    func getWillRainSnow() ->[Item]{
        
        let code = dataManager.getWillPtyCodeRainSnow()
    
        return [Item(text:ptyCodeToText(code:code), audio:ptyCodeToAudio(code:code))]

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
    
    
    func getStartHour() -> [Item] {
        
        let hour = self.dataManager.startHourRainSnow()
        
        if hour == -1 {
            return []
        }
        
        return [Item(text:startHourToText(hour: hour), audio:startHourToAudio(hour: hour))]
    }
    

    
    
    func getEndHour() -> [Item] {
        
        let hour = self.dataManager.endHourRainSnow()
        
        if hour == -1 {
            return []
        }
        
        return [Item(text:endHourToText(hour:hour), audio:endHourToAudio(hour:hour))]
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
