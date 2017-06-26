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
    
    
    func testWeatherRequest(){
        
        let expt = expectation(description: "Waiting weather request..")
        
        WeatherRequester.instance.request(lat:37.433913, lng:127.1781417){ dataManager in
            
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
    

    func testAddrRequest(){
        
        let upperList = AddressMap.instance.mapList
        
        for upper in upperList{
            
            let lowerList = upper.getLowerList()
            
            for lower in lowerList{
                
                let lat = lower.getLocation().lat
                let lgt = lower.getLocation().lgt
    
                let expt = expectation(description: "Waiting addr request..")
                
                AddrRequester.instance.request(lat:lat, lgt:lgt){ response in
                    
                    guard let responseValue = response else {
                        
                        XCTAssert(false)
                        
                        return
                    }
                    
                    print("addr \(responseValue.getLower()) - \(lower.lower)")
                    
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
    }
 
    
    
    
    func testLocationRequest(){
        
        let upperList = AddressMap.instance.mapList
        
        for upper in upperList{
            
            let lowerList = upper.getLowerList()
            
            for lower in lowerList{
                
                let expt = expectation(description: "Waiting Location request..")
                
                let address = upper.getUpper() == lower.getLower() ? upper.getUpper() : upper.getUpper() + " " + lower.getLower()
                
                LocationRequester.instance.request(address:address){ response in
                    
                    guard let responseValue = response else {
                        
                        XCTAssert(false)
                        
                        return
                    }
                    
                    print("lat:\(responseValue.lat), lgt:\(responseValue.lgt)")

                    
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
    }

}
