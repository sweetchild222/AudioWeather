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
    
    
    
    func startHourRainSnow() -> Int{
        
        let startHourDataClosed = self.dataClosed.startHourRainSnow()
        
        let startHourDataSpace = self.dataSpace.startHourRainSnow()
        

        if startHourDataSpace == -1 && startHourDataClosed == -1{  //error
            return -1
        }

    
        if startHourDataSpace == -1{
            return startHourDataClosed
        }
            
        if startHourDataClosed == -1{
            return startHourDataSpace
        }
            
        if startHourDataSpace > startHourDataClosed {
            return startHourDataClosed
        }
        else{
            return startHourDataSpace           // almost impossible
        }
    }
    
    
    func endHourRainSnow() -> Int{
        
        let endHourDataClosed = self.dataClosed.endHourRainSnow()
        let endHourDataSpace = self.dataSpace.endHourRainSnow()
        
        if endHourDataClosed == -1 && endHourDataSpace == -1{  //error
            return -1
        }
        
        
        if endHourDataSpace == -1{
            return endHourDataClosed
        }
        
        if endHourDataClosed == -1{
            return endHourDataSpace
        }
        
        if endHourDataSpace > endHourDataClosed {
            return endHourDataSpace
        }
        else{
            return endHourDataClosed
        }
    }
    
    
    
    func getPop() -> Int{
        
        //let popDataClosed = self.dataClosed.getPop()
        
        let popDataSpace = self.dataSpace.getPop()
        
        //return (popDataClosed + popDataSpace) / 2
        
        return popDataSpace
    }
    
    
    
    func getRna() -> Int{
        
        let rnaDataSpace  = self.dataSpace.getRna()
        
        return rnaDataSpace
    }
    
    
    
    func getWillPtyCodeRainSnow() -> WeatherData.PtyCode{
        
        let codeDataClosed = self.dataClosed.getPtyCodeRainSnow()
        let codeDataSpace = self.dataSpace.getPtyCodeRainSnow()
        
        if codeDataClosed != WeatherData.PtyCode.clean {
            
            return codeDataClosed
        }
        
        if codeDataSpace != WeatherData.PtyCode.clean {
            
            return codeDataSpace
        }
        
        return WeatherData.PtyCode.clean

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
