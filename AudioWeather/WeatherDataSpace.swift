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
    
    
    
    func getTmx() -> Float?{
        
        return self.tmx
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
    
    
    
    func getRna() -> Int{
        
        var rnaSum = 0
        
        for data in dataList {
            
            if data.pty != .clean {
                
                rnaSum += data.rna
                
            }
        }
        
        return rnaSum
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

    
    func isAMSkyCode() -> Bool{
        
        for data in dataList {
            
            if data.htm < 12 {
                return true
            }
        }
        
        return false
    }
    
    
    func isPMSkyCode() -> Bool{
        
        for data in dataList {
            
            if data.htm >= 12 {
                return true
            }
        }
        
        return false
    }
    
    
    func getAMSkyCode() -> WeatherData.SkyCode{
        
        return getSkyCode(ampm:true)
    }
    
    
    func getPMSkyCode() -> WeatherData.SkyCode{
        
        return getSkyCode(ampm:false)
    }
    
    
    func getSkyCode(ampm:Bool) -> WeatherData.SkyCode {
        
        var cleanCount = 0
        var smallCount = 0
        var muchCount = 0
        var grayCount = 0
        
        for data in dataList {
            
            if (ampm == true && data.htm < 12) || (ampm == false && data.htm >= 12) {
                
                switch data.sky{
                    
                case .clean:
                    cleanCount += 1
                case .small:
                    smallCount += 1
                case .much:
                    muchCount += 1
                case .gray:
                    grayCount += 1

                }
            }
        }
        
        if grayCount >= muchCount && grayCount >= smallCount && grayCount >= cleanCount {
            return .gray
        }
        else{
            
            if muchCount >= smallCount && muchCount >= cleanCount{
                
                return .much
            }
            else{
                
                if smallCount >= cleanCount {
                    return .small
                }
                else{
                    return .clean
                }
            }
        }
    }
}
