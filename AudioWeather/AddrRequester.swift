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
    
    
    func request(lat:Double, lgt:Double, completionHandler: @escaping (Address?) -> Void) {
        
        requestCore(request: createRequest(lat:lat, lgt:lgt)){ response in
            
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
    
        
    
    func extract(data:Data) -> Address? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            
            return nil
        }
        
        
        guard let values = (json?["result"] as? [String:Any])?["items"] as? [[String:Any]] else{
            
            return nil
        }
        
        
        for value in values{
            
            let isAdmAddress = value["isAdmAddress"] as! Bool
            let isRoadAddress = value["isRoadAddress"] as! Bool
            
            
            if isAdmAddress == false && isRoadAddress == false{
                
                guard let address = value["addrdetail"] as? [String:Any] else{
                    break
                }
                
                
                let sido = address["sido"] as! String
                let sigugun = address["sigugun"] as! String
                
                return Address(upper:sido, lower:sigugun)
                
            }
        }
    
        
        return nil
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
    
    
    func createRequest(lat:Double, lgt:Double) -> URLRequest{
        
        let url:String = String("https://openapi.naver.com/v1/map/reversegeocode").appending("?encoding=").appending("utf-8").appending("&coordType=").appending("latlng").appending("&query=").appending(String(lgt)).appending(",").appending(String(lat))
    
        //print(url)
        
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
