//
//  WeatherDataCurrent.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class WeatherDataCurrent{
    
    let data:WeatherData
    
    init(data:WeatherData){
        
        self.data = data
    }
    
    func printData(){
        
        data.printData()
    }
}
