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
        
        let head = ItemSetHead()
        
        return head.getItemSet()
    }
    
    
    func generateLocation(name1:String, name2:String) -> [Item] {
        
        
        let location = ItemSetLocation(name1:name1, name2:name2)
        
        
        return location.getItemSet()
    }
    
    func generateTail() -> [Item] {
        
        
        let location = ItemSetTail()
        
        return location.getItemSet()
    }
    
    
}
