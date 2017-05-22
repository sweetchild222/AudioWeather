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
        case clean, rain, rainsnow, snow
    }
    
    enum SkyCode:Int{
        
        case clean, small, much, gray
        
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
        
        /*
        print("htm : \(self.htm)")
        print("hrs : \(self.hrs)")
        print("pty : \(self.pty)")
        print("pop : \(self.pop)")
        print("rna : \(self.rna)")
        print("reh : \(self.reh)")
        print("sky : \(self.sky)")
        print("tmp : \(self.tmp)")
        */
    }
}
