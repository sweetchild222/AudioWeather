//
//  CellCurrent.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 30..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellCurrent: UITableViewCell {
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentText: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func updateData(dataCurrent:WeatherDataCurrent){
        
        if dataCurrent.data.pty != .clean{
            
            currentImage.image = getUIImage(resource:getResource(pty: dataCurrent.data.pty))
            currentText.text = getTextRainSnow(pty:dataCurrent.data.pty) + "\n" + getTextRna(rna:dataCurrent.data.rna) + "\n" + getTextTemp(tmp:dataCurrent.data.tmp) + " / " + getTextHumidity(reh: dataCurrent.data.reh)
        }
        else{
            
            currentImage.image = getUIImage(resource:getResource(sky: dataCurrent.data.sky))
            currentText.text = getTextSky(sky:dataCurrent.data.sky) + "\n" + getTextTemp(tmp:dataCurrent.data.tmp) + " / " + getTextHumidity(reh: dataCurrent.data.reh)
        }
    }
    
    
    func getTextHumidity(reh:Int) -> String{
        
        return String(describing: reh).appending("%")
    }
    
    
    func getTextSky(sky:WeatherData.SkyCode) -> String {
        
        switch sky {
            
        case .clean:
            return "맑음"
        case .small:
            return "구름 조금"
        case .much:
            return "구름 많음"
        case .gray:
            return "흐림"
        }
        
    }
    
    
    func getTextTemp(tmp:Float) -> String {
        
        return String(describing: tmp).appending(" ℃")
    }
    
    
    func getTextRna(rna:Int) -> String {
        
        return String(describing: rna).appending(" (mm/hr)")
    }

    
    func getTextRainSnow(pty:WeatherData.PtyCode) -> String {
        
        switch pty {
            
        case .clean:
            return "맑음"
        case .rain:
            return "비"
        case .rainsnow:
            return "비/눈"
        case .snow:
            return "눈"
        }
    }
    
    func getResource(pty:WeatherData.PtyCode) -> String {
        
        switch pty {
            
        case .clean:
            return "sky_clean"
        case .rain:
            return "pty_rain"
        case .rainsnow:
            return "pty_rain"
        case .snow:
            return "pty_snow"
        }
    }
    
    
    func getResource(sky:WeatherData.SkyCode) -> String {
        
        switch sky {
            
        case .clean:
            return "sky_clean"
        case .small:
            return "sky_small"
        case .much:
            return "sky_much"
        case .gray:
            return "sky_gray"
        }
    }
    
    
    func getUIImage(resource:String) -> UIImage?{
        

        let url = Bundle.main.url(forResource: resource, withExtension: "png")
        
        let data = try? Data(contentsOf: url!)
        
        guard let imageData = data else{
            return nil
        }
        
        return UIImage(data: imageData)
    }
}
