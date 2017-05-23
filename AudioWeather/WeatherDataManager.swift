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
    

    func printData(){
        
        print("---- data current----")
        dataCurrent.printData()
        
        print("---- data closed----")
        dataClosed.printData()
        
        print("---- data space----")
        dataSpace.printData()

    }
}
