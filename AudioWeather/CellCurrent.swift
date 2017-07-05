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
        }
        else{
            
            currentImage.image = getUIImage(resource:getResource(sky: dataCurrent.data.sky))
        }
        
        print("update current")
        
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
