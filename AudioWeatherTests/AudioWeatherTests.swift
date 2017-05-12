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
    
    
    func testGlobalConfig() {
        
        let serviceKey = GlobalConfig.instance.getWeatherServiceKey()
        
        if serviceKey.isEmpty == true {
            XCTAssert(false)
        }
    }
    
    
    func testDFSConv(){
        

        let values = [[Double(60), Double(136), Double(37.995119577171813), Double(126.9958663037299)], [Double(97), Double(74), Double(35.101148844565955), Double(129.02478725562108)], [Double(53), Double(38), Double(33.500946412305076), Double(126.54663058817043)], [Double(43), Double(136), Double(38.00000000000003), Double(126)]]
        
        
        for value in values{
            
            let gps = DFSConv.instance.toGPS(v1: value[0], v2: value[1])
            let xy = DFSConv.instance.toXY(v1: gps[0], v2: gps[1])
            
            if gps[0] != value[2] || gps[1] != value[3]{
                XCTAssert(false)
            }
            

            if xy[0] != value[0] || xy[1] != value[1]{
                XCTAssert(false)
            }

        }
        
    }
    
    
    
    /*
    func testWeatherRequest(){
        
        let expt = expectation(description: "Waiting weather request..")
        
        WeatherRequester.instance.request(){ currentData, timeData, spaceData in
            
            print(spaceData!.count())
            print(currentData!)
            print(timeData!)
            
            expt.fulfill()
        }
        
        waitForExpectations(timeout: 5.0){ error in
            
            guard error == nil else {
                
                XCTAssert(false)
                return
            }
        }
 
    }
 */
    
    
    /*
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
     */


}
