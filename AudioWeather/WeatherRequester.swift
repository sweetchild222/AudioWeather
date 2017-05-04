//
//  WeatherRequester.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 4..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation

/*
class WeatherData{
    
    enum PtyCode{
        case unknown, No, rain, rainAndSnow, Snow
    }
    
    enum SkyCode{
        
        case unknown, clean, small, much, cloudy
    
    }
    
    var hour:Int            // hour
    var pty:PtyCode
    var pop:Int             // rainFall percent
    var rn1:Int             // rainFall amount
    var reh:Int             // humidity percent
    
    var sky:SkyCode
    var temperature:Int     //temperature
    

    init(){
        
    }
}
*/

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
    
    
    public func request(completionHandler: @escaping (String?) -> Void) {
        
        requestCore(request: createRequestCurrentData()){ response in
            
            let responseValue = String(data: response!, encoding: String.Encoding.utf8)
            
            //completionHandler(responseValue)

        }
        
        requestCore(request: createRequestTimeData()){ response in
            
            let responseValue = String(data: response!, encoding: String.Encoding.utf8)
            
            //completionHandler(responseValue)
            
            
        }
        
        requestCore(request: createRequestSpaceData()){ response in
            
            let responseValue = String(data: response!, encoding: String.Encoding.utf8)
            
            completionHandler(responseValue)
            
            
            
        }
        
    }
    
    
    
    
    
    
}
