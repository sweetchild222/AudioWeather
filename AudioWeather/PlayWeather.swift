//
//  PlayWeather.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class PlayWeather{
    
    let address:Address
    
    init(address:Address){
        
        self.address = address
    }
    
    
    func play(){
        
        
        print("play")
        print(self.address.getUpper())
        print(self.address.getLower())
        
    }
    
    
    func stop(){
        
        print("stop")
    }
}
