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
            
            if data.pty == WeatherData.PtyCode.clean {
                
                return data.htm
            }
        }
        
        return -1
    }

}
