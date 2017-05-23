//
//  AddrRequester.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 12..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class AddrRequester{
    
    static let instance = AddrRequester()
    
    
    func request(lat:Double, lgt:Double, completionHandler: @escaping (String?) -> Void) {
        
        
        requestCore(request: createRequest(lgt:lgt, lat:lat)){ response in
            
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
    
    
    
    func extract(data:Data) -> String? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            
            return nil
        }
        
        print(json!)
        
        guard let name = json?["name1"] as? String else  {
            
            return nil
        }
        
        return name
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
    
    
    func createRequest(lgt:Double, lat:Double) -> URLRequest{
        
        let url:String = String("https://apis.daum.net/local/geo/coord2addr").appending("?apikey=").appending(GlobalConfig.instance.getAddrServiceKey()).appending("&longitude=").appending(String(lgt)).appending("&latitude=").appending(String(lat)).appending("&inputCoordSystem=").appending("WGS84").appending("&output=").appending("json")
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    
}
