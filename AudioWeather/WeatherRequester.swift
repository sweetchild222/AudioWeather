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
    

/////////////////////////////////////////////////////////////////////////////////////

    func currentDateBaseDate() -> Date {
        
        let minutes = Calendar.current.component(.minute, from: Date())
        
        let trimHour = minutes < 42 ? -1 : 0
        
        let current = Calendar.current.date(byAdding: .hour, value: trimHour, to:Date())
        
        return current!
    }
    
    
    func createRequestCurrentData() -> URLRequest{
        
        let nx = 55
        let ny = 127
        let pageNo = 1
        let numOfRows = 10
        
        let date = currentDateBaseDate()
        
        let url:String = String("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib").appending("?base_date=").appending(getDate(date: date)).appending("&base_time=").appending(getTime(date: date, addHalfMin: false)).appending("&nx=").appending(String(nx)).appending("&ny=").appending(String(ny)).appending("&pageNo=").appending(String(pageNo)).appending("&numOfRows=").appending(String(numOfRows)).appending("&ServiceKey=").appending(GlobalConfig.instance.getDustServiceKey()).appending("&_type=").appending("json")
    
        print(url)
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    

/////////////////////////////////////////////////////////////////////////////////////
    
    func timeDataBaseDate() -> Date {
        
        let minutes = Calendar.current.component(.minute, from: Date())
        
        let trimHour = minutes < 47 ? -1 : 0
        
        let current = Calendar.current.date(byAdding: .hour, value: trimHour, to:Date())
        
        return current!
    }
    

    func createRequestTimeData() -> URLRequest{
        
        let nx = 55
        let ny = 127
        let pageNo = 1
        let numOfRows = 40
        
        let date = timeDataBaseDate()
    
        let url:String = String("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastTimeData").appending("?base_date=").appending(getDate(date: date)).appending("&base_time=").appending(getTime(date: date, addHalfMin: true)).appending("&nx=").appending(String(nx)).appending("&ny=").appending(String(ny)).appending("&pageNo=").appending(String(pageNo)).appending("&numOfRows=").appending(String(numOfRows)).appending("&ServiceKey=").appending(GlobalConfig.instance.getDustServiceKey()).appending("&_type=").appending("json")
        
        print(url)
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    
    
/////////////////////////////////////////////////////////////////////////////////////
    
    func spaceDataBaseDate() -> Date {
        
        let minute = Calendar.current.component(.minute, from: Date())
        
        let hour = Calendar.current.component(.hour, from: Date())
        
        var trimHour = -((hour + 1) % 3)
        
        if trimHour == 0 && minute < 12 {
            
            trimHour = -3
        }
        
        let current = Calendar.current.date(byAdding: .hour, value: trimHour, to:Date())
        
        return current!
    }

    
    func createRequestSpaceData() -> URLRequest{
        
        let nx = 55
        let ny = 127
        let pageNo = 1
        let numOfRows = 225
        
        let date = spaceDataBaseDate()
        
        let url:String = String("http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData").appending("?base_date=").appending(getDate(date:date)).appending("&base_time=").appending(getTime(date: date, addHalfMin: false)).appending("&nx=").appending(String(nx)).appending("&ny=").appending(String(ny)).appending("&pageNo=").appending(String(pageNo)).appending("&numOfRows=").appending(String(numOfRows)).appending("&ServiceKey=").appending(GlobalConfig.instance.getDustServiceKey()).appending("&_type=").appending("json")
        
        
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
                return WeatherData.PtyCode.No

            case 1:
                return WeatherData.PtyCode.rain
                
            case 2:
                return WeatherData.PtyCode.rainAndSnow

            case 3:
                return WeatherData.PtyCode.Snow

            default:
                return WeatherData.PtyCode.unknown
        }
    
    }
    
    
    func valueToSkyCode(value:Int) ->WeatherData.SkyCode {
        
        switch value {
            
            case 1:
                return WeatherData.SkyCode.clean
                
            case 2:
                return WeatherData.SkyCode.small

            case 3:
                return WeatherData.SkyCode.much
                
            case 4:
                return WeatherData.SkyCode.gary
                
            default:
                return WeatherData.SkyCode.unknown
        }
    }
    
    
    
    func anyToInt(value:Any) -> Int{
        
        guard let guardValue = value as? String else{
            
            return value as! Int
            
        }
        
        return Int(guardValue)!
    }
    
    
    func updateCurrentValue(items:[[String:Any]]) -> WeatherData? {
     
        var reh:Int?
        var rn1:Int?
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
                    rn1 = value as? Int
                
                case "PTY":
                    pty = valueToPtyCode(value:(value as! Int))
                
                case "SKY":
                    sky = valueToSkyCode(value:(value as! Int))
                
                case "T1H":
                    tmp = value as? Float

                default:
                    print("undefined category!")
            }
        }
        
        if pty == WeatherData.PtyCode.No || pty == WeatherData.PtyCode.unknown{
            pop = 0
        }
        else{
            pop = 100
        }
        
        return WeatherData(htm:baseHtm, pty:pty!, pop:pop!, rn1:rn1!, reh:reh!, sky:sky!, tmp:tmp!)
    }
    
    
    
    func updateTimeDataValueCore(rehList:[Int:Int], ptyList:[Int:Int], rn1List:[Int:Int], skyList:[Int:Int], t1hList:[Int:Float], popList:[Int:Int]) ->[WeatherData]? {
        
        var weatherDataList:[WeatherData] = [WeatherData]()
        
        for item in rehList {
            
            let key = item.key
            
            guard let reh = rehList[key] else {
                return nil
            }
            
            guard let rn1 = rn1List[key] else {
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
            
            guard let t1h = t1hList[key] else {
                return nil
            }
            

            let weatherData = WeatherData(htm:key, pty:valueToPtyCode(value: pty), pop:pop, rn1:rn1, reh:reh, sky:valueToSkyCode(value: sky), tmp:t1h)
            
            weatherDataList.append(weatherData)
            
        }
        
        return weatherDataList
    }
    
    
    func updateTimeDataValue(items:[[String:Any]]) -> [WeatherData]? {
        
        var rehList = [Int:Int]()
        var ptyList = [Int:Int]()
        var rn1List = [Int:Int]()
        var skyList = [Int:Int]()
        var t1hList = [Int:Float]()
        var popList = [Int:Int]()

        for item in items {

            let fcstTime = anyToInt(value: item["fcstTime"]!) / 100
            
            guard let category = item["category"] as? String else{
                return nil
            }
            
        
            let value = item["fcstValue"] as Any
            
            switch category {
                
                case "REH":
                    rehList[fcstTime] = value as? Int
                    
                case "RN1":
                    rn1List[fcstTime] = value as? Int
                    
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
                    t1hList[fcstTime] = value as? Float
                    
                default:
                    print("undefined category!")
            }
 
        }
        
        
        let count = rehList.count
        
        if count != ptyList.count || count != rn1List.count || count != skyList.count || count != popList.count || count != t1hList.count{
            return nil
        }
        
        
        return updateTimeDataValueCore(rehList:rehList, ptyList:ptyList, rn1List:rn1List, skyList:skyList, t1hList:t1hList, popList:popList)
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
    
    
    func parseCurrentData(data:Data) -> WeatherData? {
        
        guard let items = extractItems(data:data) else{
            return nil
        }
        
        return self.updateCurrentValue(items:items)
    }
    
    
    func parseTimeData(data:Data) -> [WeatherData]? {
    
        guard let items = extractItems(data:data) else{
            return nil
        }
        
        
        return self.updateTimeDataValue(items:items)

    }
    
    public func request(completionHandler: @escaping (String?) -> Void) {
        
        
        requestCore(request: createRequestCurrentData()){ response in
         
            guard let responseValue = response, responseValue.count > 0 else {
                return
            }
            
            guard let weatherData = self.parseCurrentData(data:responseValue) else {
                print("error parse current data")
                return
            }
            
            print(weatherData.htm)

            completionHandler("aa")

        }
        
 

        /*
        requestCore(request: createRequestTimeData()){ response in
            
            guard let responseValue = response, responseValue.count > 0 else {
                return
            }
            
            guard let weatherDataList = self.parseTimeData(data: responseValue) else {
                
                print("error parse time data")
                return
            }
            
            
            print(weatherDataList[0].pop)
            
            completionHandler("gg")
            
        }
 */
 

        
            /*
        requestCore(request: createRequestSpaceData()){ response in
            
        
            let responseValue = String(data: response!, encoding: String.Encoding.utf8)
            
            //completionHandler(responseValue)
            
 
            
        }
 
 */
        
        
    }
    
    
    
    
    
    
}
