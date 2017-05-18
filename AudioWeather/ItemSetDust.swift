//
//  ItemSetDust.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 18..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class ItemSetDust : ItemSet{
    
    let name1:String
    let name2:String
    let dustList:[String: [String: DustRequester.Grade]]
    
    init(name1:String, name2:String, dustList:[String: [String: DustRequester.Grade]]){
        self.name1 = name1
        self.name2 = name2
        self.dustList = dustList
    }
    
    
    func getItemSet() -> [Item]{
        
        guard let value = AddressMap.instance.getMapInfo(name1: name1, name2: name2) else {
            
            return []
        }
        
        let area:String = value.getArea()
        
        guard let pm25Garde = dustList["PM25"]?[area] else {
            
            return []
        }
        
        guard let pm10Garde = dustList["PM10"]?[area] else {
            
            return []
        }
        
        
        var set:[Item] = []
        
        set.append(Item(text:pm25GradeToText(grade: pm25Garde), audio:pm25GradeToAudio(grade: pm25Garde)))
        set.append(Item(text:pm10GradeToText(grade: pm10Garde), audio:pm10GradeToAudio(grade: pm10Garde)))
        
        return set
    }
    
    
    func pm25GradeToText(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case DustRequester.Grade.unknown:
            return "미세먼지는 모름"
        case DustRequester.Grade.good:
            return "미세먼지는 좋음"
        case DustRequester.Grade.normal:
            return "미세먼지는 보통"
        case DustRequester.Grade.bad:
            return "미세먼지는 나쁨"
        case DustRequester.Grade.worst:
            return "미세먼지는 매우나쁨"
        }
    }
    
    
    func pm10GradeToText(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case DustRequester.Grade.unknown:
            return "초미세먼지는 모름입니다"
        case DustRequester.Grade.good:
            return "초미세먼지는 좋음입니다"
        case DustRequester.Grade.normal:
            return "초미세먼지는 보통입니다"
        case DustRequester.Grade.bad:
            return "초미세먼지는 나쁨입니다"
        case DustRequester.Grade.worst:
            return "초미세먼지는 매우나쁨입니다"
        }
    }
    
    
    func pm25GradeToAudio(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case DustRequester.Grade.unknown:
            return "dust_unknown"
        case DustRequester.Grade.good:
            return "dust_good"
        case DustRequester.Grade.normal:
            return "dust_normal"
        case DustRequester.Grade.bad:
            return "dust_bad"
        case DustRequester.Grade.worst:
            return "dust_worst"
        }
    }
    
    
    func pm10GradeToAudio(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case DustRequester.Grade.unknown:
            return "tiny_dust_unknown"
        case DustRequester.Grade.good:
            return "tiny_dust_good"
        case DustRequester.Grade.normal:
            return "tiny_dust_normal"
        case DustRequester.Grade.bad:
            return "tiny_dust_bad"
        case DustRequester.Grade.worst:
            return "tiny_dust_worst"
        }
    }
}
