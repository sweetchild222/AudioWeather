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
            
        case WeatherData.SkyCode.clean:
            return "하루 종일 맑겠습니다"
        case WeatherData.SkyCode.small:
            return "하루 종일 구름이 조금 끼겠습니다"
        case WeatherData.SkyCode.much:
            return "하루 종일 구름이 많이 끼겠습니다"
        case WeatherData.SkyCode.gray:
            return "하루 종일 흐리겠습니다"
        }
    }
    
    
    func allDaySameToAudio(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case WeatherData.SkyCode.clean:
            return "allday_clean"
        case WeatherData.SkyCode.small:
            return "allday_small"
        case WeatherData.SkyCode.much:
            return "allday_much"
        case WeatherData.SkyCode.gray:
            return "allday_gray"
        }
    }
    
    
    func getAMPMDifferent(amSkyCode:WeatherData.SkyCode, pmSkyCode:WeatherData.SkyCode) -> [Item]{
        
        return [Item(text:amOnlyToText(skyCode: amSkyCode), audio:amOnlyToAudio(skyCode: amSkyCode)), Item(text:pmOnlyToText(skyCode: pmSkyCode), audio:pmOnlyToAudio(skyCode: pmSkyCode))]
        
    }
    
    
    
    func amOnlyToText(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case WeatherData.SkyCode.clean:
            return "오전에 맑다가"
        case WeatherData.SkyCode.small:
            return "오전에 구름이 조금 끼다가"
        case WeatherData.SkyCode.much:
            return "오전에 구름이 많이 끼다가"
        case WeatherData.SkyCode.gray:
            return "오전에 흐리다가"
        }
    }
    
    
    func amOnlyToAudio(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case WeatherData.SkyCode.clean:
            return "morning_clean"
        case WeatherData.SkyCode.small:
            return "morning_small"
        case WeatherData.SkyCode.much:
            return "morning_much"
        case WeatherData.SkyCode.gray:
            return "morning_gray"
        }
    }

    
    
    func getPMOnly(skyCode:WeatherData.SkyCode) -> [Item]{
        
        return [Item(text:pmOnlyToText(skyCode: skyCode), audio:pmOnlyToAudio(skyCode: skyCode))]
    }
    
    
    func pmOnlyToText(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case WeatherData.SkyCode.clean:
            return "오후에 맑겠습니다"
        case WeatherData.SkyCode.small:
            return "오후에 구름이 조금 끼겠습니다"
        case WeatherData.SkyCode.much:
            return "오후에 구름이 많이 끼겠습니다"
        case WeatherData.SkyCode.gray:
            return "오후에 흐리겠습니다"
        }
    }
    
    
    func pmOnlyToAudio(skyCode:WeatherData.SkyCode) -> String{
        
        switch skyCode{
            
        case WeatherData.SkyCode.clean:
            return "after_clean"
        case WeatherData.SkyCode.small:
            return "after_small"
        case WeatherData.SkyCode.much:
            return "after_much"
        case WeatherData.SkyCode.gray:
            return "after_gray"
        }
    }

    
}

