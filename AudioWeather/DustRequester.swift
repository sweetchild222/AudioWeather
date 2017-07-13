//
//  DustRequester.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class DustRequester: NSObject, XMLParserDelegate {
    
    
    enum Grade{
        case unknown, good, normal, bad, worst
    }
    
    static let instance = DustRequester()
    
    let informGradeKey = "informGrade"
    let informDataKey = "informData"
    let informCodeKey = "informCode"
    var informGradeFlag:Bool = false
    var informDataFlag:Bool = false
    var informCodeFlag:Bool = false

    var gradeTemp:String = ""
    var gradeLast:String = ""
    
    var codeTemp:String = ""
    var codeLast:String = ""
    
    var dataTemp:String = ""
    
    var dustDict:Dictionary = [String: [String: Grade]]()
    
    override init(){
        super.init()
        
    }
    
    
    func currentDate() -> String {
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        return dateFormatter.string(from:date)
    }
    
    
    func createRequest() -> URLRequest{
        
        let url:String = String("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMinuDustFrcstDspth").appending("?searchDate=").appending(currentDate()).appending("&ServiceKey=").appending(GlobalConfig.instance.getDustServiceKey())
        
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 3
        
        return request
    }
    
    
    
    public func request(completionHandler: @escaping ([String: [String: Grade]]?) -> Void) {
        
        let request = createRequest()
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription as Any)
                completionHandler(nil)
                return
            }
            
            guard let dataValue = data, dataValue.count != 0 else {
    
                completionHandler(nil)
                return
            }
            
            
            self.dustDict.removeAll()
            
            let parser = XMLParser(data:dataValue)
            parser.delegate = self
            
            if !parser.parse(){
                
                completionHandler(nil)
                return
            }
            else{
    
                if self.dustDict.isEmpty{
                    
                    completionHandler(nil)
                    return
                }
                
                
                completionHandler(self.dustDict)
                return
            
            }
        }
        
        task.resume()
        
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        
        if elementName == self.informGradeKey {
            self.informGradeFlag = true
        }
        
        if elementName == self.informDataKey{
            self.informDataFlag = true
        }
        
        if elementName == self.informCodeKey{
            self.informCodeFlag = true
        }
    }
    
    
    
    func stringToEnum(grade:String) -> Grade{
    
        switch grade{

            case "좋음":
                return .good

            case "보통":
                return .normal

            case "나쁨":
                return .bad

            case "매우나쁨":
                return .worst
            
            default:
                return .unknown
        }
        
    }
    
    func parseGrade(grade: String) -> [String: Grade] {
        
        var gradeDict:Dictionary = [String: Grade]()
        
        let gradeList : [String] = grade.components(separatedBy: ",")
        
        for value in gradeList {
            
            
            let localGrade : [String] = value.components(separatedBy: ":")
            
            if localGrade.count == 2 {
                
                gradeDict[localGrade[0].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)] = stringToEnum(grade: localGrade[1].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
            }
        }
        
        return gradeDict
        
    }
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == self.informGradeKey {
            self.informGradeFlag = false
            
            self.gradeLast = self.gradeTemp
            self.gradeTemp.removeAll()
        }
        
        if elementName == self.informCodeKey{
            self.informCodeFlag = false
            
            self.codeLast = self.codeTemp
            self.codeTemp.removeAll()
        }

        
        if elementName == self.informDataKey{
            
            self.informDataFlag = false
        
            if  (self.codeLast == "PM10" || self.codeLast == "PM25") && self.dataTemp == currentDate() {
            
                if (self.dustDict[codeLast]  == nil){
                    
                    self.dustDict[codeLast] = parseGrade(grade:self.gradeLast)
                    
                }
                
            }
            
            self.dataTemp.removeAll()
        }
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.informGradeFlag {
            
            self.gradeTemp = self.gradeTemp + string
        }
        
        if self.informDataFlag {

            self.dataTemp = self.dataTemp + string
        }
        
        
        if self.informCodeFlag {
            
            self.codeTemp = self.codeTemp + string
        }

    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("error!!!!")
        
    }

}

