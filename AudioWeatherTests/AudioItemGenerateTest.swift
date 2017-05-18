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
    
    
    
    func testItemSetHead(){
        
        let list = ItemListGenerator.instance.generateHead()
        
        if list.count != 6 {
            
            XCTAssert(false)
        }
        
        
        printItemList(list:list)
    }
    
    
    func testItemSetTail(){
        
        let list = ItemListGenerator.instance.generateTail()
        
        if list.count != 4 {
            
            XCTAssert(false)
        }
        
        printItemList(list:list)

    }
    
    
    func testItemSetLocation(){
        
        let list = ItemListGenerator.instance.generateLocation(name1: "경기도", name2: "성남시 분당구")
        
        if list.count != 2 {
            
            XCTAssert(false)
        }
        
        printItemList(list:list)

    }
    
    
    func testItemSetDust(){
        
        let dustList:[String: [String: DustRequester.Grade]] = ["PM25": ["울산": AudioWeather.DustRequester.Grade.normal, "전북": AudioWeather.DustRequester.Grade.normal, "경남": AudioWeather.DustRequester.Grade.normal, "세종": AudioWeather.DustRequester.Grade.normal, "인천": AudioWeather.DustRequester.Grade.normal, "영동": AudioWeather.DustRequester.Grade.normal, "제주": AudioWeather.DustRequester.Grade.normal, "경기북부": AudioWeather.DustRequester.Grade.normal, "충남": AudioWeather.DustRequester.Grade.normal, "광주": AudioWeather.DustRequester.Grade.normal, "대구": AudioWeather.DustRequester.Grade.normal, "대전": AudioWeather.DustRequester.Grade.normal, "부산": AudioWeather.DustRequester.Grade.normal, "전남": AudioWeather.DustRequester.Grade.normal, "영서": AudioWeather.DustRequester.Grade.normal, "충북": AudioWeather.DustRequester.Grade.normal, "경기남부": AudioWeather.DustRequester.Grade.worst, "경북": AudioWeather.DustRequester.Grade.normal, "서울": AudioWeather.DustRequester.Grade.normal], "PM10": ["울산": AudioWeather.DustRequester.Grade.normal, "전북": AudioWeather.DustRequester.Grade.normal, "경남": AudioWeather.DustRequester.Grade.normal, "세종": AudioWeather.DustRequester.Grade.normal, "인천": AudioWeather.DustRequester.Grade.normal, "영동": AudioWeather.DustRequester.Grade.normal, "제주": AudioWeather.DustRequester.Grade.normal, "경기북부": AudioWeather.DustRequester.Grade.normal, "충남": AudioWeather.DustRequester.Grade.normal, "광주": AudioWeather.DustRequester.Grade.normal, "대구": AudioWeather.DustRequester.Grade.normal, "대전": AudioWeather.DustRequester.Grade.normal, "부산": AudioWeather.DustRequester.Grade.normal, "전남": AudioWeather.DustRequester.Grade.normal, "영서": AudioWeather.DustRequester.Grade.normal, "충북": AudioWeather.DustRequester.Grade.normal, "경기남부": AudioWeather.DustRequester.Grade.bad, "경북": AudioWeather.DustRequester.Grade.normal, "서울": AudioWeather.DustRequester.Grade.normal]]
        
        
        let list = ItemListGenerator.instance.generateDust(name1: "경기도", name2: "성남시 분당구", dustList:dustList)
        
        if list.count != 2 {
            
            XCTAssert(false)
        }
        
        printItemList(list:list)
        
        let listsecond = ItemListGenerator.instance.generateDust(name1: "서울특별시", name2: "중구", dustList:dustList)
        
        if listsecond.count != 1 {
            
            XCTAssert(false)
        }
        
        printItemList(list:listsecond)


    }

}