//
//  AddressMap.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 12..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class MapInfo{
    

    let area:String
    let audio:String
    
    init(area:String, audio:String){
        
        self.area = area
        self.audio = audio
    }
    
    
    func getArea() -> String{
        
        return self.area
    }

    
    func getAudio() -> String{
        
        return self.audio
    }
}


class LowerMapInfo{
    
    let mapInfo:MapInfo
    let lower:String
    
    
    init(lower:String, mapInfo:MapInfo){
        
        self.lower = lower
        self.mapInfo = mapInfo
    }
    
    func getMapInfo() ->MapInfo{
        
        return self.mapInfo
    }
    
    func getArea() -> String{
        
        return self.mapInfo.getArea()
    }
    
    
    func getAudio() -> String{
        
        return self.getAudio()
    }
    
    
    func getLower() -> String{
        
        return self.lower
    }
    
}


class UpperMapInfo{
    
    let upper:String
    let lowerList:[LowerMapInfo]
    
    
    init(upper:String, lowerList:[LowerMapInfo]){
        
        self.upper = upper;
        self.lowerList = lowerList
    }
    
    
    func getUpper() ->String{
        
        return self.upper
    }
    
    
    func getLowerList() ->[LowerMapInfo]{
        
        return self.lowerList
    }
}


class AddressMap{
    
    
    static let instance = AddressMap()
    
    let mapList:[UpperMapInfo]
    
    
    
