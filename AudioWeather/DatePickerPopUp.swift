//
//  DatePickerPopUp.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 7..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class DatePickerPopUp: UIView {
    
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
        self.baseView.backgroundColor = UIColor.white
        self.baseView.layer.cornerRadius = 9.0
    }
    
    
    @IBAction func dateChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func selectDate(_ sender: Any) {
        
        self.removeFromSuperview()
    }
}
