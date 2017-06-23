//
//  PlayWeather.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 6. 23..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation
import AVFoundation


class PlayWeather{
    
    let address:Address

    var dataManager:WeatherDataManager? = nil
    var dustList:[String: [String: DustRequester.Grade]]? = nil
    var player:AVQueuePlayer? = nil
    
    init(address:Address){
        
        self.address = address
    }
    
    
    func play(){
        
        requestWeather()
        requestDust()
    }
    
    
    func stop(){
        
        guard let queuePlayer = self.player else{
            return
        }
        
        queuePlayer.removeAllItems()
    }
    
    
    func playWithData(){
        
        guard let weatherData = self.dataManager else{
            return
        }
        
        guard let dustData = self.dustList else{
            return
        }
        
        let list = ItemListGenerator.instance.generate(addr: self.address, dustList: dustData, dataManager: weatherData)
        
        var items:[AVPlayerItem] = []

        for item in list{
            
            let url = Bundle.main.url(forResource: item.getAudio(), withExtension: "mp3")
            
            let avItem = AVPlayerItem(url:url!)
            
            items.append(avItem)
        }
        
        self.player = AVQueuePlayer(items: items)
        self.player?.play()
    }
    
    
    
    func requestWeather(){
        
        WeatherRequester.instance.request(){ response in
            
            guard let value = response else {
                return
            }

            
            self.dataManager = value
            
            self.playWithData()
            
        }
    }
    
    

    func requestDust(){
        
        DustRequester.instance.request(){ response in
            
            guard let value = response, value.isEmpty == false else {
                return
            }
            
            self.dustList = value
            self.playWithData()
        }
    }
}
