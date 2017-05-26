//
//  ItemSetLocation.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class ItemSetLocation : ItemSet{
    
    let addr:Address
    
    init(addr:Address){
        self.addr = addr
        
    }
    
    
    func getItemSet() -> [Item]{
        
        
        guard let value = AddressMap.instance.getMapInfo(addr:addr) else{
            
            return []
        }
        
        var set:[Item] = []
        
        set.append(Item(text:addr.getUpper() + " " + addr.getLower() + "의", audio:value.getAudio()))
        set.append(Item(text:"날씨 예보를 알려 드리겠습니다", audio:"forecast"))

        return set
    }
}
