//
//  ViewController.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVQueuePlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        playSound()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
    
    
    func playSound() {
    
        let fileList:[String] = ["hi", "empty02", "today", "2017y", "5m", "25d", "5w", "empty04", "city_ky9", "forecast", "current_rain_snow", "empty02", "current_hour_10am", "empty04", "rna20", "empty02", "max_temp_min18", "empty02", "current_time", "hour_pm11", "min22", "empty02", "goodbye"]
        
        var items:[AVPlayerItem] = []
        
        for file in fileList{
            
            let url = Bundle.main.url(forResource: file, withExtension: "mp3")
            
            items.append(AVPlayerItem(url:url!))
        }
        
        self.player = AVQueuePlayer(items: items)
        
        self.player?.play()
    }
}

