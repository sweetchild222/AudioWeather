//
//  GlobalConfig.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 3..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

class GlobalConfig{
    
    static let instance = GlobalConfig()

    
    public func getWeatherServiceKey() -> String {

        return "TW7UjemO7vyDMu4mz6Rmj27Ix9NW0gh7EX2GT5UB%2Bh%2Bd%2BhAtQnSDlJRXMVm%2FoNG7vXMCn884ouC1oYZEDR9TIw%3D%3D"
    }
    
    
    public func getDustServiceKey() -> String{
        
        return "TW7UjemO7vyDMu4mz6Rmj27Ix9NW0gh7EX2GT5UB%2Bh%2Bd%2BhAtQnSDlJRXMVm%2FoNG7vXMCn884ouC1oYZEDR9TIw%3D%3D"
    }
    
    
    public func getAddrServiceKey() -> String {
        
        
        return "1247d4d946e4e893b92336d83bebe792"
    }
    
    
    public func getNaverAPIID() -> String{
        
        return "_H_ogbPwFHl_eCRBNdQG"
    }
    
    
    public func getNaverAPISecret() -> String{
        
        return "X97KBFqSLt"

        
    }

}
