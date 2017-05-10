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
    
    let htm:Int             // hour
    let pop:Int             // rainFall percent
    let rna:Int             // rainFall amount
    let reh:Int             // humidity percent
    let tmp:Float           // temperature
    var hrs:Int             // hour space
    
    let sky:SkyCode
    let pty:PtyCode
    
    init(htm:Int, hrs:Int, pty:PtyCode, pop:Int, rna:Int, reh:Int, sky:SkyCode, tmp:Float){
        
        self.htm = htm
        self.hrs = hrs
        self.pty = pty
        self.pop = pop
        self.rna = rna
        self.reh = reh
        self.sky = sky
        self.tmp = tmp
        
        print("htm : \(self.htm)")
        print("hrs : \(self.hrs)")
        print("pty : \(self.pty)")
        print("sky : \(self.sky)")
        print("rna : \(self.rna)")
        print("reh : \(self.reh)")
        print("tmp : \(self.tmp)")
        print("pop : \(self.pop)")
    }
}
