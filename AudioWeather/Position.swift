//
//  Position.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 28..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class Position{
    
    let RE:Double = 6371.00877 // 지구 반경(km)
    let GRID:Double = 5.0 // 격자 간격(km)
    let SLAT1:Double = 30.0 // 투영 위도1(degree)
    let SLAT2:Double = 60.0 // 투영 위도2(degree)
    let OLON:Double = 126.0 // 기준점 경도(degree)
    let OLAT:Double = 38.0 // 기준점 위도(degree)
    let XO:Double = 43 // 기준점 X좌표(GRID)
    let YO:Double = 136 // 기1준점 Y좌표(GRID)
    
    let lat:Double
    let lng:Double

    init(lat:Double, lng:Double){
        
        self.lat = lat
        self.lng = lng
    }
    
    
    
    init(x:Double, y:Double){
        
        let DEGRAD = Double.pi / 180.0
        let RADDEG = 180.0 / Double.pi
        
        let re = RE / GRID
        let slat1 = SLAT1 * DEGRAD
        let slat2 = SLAT2 * DEGRAD
        let olon = OLON * DEGRAD
        let olat = OLAT * DEGRAD
        
        let sn = log(cos(slat1) / cos(slat2)) / log((tan(Double.pi * 0.25 + slat2 * 0.5) / tan(Double.pi * 0.25 + slat1 * 0.5)))
        let sf = pow(tan(Double.pi * 0.25 + slat1 * 0.5), sn) * cos(slat1) / sn;
        let ro = re * sf / pow(tan(Double.pi * 0.25 + olat * 0.5), sn);
        
        let xn = x - XO
        let yn = ro - y + YO
        let ra = sqrt(xn * xn + yn * yn)
        let alat = 2.0 * atan(pow((re * sf / ra), (1.0 / sn))) - Double.pi * 0.5;
        
        let theta:Double
        
        if abs(xn) <= 0.0 {
            theta = 0.0
            
        } else {
            if abs(yn) <= 0.0 {
                
                theta = Double.pi * 0.5
                
            }else{
                
                theta = atan2(xn, yn);
            }
        }
        
        let alon = theta / sn + olon;
        self.lat = alat * RADDEG;
        self.lng = alon * RADDEG;
    }
    
    
    
    var gps:(lat:Double, lng:Double){
        
        get{
            
            return (self.lat, self.lng)
        }
        
    }
    
    
    
    var xy:(x:Double, y:Double){
        
        get{
            
            let DEGRAD = Double.pi / 180.0
            
            let re = RE / GRID
            let slat1 = SLAT1 * DEGRAD
            let slat2 = SLAT2 * DEGRAD
            let olon = OLON * DEGRAD
            let olat = OLAT * DEGRAD
            
            let sn = log(cos(slat1) / cos(slat2)) / log((tan(Double.pi * 0.25 + slat2 * 0.5) / tan(Double.pi * 0.25 + slat1 * 0.5)))
            let sf = pow(tan(Double.pi * 0.25 + slat1 * 0.5), sn) * cos(slat1) / sn;
            let ro = re * sf / pow(tan(Double.pi * 0.25 + olat * 0.5), sn);
            let ra = re * sf / pow(tan(Double.pi * 0.25 + (self.lat) * DEGRAD * 0.5), sn)
            
            var theta = self.lng * DEGRAD - olon
            if theta > Double.pi {
                
                theta -= 2.0 * Double.pi
            }
            if theta < -Double.pi {
                theta += 2.0 * Double.pi
            }
            
            theta *= sn
            
            let x = floor(ra * sin(theta) + XO + 0.5)
            let y = floor(ro - ra * cos(theta) + YO + 0.5)
            
            return (x, y)
        }
    }
}
