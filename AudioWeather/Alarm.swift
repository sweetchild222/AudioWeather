//
//  Alarm.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class Alarm{
    
    var enabled: Bool = false
    var date: Date = Date()
    var repeatWeek = [Bool](repeating:false, count:7)
    var repeatCount:Int = 3
    
    var location:(upper:String, lower:String) = (upper:AddressMap.instance.cuurent, lower:"")
    
    func isRepeatWeek() -> Bool{
        
        for week in repeatWeek{
            
            if week == true{
                return true
            }
        }
        
        return false
    }
}
