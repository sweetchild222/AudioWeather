//
//  WeatherDataClosed.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class WeatherDataClosed{
    
    let dataList:[WeatherData]
    
    init(dataList:[WeatherData]) {
        self.dataList = dataList
    }
    
    
    func printData(){
        
        for data in dataList{
        
            data.printData()
        }
    }
    
    
    func endHourCurrentRainSnow() -> Int{
        
        for data in dataList {
            
            if data.pty == .clean {
                
                return data.htm
            }
        }
        
        return -1
    }
    
    
    func getPtyCodeRainSnow() -> WeatherData.PtyCode{
        
        for data in dataList {
            
            if data.pty != .clean {
                
                return data.pty
            }
        }
        
        return .clean
    }
    
    
    func getPop() -> Int{
        
        var popSum = 0
        var popCount = 0
        
        for data in dataList {
            
            if data.pty != .clean {
                
                popSum += data.pop
                popCount += 1
            }
        }
        

        if popCount == 0{
            return 0
        }
        
        return popSum / popCount
    }
    
    
    func getRna() -> Int{
        
        var rnaSum = 0
        
        for data in dataList {
            
            if data.pty != .clean {
                
                rnaSum += data.rna
                
            }
        }
        
        return rnaSum
    }
    
    
    func startHourRainSnow() -> Int{
        
        for data in dataList {
            
            if data.pty != .clean {
                
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
                
                if data.pty != .clean {
                    
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
