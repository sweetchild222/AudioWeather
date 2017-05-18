//
//  Item.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 16..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class Item{
    
    var text:String
    var audio:String
    
    init(text:String, audio:String){
        self.text = text
        self.audio = audio
    }
    
    func getText() -> String{
        
        return self.text
    }
    
    func getAudio() -> String{
        
        return self.audio
    }
}
