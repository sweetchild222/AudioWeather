//
//  WeatherDataManager.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class WeatherDataManager{
    
    var dataCurrent:WeatherDataCurrent?
    var dataClosed:WeatherDataClosed?
    var dataSpace:WeatherDataSpace?

    
    public func setDataCurrent(dataCurrent:WeatherDataCurrent?){
        
        self.dataCurrent = dataCurrent
    }

    
    func setDataClosed(dataClosed:WeatherDataClosed?){
        
        self.dataClosed = dataClosed
    }
    

    func setDataSpace(dataSpace:WeatherDataSpace?){
        
        self.dataSpace = dataSpace
    }
    
    
    func printData(){
        
        if dataCurrent != nil{
            print("---- data current----")
            dataCurrent?.printData()
        }
        
        if dataClosed != nil{
            print("---- data closed----")
            dataClosed?.printData()
        }

        
        if dataSpace != nil{
            print("---- data space----")
            dataSpace?.printData()
        }

    }
}
