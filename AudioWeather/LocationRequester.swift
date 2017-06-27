//
//  MapRequester.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 12..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class LocationRequester{
    
    static let instance = LocationRequester()
    
    
    func request(address:String, completionHandler: @escaping (Location?) -> Void) {
        
        requestCore(request: createRequest(address:address)){ response in
            
            guard let responseValue = response, responseValue.count > 0 else {
                
                completionHandler(nil)
                
                return
            }
            
            
            guard let value = self.extract(data:responseValue) else{
                
                completionHandler(nil)
                
                return
            }
            
            
            completionHandler(value)
        }
        
    }
    
    
    
    func extract(data:Data) -> Location? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            
            return nil
        }
        
        
        guard let values = ((json?["result"] as? [String:Any])?["items"] as? [[String:Any]])?[0]["point"] as? [String:Any] else{
            
            return nil
        }
        
        let lgt = values["x"] as! Double
        let lat = values["y"] as! Double
        
        return Location(lat:lat, lgt:lgt)
    }
    
    
    
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
    
    
    func createRequest(address:String) -> URLRequest{
        
        let value = address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let url:String = String("https://openapi.naver.com/v1/map/geocode")!.appending("?encoding=").appending("utf-8").appending("&coordType=").appending("latlng").appending("&query=").appending(value!)
        
        var request = URLRequest(url: URL(string:url)!)
        
        request.httpMethod = "GET"
        
        request.setValue("openapi.naver.com", forHTTPHeaderField: "Host")
        request.setValue("curl/7.43.0", forHTTPHeaderField: "User-Agent")
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(GlobalConfig.instance.getNaverAPIID(), forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(GlobalConfig.instance.getNaverAPISecret(), forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return request
    }
    
}
