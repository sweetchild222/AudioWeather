//
//  SelectedLocationManager.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 7. 4..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation



class SelectedLocationManager{
    
    
    static let instance = SelectedLocationManager()
    
    let upperKey = "Upper"
    let lowerKey = "Lower"
    let isCurrentKey = "isCurrent"

    
    init(){
        
    }
    
    
    func getUpper() -> Int {
        
        let defaults = UserDefaults.standard
        
        if isKey(key: self.upperKey) == false{
            return 0
        }

        return defaults.integer(forKey: self.upperKey)
    }
    
    
    func getLower() -> Int{
        
        let defaults = UserDefaults.standard
        
        if isKey(key: self.lowerKey) == false{
            return 0
        }
        
        return defaults.integer(forKey: self.lowerKey)
    }
    
    
    func isCurrent() -> Bool{
        
        let defaults = UserDefaults.standard
        
        if isKey(key: self.isCurrentKey) == false{
            return true
        }
        
        return defaults.bool(forKey: self.isCurrentKey)

    }
    
    
    func setUpper(upper:Int){
        
        let defaults = UserDefaults.standard
        
        defaults.set(upper, forKey: self.upperKey)
    }
    
    
    func setLower(lower:Int){
        
        let defaults = UserDefaults.standard
        
        defaults.set(lower, forKey: self.lowerKey)
    }

    
    func setIsCurrent(isCurrent:Bool){
        
        let defaults = UserDefaults.standard
        
        defaults.set(isCurrent, forKey: self.isCurrentKey)
        
    }
    

    func isKey(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

}
