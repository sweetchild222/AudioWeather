//
//  ItemSetDust.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 18..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class ItemSetDust : ItemSet{
    
    let addr:Address
    let dustList:[String: [String: DustRequester.Grade]]
    
    init(addr:Address, dustList:[String: [String: DustRequester.Grade]]){
        
        self.addr = addr
        self.dustList = dustList
    }
    
    
    func getItemSet() -> [Item]{
        
        guard let value = AddressMap.instance.getMapInfo(addr:addr) else {
            
            return []
        }
        
        let area:String = value.getArea()
        
        guard let pm25Grade = dustList["PM25"]?[area] else {
            
            return []
        }
        
        guard let pm10Grade = dustList["PM10"]?[area] else {
            
            return []
        }
        
        
        var set:[Item] = []
        
        
        if pm25Grade == pm10Grade {
            
            set.append(Item(text:allGradeToText(grade: pm25Grade), audio:allGradeToAudio(grade: pm25Grade)))
        }
        else{

            set.append(Item(text:pm25GradeToText(grade: pm25Grade), audio:pm25GradeToAudio(grade: pm25Grade)))
            set.append(Item(text:pm10GradeToText(grade: pm10Grade), audio:pm10GradeToAudio(grade: pm10Grade)))
        }
        
        
        return set
    }
    
    
    func allGradeToText(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case DustRequester.Grade.unknown:
            return "미세먼지 초미세먼지 모두 모름입니다"
        case DustRequester.Grade.good:
            return "미세먼지 초미세먼지 모두 좋음입니다"
        case DustRequester.Grade.normal:
            return "미세먼지 초미세먼지 모두 보통입니다"
        case DustRequester.Grade.bad:
            return "미세먼지 초미세먼지 모두 나쁨입니다"
        case DustRequester.Grade.worst:
            return "미세먼지 초미세먼지 모두 매우 나쁨입니다"
        }
        
    }
    
    
    func allGradeToAudio(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case DustRequester.Grade.unknown:
            return "all_dust_unknown"
        case DustRequester.Grade.good:
            return "all_dust_good"
        case DustRequester.Grade.normal:
            return "all_dust_normal"
        case DustRequester.Grade.bad:
            return "all_dust_bad"
        case DustRequester.Grade.worst:
            return "all_dust_worst"
        }
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
