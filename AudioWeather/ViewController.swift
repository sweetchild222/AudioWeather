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
    
    
    func generateItems() -> [Item]{
        
        
        let addr = Address(upper:"경기도", lower:"성남시 분당구")
        let dustList:[String: [String: DustRequester.Grade]] = ["PM25": ["울산": AudioWeather.DustRequester.Grade.normal, "전북": AudioWeather.DustRequester.Grade.normal, "경남": AudioWeather.DustRequester.Grade.normal, "세종": AudioWeather.DustRequester.Grade.normal, "인천": AudioWeather.DustRequester.Grade.normal, "영동": AudioWeather.DustRequester.Grade.normal, "제주": AudioWeather.DustRequester.Grade.normal, "경기북부": AudioWeather.DustRequester.Grade.normal, "충남": AudioWeather.DustRequester.Grade.normal, "광주": AudioWeather.DustRequester.Grade.normal, "대구": AudioWeather.DustRequester.Grade.normal, "대전": AudioWeather.DustRequester.Grade.normal, "부산": AudioWeather.DustRequester.Grade.normal, "전남": AudioWeather.DustRequester.Grade.normal, "영서": AudioWeather.DustRequester.Grade.normal, "충북": AudioWeather.DustRequester.Grade.normal, "경기남부": AudioWeather.DustRequester.Grade.good, "경북": AudioWeather.DustRequester.Grade.normal, "서울": AudioWeather.DustRequester.Grade.normal], "PM10": ["울산": AudioWeather.DustRequester.Grade.normal, "전북": AudioWeather.DustRequester.Grade.normal, "경남": AudioWeather.DustRequester.Grade.normal, "세종": AudioWeather.DustRequester.Grade.normal, "인천": AudioWeather.DustRequester.Grade.normal, "영동": AudioWeather.DustRequester.Grade.normal, "제주": AudioWeather.DustRequester.Grade.normal, "경기북부": AudioWeather.DustRequester.Grade.normal, "충남": AudioWeather.DustRequester.Grade.normal, "광주": AudioWeather.DustRequester.Grade.normal, "대구": AudioWeather.DustRequester.Grade.normal, "대전": AudioWeather.DustRequester.Grade.normal, "부산": AudioWeather.DustRequester.Grade.normal, "전남": AudioWeather.DustRequester.Grade.normal, "영서": AudioWeather.DustRequester.Grade.normal, "충북": AudioWeather.DustRequester.Grade.normal, "경기남부": AudioWeather.DustRequester.Grade.bad, "경북": AudioWeather.DustRequester.Grade.normal, "서울": AudioWeather.DustRequester.Grade.normal]]
        
        
        let dataCurrent = WeatherDataCurrent(data:WeatherData(htm:8, hrs:1, pty:WeatherData.PtyCode.rainsnow, pop:0, rna:20, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3))
        
        let dataClosedList:[WeatherData] = [
            WeatherData(htm:9, hrs:1, pty:WeatherData.PtyCode.rain, pop:0, rna:10, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3),
            WeatherData(htm:10, hrs:1, pty:WeatherData.PtyCode.rain, pop:0, rna:10, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.0),
            WeatherData(htm:11, hrs:1, pty:WeatherData.PtyCode.rain, pop:0, rna:10, reh:30, sky:WeatherData.SkyCode.small, tmp:24.3)]
        
        let dataClosed = WeatherDataClosed(dataList:dataClosedList)
        
        let dataSpaceList:[WeatherData] = [
            WeatherData(htm:15, hrs:3, pty:WeatherData.PtyCode.clean, pop:0, rna:30, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3),
            WeatherData(htm:18, hrs:3, pty:WeatherData.PtyCode.clean, pop:0, rna:0, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.0),
            WeatherData(htm:21, hrs:3, pty:WeatherData.PtyCode.clean, pop:0, rna:0, reh:30, sky:WeatherData.SkyCode.small, tmp:24.3)]
        
        let dataSpace = WeatherDataSpace(dataList:dataSpaceList, tmx:39.42)

        /*
        let dataCurrent = WeatherDataCurrent(data:WeatherData(htm:8, hrs:1, pty:WeatherData.PtyCode.clean, pop:0, rna:20, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3))
        
        let dataClosedList:[WeatherData] = [
            WeatherData(htm:9, hrs:1, pty:WeatherData.PtyCode.clean, pop:0, rna:10, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3),
            WeatherData(htm:10, hrs:1, pty:WeatherData.PtyCode.clean, pop:50, rna:10, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.0),
            WeatherData(htm:11, hrs:1, pty:WeatherData.PtyCode.clean, pop:0, rna:10, reh:30, sky:WeatherData.SkyCode.small, tmp:24.3)]
        
        let dataClosed = WeatherDataClosed(dataList:dataClosedList)
        
        let dataSpaceList:[WeatherData] = [
            
            WeatherData(htm:0, hrs:3, pty:WeatherData.PtyCode.clean, pop:50, rna:32, reh:31, sky:WeatherData.SkyCode.clean, tmp:24.3),
            WeatherData(htm:3, hrs:3, pty:WeatherData.PtyCode.clean, pop:50, rna:32, reh:31, sky:WeatherData.SkyCode.clean, tmp:24.3),
            WeatherData(htm:6, hrs:3, pty:WeatherData.PtyCode.clean, pop:50, rna:32, reh:31, sky:WeatherData.SkyCode.clean, tmp:24.3),
            WeatherData(htm:9, hrs:3, pty:WeatherData.PtyCode.clean, pop:50, rna:32, reh:31, sky:WeatherData.SkyCode.clean, tmp:24.3),
        
            WeatherData(htm:12, hrs:3, pty:WeatherData.PtyCode.clean, pop:50, rna:32, reh:31, sky:WeatherData.SkyCode.gray, tmp:24.3),
            WeatherData(htm:15, hrs:3, pty:WeatherData.PtyCode.clean, pop:50, rna:32, reh:31, sky:WeatherData.SkyCode.gray, tmp:24.3),
            WeatherData(htm:18, hrs:3, pty:WeatherData.PtyCode.clean, pop:30, rna:103, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.0),
            WeatherData(htm:21, hrs:3, pty:WeatherData.PtyCode.clean, pop:0, rna:0, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.3)]
        
        let dataSpace = WeatherDataSpace(dataList:dataSpaceList, tmx:nil)
         */
 
        
        /*
        let dataCurrent = WeatherDataCurrent(data:WeatherData(htm:8, hrs:1, pty:WeatherData.PtyCode.clean, pop:0, rna:20, reh:31, sky:WeatherData.SkyCode.small, tmp:-24.3))
        
        let dataClosedList:[WeatherData] = [
            WeatherData(htm:9, hrs:1, pty:WeatherData.PtyCode.clean, pop:0, rna:10, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3),
            WeatherData(htm:10, hrs:1, pty:WeatherData.PtyCode.snow, pop:50, rna:0, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.0),
            WeatherData(htm:11, hrs:1, pty:WeatherData.PtyCode.clean, pop:0, rna:10, reh:30, sky:WeatherData.SkyCode.small, tmp:24.3)]
        
        let dataClosed = WeatherDataClosed(dataList:dataClosedList)
        
        let dataSpaceList:[WeatherData] = [
            WeatherData(htm:15, hrs:3, pty:WeatherData.PtyCode.snow, pop:50, rna:0, reh:31, sky:WeatherData.SkyCode.small, tmp:24.3),
            WeatherData(htm:18, hrs:3, pty:WeatherData.PtyCode.snow, pop:30, rna:0, reh:30, sky:WeatherData.SkyCode.gray, tmp:24.0),
            WeatherData(htm:21, hrs:3, pty:WeatherData.PtyCode.clean, pop:0, rna:0, reh:30, sky:WeatherData.SkyCode.small, tmp:24.3)]
        
        let dataSpace = WeatherDataSpace(dataList:dataSpaceList, tmx:-12)
         */
        
        
        let dataManager = WeatherDataManager(dataCurrent:dataCurrent, dataClosed:dataClosed, dataSpace:dataSpace)
        
        return ItemListGenerator.instance.generate(addr:addr, dustList:dustList, dataManager:dataManager)
        
    }
    

    func playSound() {
    
        //let fileList:[String] = ["hi", "empty02", "today", "2017y", "5m", "25d", "5w", "empty04", "city_ky9", "forecast", "current_rain_snow", "empty02", "current_hour_10am", "empty04", "rna20", "empty02", "max_temp_min18", "empty02", "current_time", "hour_pm11", "min22", "empty02", "goodbye"]
        
        
        let items = generateItems()
        
        
        var avItems:[AVPlayerItem] = []
        
        for item in items{
            
            print(item.getAudio())
            
            let url = Bundle.main.url(forResource: item.getAudio(), withExtension: "mp3")
            
            avItems.append(AVPlayerItem(url:url!))
        }
        
        self.player = AVQueuePlayer(items: avItems)
        
        self.player?.play()
    }
}

