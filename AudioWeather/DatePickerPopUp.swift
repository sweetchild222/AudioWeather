//
//  DatePickerPopUp.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 7..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class DatePickerPopUp: UIView {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initStyle()
        initDatePicker()
        
    }
    
    
    func initDatePicker(){
        
        let calendar = Calendar.current
        
        let maxDate = calendar.date(byAdding: .year, value: 1, to: Date())
        let minDate = calendar.date(byAdding: .year, value: 0, to: Date())
        
        self.datePicker.maximumDate = maxDate
        self.datePicker.minimumDate = minDate
    }
    
    
    func initStyle(){
        
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
