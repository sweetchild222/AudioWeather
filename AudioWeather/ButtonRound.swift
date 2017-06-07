//
//  ButtonRound.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 7..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class ButtonRound: UIButton {

    let mainColor = UIColor(red: 52/255.0, green: 120.0/255.0, blue: 246/255.0, alpha: 1.0)
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
                
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = mainColor.cgColor
        
        layer.backgroundColor = mainColor.cgColor
        setTitleColor(UIColor.white, for: .normal)
    }

}
