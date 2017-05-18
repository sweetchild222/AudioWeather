//
//  ItemSetLocation.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class ItemSetLocation : ItemSet{
    
    let name1:String
    let name2:String
    
    init(name1:String, name2:String){
        self.name1 = name1
        self.name2 = name2
    }
    
    
    func getItemSet() -> [Item]{
        
        
        guard let value = AddressMap.instance.getMapInfo(name1: name1, name2: name2) else{
            
            return []
        }

        print(value)
        
        let set:[Item] = []
        
        
        return set
    }
    
    
    
    
    
}