    init(){
        
         mapList =
            [UpperMapInfo(upper:"경기도", lowerList:
                [LowerMapInfo(lower:"수원시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky1")),
                LowerMapInfo(lower:"수원시 장안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky2")),
                LowerMapInfo(lower:"수원시 권선구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky3")),
                LowerMapInfo(lower:"수원시 팔달구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky4")),
                LowerMapInfo(lower:"수원시 영통구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky5")),
                LowerMapInfo(lower:"성남시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky6")),
                LowerMapInfo(lower:"성남시 중원구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky7")),
                LowerMapInfo(lower:"성남시 수정구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky8")),
                LowerMapInfo(lower:"성남시 분당구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky9")),
                LowerMapInfo(lower:"의정부시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky10")),
                LowerMapInfo(lower:"안양시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky11")),
                LowerMapInfo(lower:"안양시 만안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky12")),
                LowerMapInfo(lower:"안양시 동안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky13")),
                LowerMapInfo(lower:"부천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky14")),
                LowerMapInfo(lower:"광명시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky15")),
                LowerMapInfo(lower:"평택시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky16")),
                LowerMapInfo(lower:"동두천시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky17")),
                LowerMapInfo(lower:"안산시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky18")),
                LowerMapInfo(lower:"안산시 상록구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky19")),
                LowerMapInfo(lower:"안산시 단원구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky20")),
                LowerMapInfo(lower:"고양시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky21")),
                LowerMapInfo(lower:"고양시 덕양구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky22")),
                LowerMapInfo(lower:"고양시 일산동구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky23")),
                LowerMapInfo(lower:"고양시 일산서구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky24")),
                LowerMapInfo(lower:"과천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky25")),
                LowerMapInfo(lower:"구리시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky26")),
                LowerMapInfo(lower:"남양주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky27")),
                LowerMapInfo(lower:"오산시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky28")),
                LowerMapInfo(lower:"시흥시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky29")),
                LowerMapInfo(lower:"군포시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky30")),
                LowerMapInfo(lower:"의왕시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky31")),
                LowerMapInfo(lower:"하남시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky32")),
                LowerMapInfo(lower:"용인시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky33")),
                LowerMapInfo(lower:"용인시 처인구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky34")),
                LowerMapInfo(lower:"용인시 기흥구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky35")),
                LowerMapInfo(lower:"용인시 수지구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky36")),
                LowerMapInfo(lower:"파주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky37")),
                LowerMapInfo(lower:"이천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky38")),
                LowerMapInfo(lower:"안성시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky39")),
                LowerMapInfo(lower:"김포시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky40")),
                LowerMapInfo(lower:"화성시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky41")),
                LowerMapInfo(lower:"광주시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky42")),
                LowerMapInfo(lower:"양주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky43")),
                LowerMapInfo(lower:"포천시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky44")),
                LowerMapInfo(lower:"여주시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky45")),
                LowerMapInfo(lower:"연천군", mapInfo:MapInfo(area:"경기북부", audio:"city_ky46")),
                LowerMapInfo(lower:"가평군", mapInfo:MapInfo(area:"경기북부", audio:"city_ky47")),
                LowerMapInfo(lower:"양평군", mapInfo:MapInfo(area:"경기남부", audio:"city_ky48"))]),
            
             UpperMapInfo(upper:"서울특별시",lowerList:
                [LowerMapInfo(lower:"종로구", mapInfo:MapInfo(area:"서울", audio:"city_se1")),
                 LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"서울", audio:"city_se2")),
                 LowerMapInfo(lower:"용산구", mapInfo:MapInfo(area:"서울", audio:"city_se3")),
                 LowerMapInfo(lower:"성동구", mapInfo:MapInfo(area:"서울", audio:"city_se4")),
                 LowerMapInfo(lower:"광진구", mapInfo:MapInfo(area:"서울", audio:"city_se5")),
                 LowerMapInfo(lower:"동대문구", mapInfo:MapInfo(area:"서울", audio:"city_se6")),
                 LowerMapInfo(lower:"중랑구", mapInfo:MapInfo(area:"서울", audio:"city_se7")),
                 LowerMapInfo(lower:"성북구", mapInfo:MapInfo(area:"서울", audio:"city_se8")),
                 LowerMapInfo(lower:"강북구", mapInfo:MapInfo(area:"서울", audio:"city_se9")),
                 LowerMapInfo(lower:"도봉구", mapInfo:MapInfo(area:"서울", audio:"city_se10")),
                 LowerMapInfo(lower:"노원구", mapInfo:MapInfo(area:"서울", audio:"city_se11")),
                 LowerMapInfo(lower:"은평구", mapInfo:MapInfo(area:"서울", audio:"city_se12")),
                 LowerMapInfo(lower:"서대문구", mapInfo:MapInfo(area:"서울", audio:"city_se13")),
                 LowerMapInfo(lower:"마포구", mapInfo:MapInfo(area:"서울", audio:"city_se14")),
                 LowerMapInfo(lower:"양천구", mapInfo:MapInfo(area:"서울", audio:"city_se15")),
                 LowerMapInfo(lower:"강서구", mapInfo:MapInfo(area:"서울", audio:"city_se16")),
                 LowerMapInfo(lower:"구로구", mapInfo:MapInfo(area:"서울", audio:"city_se17")),
                 LowerMapInfo(lower:"금천구", mapInfo:MapInfo(area:"서울", audio:"city_se18")),
                 LowerMapInfo(lower:"영등포구", mapInfo:MapInfo(area:"서울", audio:"city_se19")),
                 LowerMapInfo(lower:"동작구", mapInfo:MapInfo(area:"서울", audio:"city_se20")),
                 LowerMapInfo(lower:"관악구", mapInfo:MapInfo(area:"서울", audio:"city_se21")),
                 LowerMapInfo(lower:"서초구", mapInfo:MapInfo(area:"서울", audio:"city_se22")),
                 LowerMapInfo(lower:"강남구", mapInfo:MapInfo(area:"서울", audio:"city_se23")),
                 LowerMapInfo(lower:"송파구", mapInfo:MapInfo(area:"서울", audio:"city_se24")),
                 LowerMapInfo(lower:"강동구", mapInfo:MapInfo(area:"서울", audio:"city_se25"))]),
             
             UpperMapInfo(upper:"강원도",lowerList:
                [LowerMapInfo(lower:"춘천시", mapInfo:MapInfo(area:"영서", audio:"city_kw1")),
                 LowerMapInfo(lower:"원주시", mapInfo:MapInfo(area:"영서", audio:"city_kw2")),
                 LowerMapInfo(lower:"홍천군", mapInfo:MapInfo(area:"영서", audio:"city_kw3")),
                 LowerMapInfo(lower:"횡성군", mapInfo:MapInfo(area:"영서", audio:"city_kw4")),
                 LowerMapInfo(lower:"영월군", mapInfo:MapInfo(area:"영서", audio:"city_kw5")),
                 LowerMapInfo(lower:"평창군", mapInfo:MapInfo(area:"영서", audio:"city_kw6")),
                 LowerMapInfo(lower:"정선군", mapInfo:MapInfo(area:"영서", audio:"city_kw7")),
                 LowerMapInfo(lower:"철원군", mapInfo:MapInfo(area:"영서", audio:"city_kw8")),
                 LowerMapInfo(lower:"화천군", mapInfo:MapInfo(area:"영서", audio:"city_kw9")),
                 LowerMapInfo(lower:"양구군", mapInfo:MapInfo(area:"영서", audio:"city_kw10")),
                 LowerMapInfo(lower:"인제군", mapInfo:MapInfo(area:"영서", audio:"city_kw11")),
                 LowerMapInfo(lower:"강릉시", mapInfo:MapInfo(area:"영동", audio:"city_kw12")),
                 LowerMapInfo(lower:"동해시", mapInfo:MapInfo(area:"영동", audio:"city_kw13")),
                 LowerMapInfo(lower:"태백시", mapInfo:MapInfo(area:"영동", audio:"city_kw14")),
                 LowerMapInfo(lower:"속초시", mapInfo:MapInfo(area:"영동", audio:"city_kw15")),
                 LowerMapInfo(lower:"삼척시", mapInfo:MapInfo(area:"영동", audio:"city_kw16")),
                 LowerMapInfo(lower:"고성군", mapInfo:MapInfo(area:"영동", audio:"city_kw17")),
                 LowerMapInfo(lower:"양양군", mapInfo:MapInfo(area:"영동", audio:"city_kw18"))]),
             
             
             
             UpperMapInfo(upper:"충청남도",lowerList:
                [LowerMapInfo(lower:"천안시", mapInfo:MapInfo(area:"충남", audio:"city_cn1")),
                 LowerMapInfo(lower:"천안시 동남구", mapInfo:MapInfo(area:"충남", audio:"city_cn2")),
                 LowerMapInfo(lower:"천안시 서북구", mapInfo:MapInfo(area:"충남", audio:"city_cn3")),
                 LowerMapInfo(lower:"공주시", mapInfo:MapInfo(area:"충남", audio:"city_cn4")),
                 LowerMapInfo(lower:"보령시", mapInfo:MapInfo(area:"충남", audio:"city_cn5")),
                 LowerMapInfo(lower:"아산시", mapInfo:MapInfo(area:"충남", audio:"city_cn6")),
                 LowerMapInfo(lower:"서산시", mapInfo:MapInfo(area:"충남", audio:"city_cn7")),
                 LowerMapInfo(lower:"논산시", mapInfo:MapInfo(area:"충남", audio:"city_cn8")),
                 LowerMapInfo(lower:"계룡시", mapInfo:MapInfo(area:"충남", audio:"city_cn9")),
                 LowerMapInfo(lower:"당진시", mapInfo:MapInfo(area:"충남", audio:"city_cn10")),
                 LowerMapInfo(lower:"금산군", mapInfo:MapInfo(area:"충남", audio:"city_cn11")),
                 LowerMapInfo(lower:"부여군", mapInfo:MapInfo(area:"충남", audio:"city_cn12")),
                 LowerMapInfo(lower:"서천군", mapInfo:MapInfo(area:"충남", audio:"city_cn13")),
                 LowerMapInfo(lower:"청양군", mapInfo:MapInfo(area:"충남", audio:"city_cn14")),
                 LowerMapInfo(lower:"홍성군", mapInfo:MapInfo(area:"충남", audio:"city_cn15")),
                 LowerMapInfo(lower:"예산군", mapInfo:MapInfo(area:"충남", audio:"city_cn16")),
                 LowerMapInfo(lower:"태안군", mapInfo:MapInfo(area:"충남", audio:"city_cn17"))]),
             
             
             UpperMapInfo(upper:"충청북도",lowerList:
                [LowerMapInfo(lower:"청주시", mapInfo:MapInfo(area:"충북", audio:"city_cb1")),
                 LowerMapInfo(lower:"청주시 상당구", mapInfo:MapInfo(area:"충북", audio:"city_cb2")),
                 LowerMapInfo(lower:"청주시 서원구", mapInfo:MapInfo(area:"충북", audio:"city_cb3")),
                 LowerMapInfo(lower:"청주시 흥덕구", mapInfo:MapInfo(area:"충북", audio:"city_cb4")),
                 LowerMapInfo(lower:"청주시 청원구", mapInfo:MapInfo(area:"충북", audio:"city_cb5")),
                 LowerMapInfo(lower:"충주시", mapInfo:MapInfo(area:"충북", audio:"city_cb6")),
                 LowerMapInfo(lower:"제천시", mapInfo:MapInfo(area:"충북", audio:"city_cb7")),
                 LowerMapInfo(lower:"보은군", mapInfo:MapInfo(area:"충북", audio:"city_cb8")),
                 LowerMapInfo(lower:"옥천군", mapInfo:MapInfo(area:"충북", audio:"city_cb9")),
                 LowerMapInfo(lower:"영동군", mapInfo:MapInfo(area:"충북", audio:"city_cb10")),
                 LowerMapInfo(lower:"증평군", mapInfo:MapInfo(area:"충북", audio:"city_cb11")),
                 LowerMapInfo(lower:"진천군", mapInfo:MapInfo(area:"충북", audio:"city_cb12")),
                 LowerMapInfo(lower:"괴산군", mapInfo:MapInfo(area:"충북", audio:"city_cb13")),
                 LowerMapInfo(lower:"음성군", mapInfo:MapInfo(area:"충북", audio:"city_cb14")),
                LowerMapInfo(lower:"단양군", mapInfo:MapInfo(area:"충북", audio:"city_cb15"))]),
             
             
             UpperMapInfo(upper:"전라북도",lowerList:
                [LowerMapInfo(lower:"전주시", mapInfo:MapInfo(area:"전북", audio:"city_jb1")),
                 LowerMapInfo(lower:"전주시 완산구", mapInfo:MapInfo(area:"전북", audio:"city_jb2")),
                 LowerMapInfo(lower:"전주시 덕진구", mapInfo:MapInfo(area:"전북", audio:"city_jb3")),
                 LowerMapInfo(lower:"군산시", mapInfo:MapInfo(area:"전북", audio:"city_jb4")),
                 LowerMapInfo(lower:"익산시", mapInfo:MapInfo(area:"전북", audio:"city_jb5")),
                 LowerMapInfo(lower:"정읍시", mapInfo:MapInfo(area:"전북", audio:"city_jb6")),
                 LowerMapInfo(lower:"남원시", mapInfo:MapInfo(area:"전북", audio:"city_jb7")),
                 LowerMapInfo(lower:"김제시", mapInfo:MapInfo(area:"전북", audio:"city_jb8")),
                 LowerMapInfo(lower:"완주군", mapInfo:MapInfo(area:"전북", audio:"city_jb9")),
                 LowerMapInfo(lower:"진안군", mapInfo:MapInfo(area:"전북", audio:"city_jb10")),
                 LowerMapInfo(lower:"무주군", mapInfo:MapInfo(area:"전북", audio:"city_jb11")),
                 LowerMapInfo(lower:"장수군", mapInfo:MapInfo(area:"전북", audio:"city_jb12")),
                 LowerMapInfo(lower:"임실군", mapInfo:MapInfo(area:"전북", audio:"city_jb13")),
                 LowerMapInfo(lower:"순창군", mapInfo:MapInfo(area:"전북", audio:"city_jb14")),
                 LowerMapInfo(lower:"고창군", mapInfo:MapInfo(area:"전북", audio:"city_jb15")),
                 LowerMapInfo(lower:"부안군", mapInfo:MapInfo(area:"전북", audio:"city_jb16"))]),
             
             
             UpperMapInfo(upper:"전라남도",lowerList:
                [LowerMapInfo(lower:"목포시", mapInfo:MapInfo(area:"전남", audio:"city_jn1")),
                 LowerMapInfo(lower:"여수시", mapInfo:MapInfo(area:"전남", audio:"city_jn2")),
                 LowerMapInfo(lower:"순천시", mapInfo:MapInfo(area:"전남", audio:"city_jn3")),
                 LowerMapInfo(lower:"나주시", mapInfo:MapInfo(area:"전남", audio:"city_jn4")),
                 LowerMapInfo(lower:"광양시", mapInfo:MapInfo(area:"전남", audio:"city_jn5")),
                 LowerMapInfo(lower:"담양군", mapInfo:MapInfo(area:"전남", audio:"city_jn6")),
                 LowerMapInfo(lower:"곡성군", mapInfo:MapInfo(area:"전남", audio:"city_jn7")),
                 LowerMapInfo(lower:"구례군", mapInfo:MapInfo(area:"전남", audio:"city_jn8")),
                 LowerMapInfo(lower:"고흥군", mapInfo:MapInfo(area:"전남", audio:"city_jn9")),
                 LowerMapInfo(lower:"보성군", mapInfo:MapInfo(area:"전남", audio:"city_jn10")),
                 LowerMapInfo(lower:"화순군", mapInfo:MapInfo(area:"전남", audio:"city_jn11")),
                 LowerMapInfo(lower:"장흥군", mapInfo:MapInfo(area:"전남", audio:"city_jn12")),
                 LowerMapInfo(lower:"강진군", mapInfo:MapInfo(area:"전남", audio:"city_jn13")),
                 LowerMapInfo(lower:"해남군", mapInfo:MapInfo(area:"전남", audio:"city_jn14")),
                 LowerMapInfo(lower:"영암군", mapInfo:MapInfo(area:"전남", audio:"city_jn15")),
                 LowerMapInfo(lower:"무안군", mapInfo:MapInfo(area:"전남", audio:"city_jn16")),
                 LowerMapInfo(lower:"함평군", mapInfo:MapInfo(area:"전남", audio:"city_jn17")),
                 LowerMapInfo(lower:"영광군", mapInfo:MapInfo(area:"전남", audio:"city_jn18")),
                 LowerMapInfo(lower:"장성군", mapInfo:MapInfo(area:"전남", audio:"city_jn19")),
                 LowerMapInfo(lower:"완도군", mapInfo:MapInfo(area:"전남", audio:"city_jn20")),
                 LowerMapInfo(lower:"진도군", mapInfo:MapInfo(area:"전남", audio:"city_jn21")),
                 LowerMapInfo(lower:"신안군", mapInfo:MapInfo(area:"전남", audio:"city_jn22"))]),
             
             
             
             UpperMapInfo(upper:"경상남도",lowerList:
                [LowerMapInfo(lower:"창원시", mapInfo:MapInfo(area:"경남", audio:"city_kn1")),
                 LowerMapInfo(lower:"창원시 의창구", mapInfo:MapInfo(area:"경남", audio:"city_kn2")),
                 LowerMapInfo(lower:"창원시 성산구", mapInfo:MapInfo(area:"경남", audio:"city_kn3")),
                 LowerMapInfo(lower:"창원시 마산합포구", mapInfo:MapInfo(area:"경남", audio:"city_kn4")),
                 LowerMapInfo(lower:"창원시 마산회원구", mapInfo:MapInfo(area:"경남", audio:"city_kn5")),
                 LowerMapInfo(lower:"창원시 진해구", mapInfo:MapInfo(area:"경남", audio:"city_kn6")),
                 LowerMapInfo(lower:"진주시", mapInfo:MapInfo(area:"경남", audio:"city_kn7")),
                 LowerMapInfo(lower:"통영시", mapInfo:MapInfo(area:"경남", audio:"city_kn8")),
                 LowerMapInfo(lower:"사천시", mapInfo:MapInfo(area:"경남", audio:"city_kn9")),
                 LowerMapInfo(lower:"김해시", mapInfo:MapInfo(area:"경남", audio:"city_kn10")),
                 LowerMapInfo(lower:"밀양시", mapInfo:MapInfo(area:"경남", audio:"city_kn11")),
                 LowerMapInfo(lower:"거제시", mapInfo:MapInfo(area:"경남", audio:"city_kn12")),
                 LowerMapInfo(lower:"양산시", mapInfo:MapInfo(area:"경남", audio:"city_kn13")),
                 LowerMapInfo(lower:"의령군", mapInfo:MapInfo(area:"경남", audio:"city_kn14")),
                 LowerMapInfo(lower:"함안군", mapInfo:MapInfo(area:"경남", audio:"city_kn15")),
                 LowerMapInfo(lower:"창녕군", mapInfo:MapInfo(area:"경남", audio:"city_kn16")),
                 LowerMapInfo(lower:"고성군", mapInfo:MapInfo(area:"경남", audio:"city_kn17")),
                 LowerMapInfo(lower:"남해군", mapInfo:MapInfo(area:"경남", audio:"city_kn18")),
                 LowerMapInfo(lower:"하동군", mapInfo:MapInfo(area:"경남", audio:"city_kn19")),
                 LowerMapInfo(lower:"산청군", mapInfo:MapInfo(area:"경남", audio:"city_kn20")),
                 LowerMapInfo(lower:"함양군", mapInfo:MapInfo(area:"경남", audio:"city_kn21")),
                 LowerMapInfo(lower:"거창군", mapInfo:MapInfo(area:"경남", audio:"city_kn22")),
                 LowerMapInfo(lower:"합천군", mapInfo:MapInfo(area:"경남", audio:"city_kn23"))]),
             
             
             
             UpperMapInfo(upper:"경상북도",lowerList:
                [LowerMapInfo(lower:"포항시", mapInfo:MapInfo(area:"경북", audio:"city_kb1")),
                 LowerMapInfo(lower:"포항시 남구", mapInfo:MapInfo(area:"경북", audio:"city_kb2")),
                 LowerMapInfo(lower:"포항시 북구", mapInfo:MapInfo(area:"경북", audio:"city_kb3")),
                 LowerMapInfo(lower:"경주시", mapInfo:MapInfo(area:"경북", audio:"city_kb4")),
                 LowerMapInfo(lower:"김천시", mapInfo:MapInfo(area:"경북", audio:"city_kb5")),
                 LowerMapInfo(lower:"안동시", mapInfo:MapInfo(area:"경북", audio:"city_kb6")),
                 LowerMapInfo(lower:"구미시", mapInfo:MapInfo(area:"경북", audio:"city_kb7")),
                 LowerMapInfo(lower:"영주시", mapInfo:MapInfo(area:"경북", audio:"city_kb8")),
                 LowerMapInfo(lower:"영천시", mapInfo:MapInfo(area:"경북", audio:"city_kb9")),
                 LowerMapInfo(lower:"상주시", mapInfo:MapInfo(area:"경북", audio:"city_kb10")),
                 LowerMapInfo(lower:"문경시", mapInfo:MapInfo(area:"경북", audio:"city_kb11")),
                 LowerMapInfo(lower:"경산시", mapInfo:MapInfo(area:"경북", audio:"city_kb12")),
                 LowerMapInfo(lower:"군위군", mapInfo:MapInfo(area:"경북", audio:"city_kb13")),
                 LowerMapInfo(lower:"의성군", mapInfo:MapInfo(area:"경북", audio:"city_kb14")),
                 LowerMapInfo(lower:"청송군", mapInfo:MapInfo(area:"경북", audio:"city_kb15")),
                 LowerMapInfo(lower:"영양군", mapInfo:MapInfo(area:"경북", audio:"city_kb16")),
                 LowerMapInfo(lower:"영덕군", mapInfo:MapInfo(area:"경북", audio:"city_kb17")),
                 LowerMapInfo(lower:"청도군", mapInfo:MapInfo(area:"경북", audio:"city_kb18")),
                 LowerMapInfo(lower:"고령군", mapInfo:MapInfo(area:"경북", audio:"city_kb19")),
                 LowerMapInfo(lower:"성주군", mapInfo:MapInfo(area:"경북", audio:"city_kb20")),
                 LowerMapInfo(lower:"칠곡군", mapInfo:MapInfo(area:"경북", audio:"city_kb21")),
                 LowerMapInfo(lower:"예천군", mapInfo:MapInfo(area:"경북", audio:"city_kb22")),
                 LowerMapInfo(lower:"봉화군", mapInfo:MapInfo(area:"경북", audio:"city_kb23")),
                 LowerMapInfo(lower:"울진군", mapInfo:MapInfo(area:"경북", audio:"city_kb24")),
                 LowerMapInfo(lower:"울릉군", mapInfo:MapInfo(area:"경북", audio:"city_kb25"))]),
             
             
             
             UpperMapInfo(upper:"부산광역시",lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"부산", audio:"city_pu1")),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"부산", audio:"city_pu2")),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"부산", audio:"city_pu3")),
                 LowerMapInfo(lower:"영도구", mapInfo:MapInfo(area:"부산", audio:"city_pu4")),
                 LowerMapInfo(lower:"부산진구", mapInfo:MapInfo(area:"부산", audio:"city_pu5")),
                 LowerMapInfo(lower:"동래구", mapInfo:MapInfo(area:"부산", audio:"city_pu6")),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"부산", audio:"city_pu7")),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"부산", audio:"city_pu8")),
                 LowerMapInfo(lower:"해운대구", mapInfo:MapInfo(area:"부산", audio:"city_pu9")),
                 LowerMapInfo(lower:"사하구", mapInfo:MapInfo(area:"부산", audio:"city_pu10")),
                 LowerMapInfo(lower:"금정구", mapInfo:MapInfo(area:"부산", audio:"city_pu11")),
                 LowerMapInfo(lower:"강서구", mapInfo:MapInfo(area:"부산", audio:"city_pu12")),
                 LowerMapInfo(lower:"연제구", mapInfo:MapInfo(area:"부산", audio:"city_pu13")),
                 LowerMapInfo(lower:"수영구", mapInfo:MapInfo(area:"부산", audio:"city_pu14")),
                 LowerMapInfo(lower:"사상구", mapInfo:MapInfo(area:"부산", audio:"city_pu15")),
                 LowerMapInfo(lower:"기장군", mapInfo:MapInfo(area:"부산", audio:"city_pu16"))]),
             
             UpperMapInfo(upper:"울산광역시",lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"울산", audio:"city_ul1")),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"울산", audio:"city_ul2")),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"울산", audio:"city_ul3")),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"울산", audio:"city_ul4")),
                 LowerMapInfo(lower:"울주군", mapInfo:MapInfo(area:"울산", audio:"city_ul5"))]),
                

             UpperMapInfo(upper:"대구광역시",lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"대구", audio:"city_tk1")),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"대구", audio:"city_tk2")),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"대구", audio:"city_tk3")),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"대구", audio:"city_tk4")),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"대구", audio:"city_tk5")),
                 LowerMapInfo(lower:"수성구", mapInfo:MapInfo(area:"대구", audio:"city_tk6")),
                 LowerMapInfo(lower:"달서구", mapInfo:MapInfo(area:"대구", audio:"city_tk7")),
                 LowerMapInfo(lower:"달성군", mapInfo:MapInfo(area:"대구", audio:"city_tk8"))]),
    
             
             UpperMapInfo(upper:"대전광역시",lowerList:
                [LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"대전", audio:"city_dj1")),
                 LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"대전", audio:"city_dj2")),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"대전", audio:"city_dj3")),
                 LowerMapInfo(lower:"유성구", mapInfo:MapInfo(area:"대전", audio:"city_dj4")),
                 LowerMapInfo(lower:"대덕구", mapInfo:MapInfo(area:"대전", audio:"city_dj5"))]),
             
        
             UpperMapInfo(upper:"광주광역시",lowerList:
                [LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"광주", audio:"city_kj1")),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"광주", audio:"city_kj2")),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"광주", audio:"city_kj3")),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"광주", audio:"city_kj4")),
                 LowerMapInfo(lower:"광산구", mapInfo:MapInfo(area:"광주", audio:"city_kj5"))]),
             
             UpperMapInfo(upper:"세종특별자치시",lowerList:
                [LowerMapInfo(lower:"세종특별자치시", mapInfo:MapInfo(area:"세종", audio:"city_sj1"))]),
             
             UpperMapInfo(upper:"인천광역시",lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"인천", audio:"city_ic1")),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"인천", audio:"city_ic2")),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"인천", audio:"city_ic3")),
                 LowerMapInfo(lower:"연수구", mapInfo:MapInfo(area:"인천", audio:"city_ic4")),
                 LowerMapInfo(lower:"남동구", mapInfo:MapInfo(area:"인천", audio:"city_ic5")),
                 LowerMapInfo(lower:"부평구", mapInfo:MapInfo(area:"인천", audio:"city_ic6")),
                 LowerMapInfo(lower:"계양구", mapInfo:MapInfo(area:"인천", audio:"city_ic7")),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"인천", audio:"city_ic8")),
                 LowerMapInfo(lower:"강화군", mapInfo:MapInfo(area:"인천", audio:"city_ic9")),
                 LowerMapInfo(lower:"옹진군", mapInfo:MapInfo(area:"인천", audio:"city_ic10"))]),
             
             UpperMapInfo(upper:"제주특별자치도",lowerList:
                [LowerMapInfo(lower:"제주시", mapInfo:MapInfo(area:"제주", audio:"city_je1")),
                 LowerMapInfo(lower:"서귀포시", mapInfo:MapInfo(area:"제주", audio:"city_je2"))])
             
        ]
    }
    
    
    func getMapInfo(addr:Address) -> MapInfo? {
        
        for upperMapInfo in mapList{
            
            if upperMapInfo.getUpper() == addr.getUpper(){
                
                let lowerList = upperMapInfo.getLowerList()
                
                for lowerMapInfo in lowerList{
                    
                    
                    if lowerMapInfo.getLower() == addr.getLower(){
                        
                        return lowerMapInfo.getMapInfo()
                    }
                }
            }
        }
        
        return nil
    }
}
