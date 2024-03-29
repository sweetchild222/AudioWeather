//
//  ItemSetCurrentRainSnow.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 22..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetCurrentRainSnow : ItemSet{
    
    let dataManager:WeatherDataManager
    
    init(dataManager:WeatherDataManager){
        self.dataManager = dataManager
    }
    
    func getItemSet() -> [Item]{
    
        return getRainSnow() + [getEmpty(empty: 2)] + getEndHour() + [getEmpty(empty: 2)] + getRna()
    }
    

    func getEndHour() -> [Item] {
        
        let hour = dataManager.endHourCurrentRainSnow()
        
        if hour == -1 {
            
            return [Item(text:"하루 종일 이어지겠습니다", audio:"current_allday")]
        }
    
        return [Item(text:hourToText(hour:hour), audio:hourToAudio(hour:hour))]
    }
    
    
    
    func hourToAudio(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("current_hour_") + String(index) + String(am == true ? "am" : "pm")
    }
    
    
    
    func hourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시 까지 이어지겠습니다")
    }
    
    
    func getRna() -> [Item] {
        
        let rna = dataManager.currentRna()
        
        let rnaTrimed = rna - (rna % 5)
        
        if rnaTrimed <= 0 || rnaTrimed > 150{
            return []
        }

        
        return [Item(text:"강수량은 시간당 " + String(rnaTrimed) + "밀리미터 입니다", audio:rnaToAudio(rna:rnaTrimed))]
    }
    
    
    func rnaToAudio(rna:Int) -> String{
        
        return String("rna") + String(rna)
    }
    
    
    func getRainSnow() -> [Item]{
        
        if dataManager.currentPty() == .rain{
            return [Item(text:"현재는 비가 오고 있고", audio:"current_rain")]
        }
        else if dataManager.currentPty() == .rainsnow {
            return [Item(text:"현재는 눈과 비가 오고 있고", audio:"current_rain_snow")]
        }
        else if dataManager.currentPty() == .snow {
            return [Item(text:"현재는 눈이 오고 있고", audio:"current_snow")]
        }
        
        return [];
        
    }

}
