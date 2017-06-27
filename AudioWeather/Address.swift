//
//  Address.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 26..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class Address{
    
    let upper:String
    let lower:String
    
    init(upper:String, lower:String){
    
        self.upper = upper
        self.lower = lower
    }
    
    
    func getUpper() -> String{
        
        return self.upper
    }
    
    
    func getLower() -> String{
        
        return self.lower
    }
    
    
    func getText() -> String{
        
        if self.upper == self.lower{
            return self.upper
        }
        
        return self.upper + " " + self.lower
    }
}
