//
//  ItemSetWillRainSnow.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 22..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetWillRainSnow : ItemSet{
    
    let dataManager:WeatherDataManager
    
    init(dataManager:WeatherDataManager){
        self.dataManager = dataManager
    }
    

    func getItemSet() -> [Item]{
        
        if isRna() == false {
            
            var items = getStartHour()
            items += getEndHour()
            items += [getEmpty(empty:2)]
            items += getWillRainSnow()
            items += [getEmpty(empty:2)]
            items += getPop()
        
            return items
        }
        else{
            
            var items = getStartHour()
            items += getEndHour()
            items += [getEmpty(empty: 2)]
            items += getWillRainSnow()
            items += [getEmpty(empty: 2)]
            items += getPopAnd()
            items += [getEmpty(empty:1)]
            items += getRna()
            
            return items
        }
        
    }
    
        
    func getWillRainSnow() ->[Item]{
        
        let code = dataManager.getWillPtyCodeRainSnow()
    
        return [Item(text:ptyCodeToText(code:code), audio:ptyCodeToAudio(code:code))]

    }
    
    
    
    func ptyCodeToAudio(code:WeatherData.PtyCode) -> String{
        
        switch code{
            
        case WeatherData.PtyCode.rain:
            return "will_rain"
        case WeatherData.PtyCode.rainsnow:
            return "will_rain_snow"
        case WeatherData.PtyCode.snow:
            return "will_snow"
        default:
            return "will_rain"
        }
    }
    
    
    func ptyCodeToText(code:WeatherData.PtyCode) -> String{
        
        switch code{

        case WeatherData.PtyCode.rain:
            return "비가 오겠습니다"
        case WeatherData.PtyCode.rainsnow:
            return "눈과 비가 오겠습니다"
        case WeatherData.PtyCode.snow:
            return "눈이 오겠습니다"
        default:
            return "비가 오겠습니다"
        }
    }
    
    
    func getPop() -> [Item]{
    
        let pop = self.dataManager.getPop()
        
        let popTrimed = pop - (pop % 10)
        
        if popTrimed <= 0 || popTrimed > 100{
            return []
        }
        
    
        return [Item(text:popToText(pop: popTrimed), audio:popToAudio(pop:popTrimed))]
    }
    
    func isRna() -> Bool{
        
        let rna = self.dataManager.getRna()
        
        let rnaTrimed = rna - (rna % 5)
        
        if rnaTrimed <= 0 || rnaTrimed > 150{
            return false
        }
        
        return true

    }
    
    
    func getRna() -> [Item]{
        
        let rna = self.dataManager.getRna()
        
        let rnaTrimed = rna - (rna % 5)
        
        if rnaTrimed <= 0 || rnaTrimed > 150{
            return []
        }
    

        return [Item(text:rnaToText(rna: rnaTrimed), audio:rnaToAudio(rna:rnaTrimed))]
    }
    
    
    
    func getPopAnd() -> [Item]{
        
        let pop = self.dataManager.getPop()
        
        let popTrimed = pop - (pop % 10)
        
        if popTrimed <= 0 || popTrimed > 100{
            return []
        }
        
        return [Item(text:popAndToText(pop: popTrimed), audio:popAndToAudio(pop:popTrimed))]
    }
    
    
    func popAndToText(pop:Int) -> String{
        
        return String("강수 확률은 \(pop)% 이고")
    }
    
    
    func popAndToAudio(pop:Int) -> String{
        
        return String("and_pop\(pop)")
    }
    

    func popToText(pop:Int) -> String{
        
        return String("강수 확률은 \(pop)% 입니다")
    }
    
    
    func popToAudio(pop:Int) -> String{
        
        return String("pop\(pop)")
    }
    
    
    func rnaToText(rna:Int) -> String{
        
        return String("예상 강수량은 \(rna)밀리미터 입니다")
    }
    
    
    func rnaToAudio(rna:Int) -> String{
        
        return String("will_rna\(rna)")
    }
    
    
    func getStartHour() -> [Item] {
        
        let hour = self.dataManager.startHourRainSnow()
        
        if hour == -1 {
            return []
        }
        
        return [Item(text:startHourToText(hour: hour), audio:startHourToAudio(hour: hour))]
    }
    
    
    func getEndHour() -> [Item] {
        
        let hour = self.dataManager.endHourRainSnow()
        
        if hour == -1 {
            return []
        }
        
        return [Item(text:endHourToText(hour:hour), audio:endHourToAudio(hour:hour))]
    }
    
    
    
    func startHourToAudio(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("from_hour_") + String(index) + String(am == true ? "am" : "pm")
    }
    
    
    
    func startHourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시 부터")
    }

    
    
    func endHourToAudio(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String("to_hour_") + String(index) + String(am == true ? "am" : "pm")
    }
    
    
    
    func endHourToText(hour:Int) -> String{
        
        let am:Bool = hour >= 12 ? false : true
        
        let halfHour = am == false ? hour - 12 : hour
        
        let index = halfHour == 0 ? 12 : halfHour
        
        return String(am == true ? "오전 " : "오후 ") + String(index) + String("시 까지")
    }


}
