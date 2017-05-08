//
//  WeatherData.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 8..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class WeatherData{
    
    enum PtyCode:Int{
        case unknown, No, rain, rainAndSnow, Snow
    }
    
    enum SkyCode:Int{
        
        case unknown, clean, small, much, gary
        
    }
    
    var htm:Int             // hour
    var pop:Int             // rainFall percent
    var rn1:Int             // rainFall amount
    var reh:Int             // humidity percent
    var tmp:Float           // temperature
    
    var sky:SkyCode
    var pty:PtyCode
    
    init(htm:Int, pty:PtyCode, pop:Int, rn1:Int, reh:Int, sky:SkyCode, tmp:Float){
        
        self.htm = htm
        self.pty = pty
        self.pop = pop
        self.rn1 = rn1
        self.reh = reh
        self.sky = sky
        self.tmp = tmp
        
        print("htm : \(self.htm)")
        print("pty : \(self.pty)")
        print("sky : \(self.sky)")
        print("rn1 : \(self.rn1)")
        print("reh : \(self.reh)")
        print("tmp : \(self.tmp)")
        print("pop : \(self.pop)")
    }
}
