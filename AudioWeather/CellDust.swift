//
//  CellDust.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 30..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellDust: UITableViewCell {

    
    @IBOutlet weak var pm25Image: UIImageView!
    @IBOutlet weak var pm25Text: UILabel!
    @IBOutlet weak var pm10Image: UIImageView!
    @IBOutlet weak var pm10Text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func update(address:Address?, dustList:[String: [String: DustRequester.Grade]]) {
        
        guard let xAddress = address else{
            
            return
        }
        
        guard let value = AddressMap.instance.getMapInfo(addr:xAddress) else {
            
            return
        }
        
        let area:String = value.getArea()
        
        guard let pm25Grade = dustList["PM25"]?[area] else {
            
            return
        }
        
        guard let pm10Grade = dustList["PM10"]?[area] else {
            
            return
        }


        print(pm25Grade)
        print(pm10Grade)
        
        
        self.pm25Text.text = pm25GradeToText(grade:pm25Grade)
        self.pm10Text.text = pm10GradeToText(grade:pm10Grade)
        
        
        print("update dust\(xAddress.getText())")
        
    }
    
    
    
    func pm25GradeToText(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case .unknown:
            return "미세먼지 모름"
        case .good:
            return "미세먼지 좋음"
        case .normal:
            return "미세먼지 보통"
        case .bad:
            return "미세먼지 나쁨"
        case .worst:
            return "미세먼지 매우나쁨"
        }
    }
    
    
    func pm10GradeToText(grade:DustRequester.Grade) -> String{
        
        switch grade {
            
        case .unknown:
            return "초미세먼지 모름"
        case .good:
            return "초미세먼지 좋음"
        case .normal:
            return "초미세먼지 보통"
        case .bad:
            return "초미세먼지 나쁨"
        case .worst:
            return "초미세먼지 매우나쁨"
        }
    }
    
}
