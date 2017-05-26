//
//  ItemSet.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

protocol ItemSet{
    
    func getItemSet() -> [Item]
    
    func getEmpty(empty:Int) -> Item
}


extension ItemSet{
    func getEmpty(empty:Int) -> Item{
        
        return Item(text:" ", audio: String(format:"empty%02d", empty))
    }
    
}
