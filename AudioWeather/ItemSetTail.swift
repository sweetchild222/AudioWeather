//
//  ItemSetTail.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetTail : ItemSet{
    
    
    func getItemSet() -> [Item]{
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let min = calendar.component(.minute, from: date)
        
        var set:[Item] = []
    
        set.append(Item(text:"현재시간은", audio:"current_time"))
        set.append(Item(text:hourToText(hour:hour), audio:hourToAudio(hour:hour)))
        set.append(Item(text:String(min) + String("분 입니다"), audio:minToAudio(min:min)))
        set.append(getEmpty(empty: 4))
        set.append(Item(text:"오늘도 행복한 하루 되세요", audio:"goodbye"))
        
        return set
    }
    

    func minToAudio(min:Int) -> String{
        
        return String("min") + String(min)
    }
    
    
    func hourToAudio(hour:Int) -> String{

        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("hour_") + String(am == true ? "am" : "pm") + String(index)
    }
    
    
    func hourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시")
    }

    
}
