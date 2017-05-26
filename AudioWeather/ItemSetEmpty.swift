//
//  ItemSetEmpty.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 26..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class ItemSetEmpty : ItemSet{
    
    let empty:Int
    
    init(empty:Int){
        
        self.empty = empty
    }
    
    
    func getItemSet() -> [Item]{
        
        return [getEmpty(empty:self.empty)]
    }
}
