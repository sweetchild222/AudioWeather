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
    
    
    func generate(addr:Address, dustList:[String: [String: DustRequester.Grade]], dataManager:WeatherDataManager) -> [Item] {
        
        let tmx = dataManager.getMaxTemp()
        
        let tempClosure:(Float) -> [Item] = tmx != nil ? generateMaxTemp : generateCurrentTemp
        
        let temp = tmx ?? dataManager.getCurrentTemp()
        
        var items:[Item] = generateHead() + generateEmpty(empty:4)
        items += generateLocation(addr:addr) + generateEmpty(empty:4)
        items += generateSky(dataManager: dataManager) + generateEmpty(empty:4)
        items += tempClosure(temp!) + generateEmpty(empty:4)
        items += generateDust(addr: addr, dustList: dustList)
        items += generateTail()

        return items
    }
    
    
    func generateEmpty(empty:Int) -> [Item] {
        
        
        let itemList = ItemSetEmpty(empty:empty)
        
        return itemList.getItemSet()
        
        
        
    }
    
    func generateHead() -> [Item]{
        
        let itemList = ItemSetHead()
        
        return itemList.getItemSet()
    }
    
    
    
    func generateLocation(addr:Address) -> [Item] {
        
        let itemList = ItemSetLocation(addr:addr)
        
        return itemList.getItemSet()
    }
    
    
    func generateTail() -> [Item] {
        
        let itemList = ItemSetTail()
        
        return itemList.getItemSet()
    }
    
    
    func generateDust(addr:Address, dustList:[String: [String: DustRequester.Grade]]) -> [Item] {
        
        let itemList = ItemSetDust(addr:addr, dustList:dustList)
        
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
