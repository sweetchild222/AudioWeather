//
//  AudioItemGenerateTest.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 18..
//  Copyright © 2017년 최인국. All rights reserved.
//

import XCTest
@testable import AudioWeather

class AudioItemGenerateTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    
    func testAddressMap(){
        
        guard let map = AddressMap.instance.getMapInfo(name1: "경기도", name2: "성남시 분당구") else{
            
            XCTAssert(false)
            
            return
        }
        
        if map.getAudio() != "city_ky9"{
            
            XCTAssert(false)
        }
        
    }
    
    
    
    func testItemSetHead(){
        
        
        let list = ItemListGenerator.instance.generateHead()
        
        if list.count != 6 {
            
            XCTAssert(false)
        }
        
        for item in list{
            
            print(item.getText())
        }
        
        
        for item in list{
            
            print(item.getAudio())
        }
    }
    
}
