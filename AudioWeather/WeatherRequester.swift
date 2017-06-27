//
//  WeatherRequester.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 4..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class WeatherRequester{
    
    static let instance = WeatherRequester()
    
    var exitCount:Int = 0
    
    var dataCurrent:WeatherDataCurrent?
    var dataClosed:WeatherDataClosed?
    var dataSpace:WeatherDataSpace?
    
    func getDate(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "YYYYMMdd"
        
        return dateFormatter.string(from:date)
    }
    
    func getTime(date: Date, addHalfMin: Bool) -> String{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = addHalfMin == true ? "HH30" : "HH00"
        
        return dateFormatter.string(from:date)
    }
    
    
    func getFcstToday() -> Int{
        
        return Int(getDate(date: Date()))!
    }
    
    
    func getFcstCurHour() -> Int{
        
        return Int(getTime(date: baseDateDataSpace(), addHalfMin:false))!
    }
    

/////////////////////////////////////////////////////////////////////////////////////

    func baseDateDataCurrent() -> Date {
        
        let minutes = Calendar.current.component(.minute, from: Date())
        
        let trimHour = minutes < 42 ? -1 : 0
        
        let current = Calendar.current.date(byAdding: .hour, value: trimHour, to:Date())
        
        return current!
    }
    
    
    func createRequestDataCurrent(nx:Double, ny:Double) -> URLRequest{
        
        //let nx = 55
        //let ny = 127
        let pageNo = 1
        let numOfRows = 10
        
        let date = baseDateDataCurrent()
        
        let url:String = String("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib").appending("?base_date=").appending(getDate(date: date)).appending("&base_time=").appending(getTime(date: date, addHalfMin: false)).appending("&nx=").appending(String(Int(nx))).appending("&ny=").appending(String(Int(ny))).appending("&pageNo=").appending(String(pageNo)).appending("&numOfRows=").appending(String(numOfRows)).appending("&ServiceKey=").appending(GlobalConfig.instance.getWeatherServiceKey()).appending("&_type=").appending("json")
    
        print(url)
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    

/////////////////////////////////////////////////////////////////////////////////////
    
    func baseDateDataClosed() -> Date {
        
        let minutes = Calendar.current.component(.minute, from: Date())
        
        let trimHour = minutes < 47 ? -1 : 0
        
        let current = Calendar.current.date(byAdding: .hour, value: trimHour, to:Date())
        
        return current!
    }
    

    func createRequestDataClosed(nx:Double, ny:Double) -> URLRequest{
        
        //let nx = 55
        //let ny = 127
        let pageNo = 1
        let numOfRows = 40
        
        let date = baseDateDataClosed()
    
        let url:String = String("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastTimeData").appending("?base_date=").appending(getDate(date: date)).appending("&base_time=").appending(getTime(date: date, addHalfMin: true)).appending("&nx=").appending(String(Int(nx))).appending("&ny=").appending(String(Int(ny))).appending("&pageNo=").appending(String(pageNo)).appending("&numOfRows=").appending(String(numOfRows)).appending("&ServiceKey=").appending(GlobalConfig.instance.getWeatherServiceKey()).appending("&_type=").appending("json")
        
        print(url)
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    
    
/////////////////////////////////////////////////////////////////////////////////////
    
    func baseDateDataSpace() -> Date {
        
        let minute = Calendar.current.component(.minute, from: Date())
        
        let hour = Calendar.current.component(.hour, from: Date())
        
        var trimHour = -((hour + 1) % 3)
        
        if trimHour == 0 && minute < 12 {
            
            trimHour = -3
        }
        
        let current = Calendar.current.date(byAdding: .hour, value: trimHour, to:Date())
        
        return current!
    }

    
    func createRequestDataSpace(nx:Double, ny:Double) -> URLRequest{
        
        let pageNo = 1
        let numOfRows = 225
        
        let date = baseDateDataSpace()
        
        let url:String = String("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData").appending("?base_date=").appending(getDate(date:date)).appending("&base_time=").appending(getTime(date: date, addHalfMin: false)).appending("&nx=").appending(String(Int(nx))).appending("&ny=").appending(String(Int(ny))).appending("&pageNo=").appending(String(pageNo)).appending("&numOfRows=").appending(String(numOfRows)).appending("&ServiceKey=").appending(GlobalConfig.instance.getWeatherServiceKey()).appending("&_type=").appending("json")
        
        
        print(url)
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    
/////////////////////////////////////////////////////////////////////////////////////
    
    
    func requestCore(request:URLRequest, completionHandler: @escaping (Data?) -> Void) {
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription as Any)
                
                completionHandler(nil)
                return
            }
            
            guard let dataValue = data, data?.count != 0 else {
                
                completionHandler(nil)
                return
            }
            
            
            completionHandler(dataValue)
            
            return
            
        }
        
        task.resume()
        
    }
    
    
    func valueToPtyCode(value:Int) ->WeatherData.PtyCode {
        
        switch value {
            
            case 0:
                return .clean

            case 1:
                return .rain
                
            case 2:
                return .rainsnow

            case 3:
                return .snow

            default:
                return .clean
        }
    
    }
    
    
    func valueToSkyCode(value:Int) ->WeatherData.SkyCode {
        
        switch value {
            
            case 1:
                return .clean
                
            case 2:
                return .small

            case 3:
                return .much
                
            case 4:
                return .gray
                
            default:
                return .clean
        }
    }
    
    
    
    func anyToInt(value:Any) -> Int{
        
        guard let guardValue = value as? String else{
            
            return value as! Int
            
        }
        
        return Int(guardValue)!
    }
    
    
    func parseDataCurrent(items:[[String:Any]]) -> WeatherDataCurrent? {
     
        var reh:Int?
        var rna:Int?
        var pty:WeatherData.PtyCode?
        var sky:WeatherData.SkyCode?
        var pop:Int?
        var tmp:Float?
        
        let baseHtm = anyToInt(value: items[0]["baseTime"]!) / 100
        
        for item in items {
            
            let itemHtm = anyToInt(value: item["baseTime"]!) / 100
            
            if itemHtm != baseHtm{
                return nil
            }

            guard let category = item["category"] as? String else{
                return nil
            }
            
            
            let value = item["obsrValue"] as Any
            
            switch category {
                
                case "REH":
                    reh = value as? Int
                
                case "RN1":
                    rna = value as? Int
                
                case "PTY":
                    pty = valueToPtyCode(value:(value as! Int))
                
                case "SKY":
                    sky = valueToSkyCode(value:(value as! Int))
                
                case "T1H":
                    tmp = value as? Float

                default:
                    continue
            }
        }
        
        if pty == WeatherData.PtyCode.clean {
            pop = 0
        }
        else{
            pop = 100
        }
        
        return WeatherDataCurrent(data:WeatherData(htm:baseHtm, hrs:1, pty:pty!, pop:pop!, rna:rna!, reh:reh!, sky:sky!, tmp:tmp!))
    }
    
    
    
    func toDataList(hrs:Int, rehList:[Int:Int], ptyList:[Int:Int], rnaList:[Int:Int], skyList:[Int:Int], tmpList:[Int:Float], popList:[Int:Int]) ->[WeatherData]? {
        
        var weatherDataList:[WeatherData] = [WeatherData]()
        
        for item in rehList {
            
            let key = item.key
            
            guard let reh = rehList[key] else {
                return nil
            }
            
            guard let rna = rnaList[key] else {
                return nil
            }
            
            guard let pty = ptyList[key] else {
                return nil
            }
            
            guard let sky = skyList[key] else {
                return nil
            }
            
            guard let pop = popList[key] else {
                return nil
            }
            
            guard let tmp = tmpList[key] else {
                return nil
            }
            

            let weatherData = WeatherData(htm:key, hrs:hrs, pty:valueToPtyCode(value: pty), pop:pop, rna:rna, reh:reh, sky:valueToSkyCode(value: sky), tmp:tmp)
            
            weatherDataList.append(weatherData)
        }
        
        return weatherDataList
    }
    
    
    func parseDataClosed(items:[[String:Any]]) -> WeatherDataClosed? {
        
        var rehList = [Int:Int]()
        var ptyList = [Int:Int]()
        var rnaList = [Int:Int]()
        var skyList = [Int:Int]()
        var tmpList = [Int:Float]()
        var popList = [Int:Int]()

        for item in items {

            let fcstTime = anyToInt(value: item["fcstTime"]!) / 100
            
            guard let category = item["category"] as? String else{
                return nil
            }
            
            if getFcstToday() != anyToInt(value: item["fcstDate"] as Any){
                continue
            }
        
            let value = item["fcstValue"] as Any
            
            switch category {
                
                case "REH":
                    rehList[fcstTime] = value as? Int
                    
                case "RN1":
                    rnaList[fcstTime] = value as? Int
                    
                case "PTY":
                    
                    guard let guardValue = value as? Int else{
                        return nil
                    }
                    
                    ptyList[fcstTime] = guardValue
                    
                    if guardValue == 0 {
                        popList[fcstTime] = 0
                    }
                    else{
                        popList[fcstTime] = 100
                    }
                    
                case "SKY":
                    skyList[fcstTime] = value as? Int
                    
                case "T1H":
                    tmpList[fcstTime] = value as? Float
                    
                default:
                    continue
            }
 
        }
        
        
        let count = rehList.count
        
        if count != ptyList.count || count != rnaList.count || count != skyList.count || count != popList.count || count != tmpList.count{
            print("different time data list count")
            return nil
        }
        
        guard let dataList = toDataList(hrs:1, rehList:rehList, ptyList:ptyList, rnaList:rnaList, skyList:skyList, tmpList:tmpList, popList:popList) else {
            print("toDataList failed")
            return nil
        }
        
        
        return WeatherDataClosed(dataList:dataList)
    }
    
    
    func fillMissedRnaKey(ptyList:[Int:Int], rnaList:[Int:Int]) -> [Int:Int] {
        
        var tempList = rnaList
        
        for item in ptyList {
            
            let key = item.key
            let value = item.value
            
            if rnaList[key] == nil {
                
                if value == 0 || value == 3 {
                
                    let rnaValue = rnaList[key + 3]
                    
                    tempList[key] = rnaValue ?? 0

                }
                else {
                    
                    tempList[key] = 0
                }
            }
        }
        
        return tempList
    }
    
    
    func parseDataSpace(items:[[String:Any]]) -> WeatherDataSpace? {
        
        var rehList = [Int:Int]()
        var ptyList = [Int:Int]()
        var rnaList = [Int:Int]()
        var skyList = [Int:Int]()
        var tmpList = [Int:Float]()
        var popList = [Int:Int]()
        var tmx:Float?
        
        for item in items {
            
            let fcstTime = anyToInt(value: item["fcstTime"]!) / 100
            
            guard let category = item["category"] as? String else{
                return nil
            }
            

            if getFcstToday() != anyToInt(value: item["fcstDate"] as Any){
                continue
            }
            
            
            if (getFcstCurHour() / 100) > fcstTime {
                continue
            }
            
    
            let value = item["fcstValue"] as Any
            
            switch category {
                
                case "REH":
                    rehList[fcstTime] = value as? Int
                    
                case "R06":
                    rnaList[fcstTime] = (value as? Int)! / 2
                    rnaList[fcstTime + 3] = (value as? Int)! / 2
                    
                case "PTY":
                    ptyList[fcstTime] = value as? Int
                    
                case "POP":
                    popList[fcstTime] = value as? Int
                    
                case "SKY":
                    skyList[fcstTime] = value as? Int
                    
                case "T3H":
                    tmpList[fcstTime] = value as? Float
                    
                case "TMX":
                    
                    guard let tmxValue = value as? Float else{
                        
                        return nil
                    }
                    
                    if tmx == nil || (tmx != nil && (tmx! < tmxValue)) {
                        tmx = tmxValue
                    }
                    
                default:
                    continue
            }
        }
    
        let count = rehList.count
        
        
        if rnaList.count != ptyList.count {
            
            rnaList = fillMissedRnaKey(ptyList: ptyList, rnaList: rnaList)
        }
        
        
        if count != ptyList.count || count != rnaList.count || count != skyList.count || count != popList.count || count != tmpList.count{
            print("different space data list count")
            return nil
        }
        
        guard let dataList = toDataList(hrs:3, rehList:rehList, ptyList:ptyList, rnaList:rnaList, skyList:skyList, tmpList:tmpList, popList:popList) else{
            print("toDataList failed")
            return nil
        }

        return WeatherDataSpace(dataList:dataList, tmx:tmx)

    }
    
    
    func extractItems(data:Data) -> [[String:Any]]? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            
            return nil
        }
        
        guard let result = ((json?["response"] as! [String:Any])["header"] as! [String:Any])["resultCode"] as? String, Int(result) == 0 else  {
            
            return nil
        }

        
        guard let items = ((((json?["response"] as! [String:Any])["body"] as! [String:Any])["items"]) as! [String:Any])["item"] as? [[String:Any]], items.count > 0 else {
            
            return nil
        }
        
        
        return items
    }
    
    
    
    func throughCompletionHander(completionHandler: @escaping (WeatherDataManager?) -> Void) {
        
        self.exitCount -= 1
        
        if self.exitCount == 0{
            
            
            if self.dataCurrent == nil || self.dataClosed == nil || self.dataSpace == nil{
                completionHandler(nil)
                
            }else{
            
                let dataManager = WeatherDataManager(dataCurrent:dataCurrent!, dataClosed:dataClosed!, dataSpace:dataSpace!)
                completionHandler(dataManager)
            }
        }
    }

    
    public func request(lat:Double, lgt:Double, completionHandler: @escaping (WeatherDataManager?) -> Void) {
        
        self.exitCount = 3
        
        self.dataCurrent = nil
        self.dataClosed = nil
        self.dataSpace = nil
        
        let position = Position(lat: lat, lgt: lgt)
        let nx = position.xy.x
        let ny = position.xy.y
        
        requestCore(request: createRequestDataCurrent(nx:nx, ny:ny)){ response in
         
            guard let responseValue = response, responseValue.count > 0 else {
         
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            
            
            guard let items = self.extractItems(data:responseValue) else{
         
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            
            
            guard let dataCurrent = self.parseDataCurrent(items: items) else {
         
                print("error parse data current")
                
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            
            self.dataCurrent = dataCurrent
            
            self.throughCompletionHander(completionHandler: completionHandler)
            
        }

        
        requestCore(request: createRequestDataClosed(nx:nx, ny:ny)){ response in
        
            
            guard let responseValue = response, responseValue.count > 0 else {
         
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            
            guard let items = self.extractItems(data:responseValue) else{
         
                self.throughCompletionHander(completionHandler: completionHandler)

                return
            }
            
            guard let dataClosed = self.parseDataClosed(items:items) else {
                
                print("error parse data closed")
                
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            
            
            self.dataClosed = dataClosed

            self.throughCompletionHander(completionHandler: completionHandler)

        }
 

        requestCore(request: createRequestDataSpace(nx:nx, ny:ny)){ response in
            
            guard let responseValue = response, responseValue.count > 0 else {

                self.throughCompletionHander(completionHandler: completionHandler)

                return
            }
            

            guard let items = self.extractItems(data:responseValue) else{
            
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            

            guard let dataSpace = self.parseDataSpace(items:items) else {
                
                print("error parse data space")
                
                self.throughCompletionHander(completionHandler: completionHandler)
                
                return
            }
            
            self.dataSpace = dataSpace
            
            self.throughCompletionHander(completionHandler: completionHandler)
            
        }
 
    }
    
}
