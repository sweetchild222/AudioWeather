//
//  ItemSetHead.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetHead : ItemSet{
    
    
    func getItemSet() -> [Item]{
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let week = calendar.component(.weekday, from: date)
        
        var set:[Item] = []
        
        set.append(Item(text:"안녕하세요", audio:"hi"))
        set.append(getEmpty(empty: 2))
        set.append(Item(text:"오늘은", audio:"today"))
        set.append(Item(text:String(year) + "년", audio:yearToAudio(year:year)))
        set.append(Item(text:String(month) + "월", audio:monthToAudio(month:month)))
        set.append(Item(text:String(day) + "일", audio:dayToAudio(day:day)))
        set.append(Item(text:weekToText(week:week) + "입니다", audio:weekToAudio(week:week)))
        
        return set
    }
    
    func weekToText(week:Int) ->String{
        
        let weekTextList = [
            "일요일",
            "월요일",
            "화요일",
            "수요일",
            "목요일",
            "금요일",
            "토요일"
        ]
        
        return weekTextList[week - 1]
        
    }
    
    func weekToAudio(week:Int) -> String{
        
        return String(week) + "w"
    }

    
    func dayToAudio(day:Int) -> String{
        
        return String(day) + "d"
    }

    
    
    func monthToAudio(month:Int) -> String{
        
        return String(month) + "m"
    }
    
    
    func yearToAudio(year:Int) -> String{
        
        return String(year) + "y"

    }
}
