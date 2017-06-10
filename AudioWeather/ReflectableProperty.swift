//
//  ReflectableProperty.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 10..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

protocol ReflectableProperty{
    
    typealias RepresentationType = [String:Any]
    typealias ValuesType = [Any]
    typealias NamesType = [String]
    
    var representation: RepresentationType {get}
    var values: ValuesType {get}
    var names: NamesType {get}
    
    init(dict:RepresentationType)
}


extension ReflectableProperty{
    
    var representation: RepresentationType {
        
        var types: [String:Any] = [:]
        
        for case let (name, value) in Mirror(reflecting: self).children {
            
            guard let guardName = name else{
                continue
            }
            
            types.updateValue(value, forKey: guardName)
        }
        
        return types
    }
    

    var values: ValuesType {
        
        return Array(representation.values)
    }
    
    var names: NamesType {
        
        return Array(representation.keys)
    }
}
