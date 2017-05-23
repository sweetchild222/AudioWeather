//
//  WeatherDataSpace.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class WeatherDataSpace{
    
    let dataList:[WeatherData]
    let tmx:Float?
    
    init(dataList:[WeatherData], tmx:Float?){
        
        self.dataList = dataList
        self.tmx = tmx
    }
    
    
    func count() ->Int{
        
        return dataList.count
    }
    
    
    func printData(){
     
        for data in dataList{
            
            data.printData()
        }
    }
    
    
    func endHourCurrentRainSnow() -> Int{
        
        for data in dataList {
            
            if data.pty == WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    func getPtyCodeRainSnow() -> WeatherData.PtyCode{
        
        for data in dataList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.pty
            }
        }
        
        return WeatherData.PtyCode.clean
    }
    
    
    func startHourRainSnow() -> Int{
        
        for data in dataList {
            
            if data.pty != WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    func endHourRainSnow() -> Int{
        
        let startHour = startHourRainSnow()
        
        if startHour == -1{
            return -1
        }
        
        var endHour = -1
        
        for data in dataList {
            
            if data.htm >= startHour{
                
                if data.pty != WeatherData.PtyCode.clean {
                    
                    endHour = data.htm + data.hrs
                }
                else{
                    
                    if endHour != -1{
                        return endHour
                    }
                }
            }
        }
        
        return endHour
    }
}
