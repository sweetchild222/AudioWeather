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
        
        let serviceKey = GlobalConfig.instance.getDustServiceKey()
        
        if serviceKey.isEmpty == true {
            XCTAssert(false)
        }
    }
    
    
    func testWeatherRequest(){
        
        let expt = expectation(description: "Waiting weather request..")
        
        WeatherRequester.instance.request(){ response in
            
            guard let responseValue = response, response?.isEmpty == false else {
                
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
    
    
    /*
    func testDustRequest(){
        
        let expt = expectation(description: "Waiting dust request..")
        
        DustRequester.instance.request(){ response in
            
            guard let responseValue = response, response?.isEmpty == false else {
                
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
