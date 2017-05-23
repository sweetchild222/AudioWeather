//
//  ItemSetMaxTemp.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 20..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetMaxTemp : ItemSet{
    
    let tmx:Float
    
    init(tmx:Float){
        self.tmx = tmx
    }
 
    
    func getItemSet() -> [Item] {
        
        let tempPrefix = self.tmx > 0 ? "영상 " : "영하 "
    
        if Int(tmx) >= -30 && Int(tmx) <= 50{
                    
            return [Item(text:"낮 최고 기온은 " + tempPrefix + String(abs(tmx)) + "도 입니다"  , audio:tmxToAudio(tmx:Int(tmx)))]
        }
        
        return []
    }
    
    func tmxToAudio(tmx:Int) -> String{
        
        return tmx > 0 ? "max_temp_pls" + String(abs(tmx)) : "max_temp_min" + String(abs(tmx))
    }
}
