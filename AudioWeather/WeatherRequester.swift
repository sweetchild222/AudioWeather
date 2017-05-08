//
//  WeatherRequester.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 4..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class WeatherData{
    
    enum PtyCode{
        case unknown, No, rain, rainAndSnow, Snow
    }
    
    enum SkyCode{
        
        case unknown, clean, small, much, gary
    
    }
    
    var htm:Int             // hour
    var pop:Int             // rainFall percent
    var rn1:Int             // rainFall amount
    var reh:Int             // humidity percent
    var tmp:Float           // temperature
    
    var sky:SkyCode
    var pty:PtyCode
    
    init(htm:Int, pty:PtyCode, pop:Int, rn1:Int, reh:Int, sky:SkyCode, tmp:Float){
        
        self.htm = htm
        self.pty = pty
        self.pop = pop
        self.rn1 = rn1
        self.reh = reh
        self.sky = sky
        self.tmp = tmp
        
        print("htm : \(self.htm)")
        print("pty : \(self.pty)")
        print("sky : \(self.sky)")
        print("rn1 : \(self.rn1)")
        print("reh : \(self.reh)")
        print("tmp : \(self.tmp)")
        print("pop : \(self.pop)")
    }
}


class WeatherRequester{
    
    static let instance = WeatherRequester()
    
    var cuurentData:WeatherData?
    

    
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
    
    
    func updateCurrentValue(items:[[String:Any]]) -> Bool{
     
        
        var reh:Int?
        var rn1:Int?
        var pty:WeatherData.PtyCode?
        var sky:WeatherData.SkyCode?
        var pop:Int?
        var tmp:Float?
        
        self.cuurentData = nil
        
        let htm = (items[0]["baseTime"] as? Int)! / 100
        
        
        for item in items {
            
            let category = item["category"] as? String
            
            
            let itemHtm = (items[0]["baseTime"] as? Int)! / 100
            
            
            if itemHtm != htm{
                return false
            }
            
            if category == nil{
                return false
            }
            
            
            let value = item["obsrValue"] as Any
            
            switch category! {
                
                case "REH":
                    reh = value as? Int
                
                case "RN1":
                    rn1 = value as? Int
                
                case "PTY":
                    pty = valueToPtyCode(value:(value as? Int)!)
                
                case "SKY":
                    sky = valueToSkyCode(value:(value as? Int)!)
                
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
        
    
        self.cuurentData = WeatherData(htm:htm, pty:pty!, pop:pop!, rn1:rn1!, reh:reh!, sky:sky!, tmp:tmp!)
        
        return true
    }
    
    
    func parseCurrentData(data:Data) -> Bool {

        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            return false
        }
        
        let result = ((json?["response"] as? [String:Any])?["header"] as? [String:Any])?["resultCode"] as? String
        
        if Int(result!) != 0 {
            return false
        }
        
        let items = ((((json?["response"] as? [String:Any])?["body"] as? [String:Any])?["items"]) as? [String:Any])?["item"] as? [[String:Any]]
            
        if items == nil || (items?.count)! <= 0 {
            return false
        }
        
        if self.updateCurrentValue(items:items!) == false {
            return false
        }
        
        return true
    }
    
    
    public func request(completionHandler: @escaping (String?) -> Void) {
        
        requestCore(request: createRequestCurrentData()){ response in
            
            guard let responseValue = response, responseValue.count > 0 else {

                return
            }
            
            if self.parseCurrentData(data:responseValue) == false{
                print("error parse current data")
            }

            completionHandler("aa")

        }
        
        
        /*
        requestCore(request: createRequestTimeData()){ response in
            
            let responseValue = String(data: response!, encoding: String.Encoding.utf8)
            
            //completionHandler(responseValue)
            
            
        }
        
        requestCore(request: createRequestSpaceData()){ response in
            
            let responseValue = String(data: response!, encoding: String.Encoding.utf8)
            
            //completionHandler(responseValue)
            
            
            
        }
 
         */
        
    }
    
    
    
    
    
    
}
