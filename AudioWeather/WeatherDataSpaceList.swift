//
//  WeatherDataSpace.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 10..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class WeatherDataSpaceList{
    
    let dataList:[WeatherData]
    let tmx:Float?
    
    init(dataList:[WeatherData], tmx:Float?){
     
        self.dataList = dataList
        self.tmx = tmx
    }
    
    
    func count() ->Int{
        
        return dataList.count
    }
    
    
    func getDataList() -> [WeatherData]{
        
        return self.dataList
    }

}
