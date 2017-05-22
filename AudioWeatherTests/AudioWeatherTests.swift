//
//  AudioWeatherTests.swift
//  AudioWeatherTests
//
//  Created by 최인국 on 2017. 5. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import XCTest
@testable import AudioWeather

class AudioWeatherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    
    override func tearDown() {

        super.tearDown()
    }
    

    
    func testAddrRequest(){
        
        
        //37.8977925,127.4104595
        
        let expt = expectation(description: "Waiting addr request..")
        
        //33.3655319,126.5881372
        
        //37.8102898,127.4576087
        
        
        //37.70314,127.2540612
        
        
        AddrRequester.instance.request(37.388917,127.1358561){ response in

            guard let responseValue = response, responseValue.isEmpty == false else {
                
                XCTAssert(false)
    
                return
            }
            
            print(responseValue)
            
            
            expt.fulfill()
        }

        
        waitForExpectations(timeout: 5.0){ error in
            
            guard error == nil else {
                
                XCTAssert(false)
                return
            }
        }
    }
    

    
    
    func testWeatherRequest(){
        
        let expt = expectation(description: "Waiting weather request..")
        
        WeatherRequester.instance.request(){ currentData, timeData, spaceData in
            
            //print(spaceData!.count())
            //print(currentData!)
            //print(timeData!)
            
            
            let list = ItemListGenerator.instance.generateSky(weatherData:currentData!, weatherDataTimeList:timeData!, weatherDataSpaceList: spaceData!)
            
            if list.count != 3 {
                
                //XCTAssert(false)
            }
            
            self.printItemList(list:list)

            
            expt.fulfill()
        }
        
        waitForExpectations(timeout: 5.0){ error in
            
            guard error == nil else {
                
                XCTAssert(false)
                return
            }
        }
 
    }
 
    
    func printItemList(list:[Item]){
        
        for item in list{
            
            print(item.getText(), terminator:"")
        }
        
        print("")
        
        for item in list{
            
            print(item.getAudio() + " ", terminator:"")
        }
        
        print("")
        
    }
    
    
    
    func testDustRequest(){
        
        let expt = expectation(description: "Waiting dust request..")
        
        DustRequester.instance.request(){ response in
            
            guard let responseValue = response, responseValue.isEmpty == false else {
                
                XCTAssert(false)
                return
            }
            
            print(responseValue)
            
            expt.fulfill()
        }
        
        waitForExpectations(timeout: 5.0){ error in
            
            guard error == nil else {
                
                XCTAssert(false)
                return
            }
        }
        
    }

 


}
