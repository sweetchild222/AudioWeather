//
//  UtilTest.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 18..
//  Copyright © 2017년 최인국. All rights reserved.
//

import XCTest
@testable import AudioWeather

class UtilTest: XCTestCase {
    
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
            
            
            let positionXY = Position(x:value[0], y:value[1])
            let positionGPS = Position(lat:value[2], lgt:value[3])
        
            let gps = positionXY.gps
            let xy = positionGPS.xy
            
            
            if gps.lat != value[2] || gps.lgt != value[3]{
                XCTAssert(false)
            }
            
            
            if xy.x != value[0] || xy.y != value[1]{
                XCTAssert(false)
            }
            
            
        }
        
    }
    
    
    
}
