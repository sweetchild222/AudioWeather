//
//  ItemSetSky.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class ItemSetSky : ItemSet{
    
    let dataManager:WeatherDataManager
    
    init(dataManager:WeatherDataManager){
        self.dataManager = dataManager
    }
    
    
    func getItemSet() -> [Item]{
        
        let isAMSkyCode = dataManager.isAMSkyCode()
        let isPMSkyCode = dataManager.isPMSkyCode()
        
        let AMSkyCode = dataManager.getAMSkyCode()
        let PMSkyCode = dataManager.getPMSkyCode()
        
        
        if isAMSkyCode == true && isPMSkyCode == true {
            
            if AMSkyCode == PMSkyCode{
                
                return getAlldaySame(skyCode:AMSkyCode)
                
            }
            else{
                
                return getAMPMDifferent(amSkyCode:AMSkyCode, pmSkyCode:PMSkyCode)
            }
        }
        else if isAMSkyCode == false && isPMSkyCode == true{
            
            return getPMOnly(skyCode:PMSkyCode)
            
        }
        else{   // error
            return []
        }
    }
    
    
    func getAlldaySame(skyCode:WeatherData.SkyCode) -> [Item]{
        
        return [Item(text:allDaySameToText(skyCode: skyCode), audio:allDaySameToAudio(skyCode: skyCode))]
    }
    
    
    func allDaySameToText(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case .clean:
            return "하루 종일 맑겠습니다"
        case .small:
            return "하루 종일 구름이 조금 끼겠습니다"
        case .much:
            return "하루 종일 구름이 많이 끼겠습니다"
        case .gray:
            return "하루 종일 흐리겠습니다"
        }
    }
    
    
    func allDaySameToAudio(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case .clean:
            return "allday_clean"
        case .small:
            return "allday_small"
        case .much:
            return "allday_much"
        case .gray:
            return "allday_gray"
        }
    }
    
    
    func getAMPMDifferent(amSkyCode:WeatherData.SkyCode, pmSkyCode:WeatherData.SkyCode) -> [Item]{
        
        return [Item(text:amOnlyToText(skyCode: amSkyCode), audio:amOnlyToAudio(skyCode: amSkyCode)), getEmpty(empty: 2), Item(text:pmOnlyToText(skyCode: pmSkyCode), audio:pmOnlyToAudio(skyCode: pmSkyCode))]
        
    }
    
    
    
    func amOnlyToText(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case .clean:
            return "오전에 맑다가"
        case .small:
            return "오전에 구름이 조금 끼다가"
        case .much:
            return "오전에 구름이 많이 끼다가"
        case .gray:
            return "오전에 흐리다가"
        }
    }
    
    
    func amOnlyToAudio(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case .clean:
            return "morning_clean"
        case .small:
            return "morning_small"
        case .much:
            return "morning_much"
        case .gray:
            return "morning_gray"
        }
    }

    
    
    func getPMOnly(skyCode:WeatherData.SkyCode) -> [Item]{
        
        return [Item(text:pmOnlyToText(skyCode: skyCode), audio:pmOnlyToAudio(skyCode: skyCode))]
    }
    
    
    func pmOnlyToText(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case .clean:
            return "오후에 맑겠습니다"
        case .small:
            return "오후에 구름이 조금 끼겠습니다"
        case .much:
            return "오후에 구름이 많이 끼겠습니다"
        case .gray:
            return "오후에 흐리겠습니다"
        }
    }
    
    
    func pmOnlyToAudio(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case .clean:
            return "after_clean"
        case .small:
            return "after_small"
        case .much:
            return "after_much"
        case .gray:
            return "after_gray"
        }
    }

    
}

