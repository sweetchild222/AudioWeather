//
//  WeatherDataManager.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class WeatherDataManager{
    
    let dataCurrent:WeatherDataCurrent
    let dataClosed:WeatherDataClosed
    let dataSpace:WeatherDataSpace

    
    init(dataCurrent:WeatherDataCurrent, dataClosed:WeatherDataClosed, dataSpace:WeatherDataSpace){
        self.dataCurrent = dataCurrent
        self.dataClosed = dataClosed
        self.dataSpace = dataSpace
    
    }
    
    
    func currentPty() -> WeatherData.PtyCode{
        
        return self.dataCurrent.data.pty
    }
    
    
    func currentRna() -> Int{
        
        return self.dataCurrent.data.rna
    }
    
    
    
    func endHourCurrentRainSnow() -> Int{
    
        let endHourDataClosed = self.dataClosed.endHourCurrentRainSnow()
    
        let endHourDataSpace = self.dataSpace.endHourCurrentRainSnow()
        
        if endHourDataClosed == -1 && endHourDataSpace == -1{
            return -1                   // all day rain
        }
        
        
        if endHourDataClosed == -1{
            return endHourDataSpace
        }
        
        if endHourDataSpace == -1{      // all day rain
            return -1
        }
        
        if endHourDataClosed < endHourDataSpace {
            return endHourDataClosed
        }
        else{
            return endHourDataSpace     // almost impossible
        }
    }
    
    
    func printData(){
        
        print("---- data current----")
        dataCurrent.printData()
        
        print("---- data closed----")
        dataClosed.printData()
        
        print("---- data space----")
        dataSpace.printData()
    }
}
