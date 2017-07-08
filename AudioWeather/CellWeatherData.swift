//
//  CellWeatherData.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 7. 5..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit

class CellWeatherData: UIView {
    
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func updateData(data:WeatherData){
        
        self.timeText.text = String(data.htm) + "시"
        
        if data.pty != .clean{
            
            self.weatherImage.image = getUIImage(resource:getResource(pty: data.pty))
            self.weatherText.text = getTextRainSnow(pty:data.pty) + "\n" + getTextRna(rna:data.rna, hrs:data.hrs) + "\n" + getTextTemp(tmp:data.tmp) + " / " + getTextHumidity(reh: data.reh)
        }
        else{
            
            self.weatherImage.image = getUIImage(resource:getResource(sky: data.sky))
            self.weatherText.text = getTextSky(sky:data.sky) + "\n" + getTextTemp(tmp:data.tmp) + " / " + getTextHumidity(reh: data.reh)
        }
    }
    
    
    
    func getTextHumidity(reh:Int) -> String{
        
        return String(describing: reh).appending("%")
    }
    
    
    func clean(){
        
        self.timeText.text = nil
        self.weatherImage.image = nil
        self.weatherText.text = nil
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
    
    
    func getTextRna(rna:Int, hrs:Int) -> String {
        
        
        if hrs == 1{
        
            return String(describing: rna).appending(" (mm/hr)")
        }
        else{
            
            return String(describing: rna).appending(" (mm/\(hrs)hr)")
        }
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
    
    /*
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:20, y:50))
        
        aPath.addLine(to: CGPoint(x:300, y:50))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor.red.set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
    }
*/

}
