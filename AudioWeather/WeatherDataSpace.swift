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
}
