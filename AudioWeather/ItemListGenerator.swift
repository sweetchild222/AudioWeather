//
//  ItemListGenerator.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemListGenerator{
    
    static let instance = ItemListGenerator()
    
    
    func generateHead() -> [Item]{
        
        let itemList = ItemSetHead()
        
        return itemList.getItemSet()
    }
    
    
    
    func generateLocation(name1:String, name2:String) -> [Item] {
        
        let itemList = ItemSetLocation(name1:name1, name2:name2)
        
        return itemList.getItemSet()
    }
    
    
    func generateTail() -> [Item] {
        
        let itemList = ItemSetTail()
        
        return itemList.getItemSet()
    }
    
    
    func generateDust(name1:String, name2:String, dustList:[String: [String: DustRequester.Grade]]) -> [Item] {
        
        let itemList = ItemSetDust(name1:name1, name2:name2, dustList:dustList)
        
        return itemList.getItemSet()
    }
    

    func generateMaxTemp(tmx:Float) -> [Item] {
        
        let itemList = ItemSetMaxTemp(tmx:tmx)
        
        return itemList.getItemSet()
    }
    
    
    func generateCurrentTemp(tmp:Float) -> [Item] {
        
        let itemList = ItemSetCurrentTemp(tmp:tmp)
        
        return itemList.getItemSet()
    }
    
    
    
    func generateSky(dataManager:WeatherDataManager) -> [Item] {
        
        if dataManager.currentPty() != WeatherData.PtyCode.clean {

            
            let itemList = ItemSetCurrentRainSnow(dataManager:dataManager)
            
            return itemList.getItemSet()
            
        }
        
        
        if dataManager.getWillPtyCodeRainSnow() != WeatherData.PtyCode.clean{
            
            let itemList = ItemSetWillRainSnow(dataManager:dataManager)
            
            return itemList.getItemSet()

        }
        

        let itemList = ItemSetSky(dataManager: dataManager)
        
        return itemList.getItemSet()
        
    }

}
