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
        
        let expt = expectation(description: "Waiting addr request..")
        
        AddrRequester.instance.request(lat:37.388917, lgt:127.1358561){ response in

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
        
        WeatherRequester.instance.request(){ dataManager in
            
            dataManager!.printData()
            
            expt.fulfill()
        }
        
        waitForExpectations(timeout: 5.0){ error in
            
            guard error == nil else {
                
                XCTAssert(false)
                return
            }
        }
 
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
