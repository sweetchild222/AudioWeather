//
//  ButtonRepeat.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 4..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class ButtonRepeat: UIButton {

    let mainColor = UIColor(red: 52/255.0, green: 120.0/255.0, blue: 246/255.0, alpha: 1.0)
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.addTarget(self, action: #selector(ButtonRepeat.clicked(sender:)), for: UIControlEvents.touchUpInside)
        
        layer.cornerRadius = 0.5 * bounds.size.width
        layer.borderWidth = 1
        layer.borderColor = mainColor.cgColor
        layer.backgroundColor = UIColor.white.cgColor
        setTitleColor(mainColor, for: .normal)
    }
    
    
    func clicked(sender: UIButton) {
        
        print("aasdfaf")
        isChecked = !isChecked
    }
    
    
    var isChecked: Bool = false {
        
        
        didSet{
            
            if isChecked == true {
                
                layer.backgroundColor = mainColor.cgColor
                setTitleColor(UIColor.white, for: .normal)
                
            } else {
                
                layer.backgroundColor = UIColor.white.cgColor
                setTitleColor(mainColor, for: .normal)
                
            }
        }
    }

}
