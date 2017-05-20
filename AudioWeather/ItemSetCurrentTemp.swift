//
//  ItemSetCurrentTemp.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 20..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class ItemSetCurrentTemp : ItemSet{
    
    let tmp:Float
    
    init(tmp:Float){
        self.tmp = tmp
    }
    
    
    func getItemSet() -> [Item] {
        
        let tempPrefix = self.tmp > 0 ? "영상 " : "영하 "
        
        var set:[Item] = []
        
        if Int(tmp) >= -30 && Int(tmp) <= 50{
            
            set.append(Item(text:"현재 기온은 " + tempPrefix + String(abs(tmp)) + "도 입니다"  , audio:tmxToAudio(tmp:Int(tmp))))
        }

        return set
    }
    
    func tmxToAudio(tmp:Int) -> String{
        
        return tmp > 0 ? "current_temp_pls" + String(abs(tmp)) : "current_temp_min" + String(abs(tmp))
    }
}
