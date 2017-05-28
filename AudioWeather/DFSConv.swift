//
//  DFSConv.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 11..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class DFSConv{
    
    static let instance = DFSConv()
    
    
    let RE:Double = 6371.00877 // 지구 반경(km)
    let GRID:Double = 5.0 // 격자 간격(km)
    let SLAT1:Double = 30.0 // 투영 위도1(degree)
    let SLAT2:Double = 60.0 // 투영 위도2(degree)
    let OLON:Double = 126.0 // 기준점 경도(degree)
    let OLAT:Double = 38.0 // 기준점 위도(degree)
    let XO:Double = 43 // 기준점 X좌표(GRID)
    let YO:Double = 136 // 기1준점 Y좌표(GRID)
    
    
    public func toGPS(v1:Double, v2:Double) -> (lat:Double, lng:Double) {
        
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
        
        let xn = v1 - XO
        let yn = ro - v2 + YO
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
        let lat = alat * RADDEG;
        let lng = alon * RADDEG;
        
        return (lat, lng)
    }
    
    
    public func toXY(v1:Double, v2:Double) -> (nx:Double, ny:Double){
        
        let DEGRAD = Double.pi / 180.0
        
        let re = RE / GRID
        let slat1 = SLAT1 * DEGRAD
        let slat2 = SLAT2 * DEGRAD
        let olon = OLON * DEGRAD
        let olat = OLAT * DEGRAD
        
        let sn = log(cos(slat1) / cos(slat2)) / log((tan(Double.pi * 0.25 + slat2 * 0.5) / tan(Double.pi * 0.25 + slat1 * 0.5)))
        let sf = pow(tan(Double.pi * 0.25 + slat1 * 0.5), sn) * cos(slat1) / sn;
        let ro = re * sf / pow(tan(Double.pi * 0.25 + olat * 0.5), sn);
        let ra = re * sf / pow(tan(Double.pi * 0.25 + (v1) * DEGRAD * 0.5), sn)
        
        var theta = v2 * DEGRAD - olon
        if theta > Double.pi {
            
            theta -= 2.0 * Double.pi
        }
        if theta < -Double.pi {
            theta += 2.0 * Double.pi
        }
        
        theta *= sn
        
        let nx = floor(ra * sin(theta) + XO + 0.5)
        let ny = floor(ro - ra * cos(theta) + YO + 0.5)
        
        return (nx, ny)

    }
    
}
