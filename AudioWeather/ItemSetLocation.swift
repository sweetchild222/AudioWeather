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
        
        var set:[Item] = []
        
        set.append(Item(text:name1 + " " + name2 + "의", audio:value.getAudio()))
        set.append(Item(text:"날씨 예보를 알려 드리겠습니다", audio:"forecast"))

        return set
    }
}
