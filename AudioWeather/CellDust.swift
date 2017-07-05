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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func clear() {
        
        self.pm25Image.image = nil
        self.pm10Image.image = nil
        
        self.pm25Text.text = nil
        self.pm10Text.text = nil
    }
    
    func update(address:Address?, dustList:[String: [String: DustRequester.Grade]]) {
        
    
        guard let xAddress = address else{
            clear()
            return
        }
        
        guard let value = AddressMap.instance.getMapInfo(addr:xAddress) else {
    
            clear()
            return
        }
        
        let area:String = value.getArea()
        
        guard let pm25Grade = dustList["PM25"]?[area] else {
            clear()
            return
        }
        
        guard let pm10Grade = dustList["PM10"]?[area] else {
            
            clear()
            return
        }
        
        guard let xGrade25Image = getUIImage(grade: pm25Grade) else{
            clear()
            return
        }

        guard let xGrade10Image = getUIImage(grade: pm10Grade) else{
            clear()
            return
        }

        
        self.pm25Image.image = xGrade25Image
        self.pm10Image.image = xGrade10Image
        
        self.pm25Text.text = pm25GradeToText(grade:pm25Grade)
        self.pm10Text.text = pm10GradeToText(grade:pm10Grade)
    }
    
    
    
    func getResource(grade:DustRequester.Grade) -> String {
        
        switch grade {
            
        case .unknown:
            return "normal"
        case .good:
            return "good"
        case .normal:
            return "normal"
        case .bad:
            return "bad"
        case .worst:
            return "worst"
        }
    }
    
    
    func getUIImage(grade:DustRequester.Grade) -> UIImage?{
        
        
        let resource = getResource(grade: grade)
    
        let url = Bundle.main.url(forResource: resource, withExtension: "png")
        
        let data = try? Data(contentsOf: url!)
        
        guard let imageData = data else{
            return nil
        }
        
        return UIImage(data: imageData)
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
