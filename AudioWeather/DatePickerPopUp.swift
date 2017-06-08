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
    
    var date:Date = Date()
    
    var delegate:PickDateDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initStyle()
        initDatePicker()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.touchedOutSide)))
    }
    
    
    func touchedOutSide() {
        
        self.removeFromSuperview()
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
        
        guard let picker = sender as? UIDatePicker else{
            return
        }
        
        self.date = picker.date
    }
    

    @IBAction func selectDate(_ sender: Any) {
        
        self.removeFromSuperview()
        
        
        
        self.delegate?.selectDateHandler(date:self.date)
    }
}
