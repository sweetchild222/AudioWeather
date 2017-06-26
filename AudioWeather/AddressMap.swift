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


class Location{
    
    let lat:Double
    let lgt:Double
    
    init(lat:Double, lgt:Double){
        self.lat = lat
        self.lgt = lgt
    }
    
    

}


class LowerMapInfo{
    
    let mapInfo:MapInfo
    let lower:String
    let location:Location
    
    
    init(lower:String, mapInfo:MapInfo, location:Location){
        
        self.lower = lower
        self.mapInfo = mapInfo
        self.location = location
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
    
    
    func getLocation() -> Location{
        
        return self.location
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
    
    let current = "현재 위치"
    
    
    init(){
        
         mapList =
            [UpperMapInfo(upper:"서울특별시", lowerList:
                [LowerMapInfo(lower:"종로구", mapInfo:MapInfo(area:"서울", audio:"city_se1"), location:Location(lat:37.6009094, lgt:126.9660293)),
                 LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"서울", audio:"city_se2"), location:Location(lat:37.5576734, lgt:126.9766129)),
                 LowerMapInfo(lower:"용산구", mapInfo:MapInfo(area:"서울", audio:"city_se3"), location:Location(lat:37.5305195, lgt:126.9634147)),  //37.5305195,126.9634147
                    LowerMapInfo(lower:"성동구", mapInfo:MapInfo(area:"서울", audio:"city_se4"), location:Location(lat:37.5508755, lgt:127.0233427)),  //37.5508755,127.0233427
                 LowerMapInfo(lower:"광진구", mapInfo:MapInfo(area:"서울", audio:"city_se5"), location:Location(lat:37.5462703, lgt:127.0683181)),  //37.5462703,127.0683181
                 LowerMapInfo(lower:"동대문구", mapInfo:MapInfo(area:"서울", audio:"city_se6"), location:Location(lat:37.5835742, lgt:127.0330003)), //37.5835742,127.0330003
                 LowerMapInfo(lower:"중랑구", mapInfo:MapInfo(area:"서울", audio:"city_se7"), location:Location(lat:37.5950484, lgt:127.0781537)),  //37.5950484,127.0781537
                 LowerMapInfo(lower:"성북구", mapInfo:MapInfo(area:"서울", audio:"city_se8"), location:Location(lat:37.6023243, lgt:126.9901306)),  //37.6023243,126.9901306
                    LowerMapInfo(lower:"강북구", mapInfo:MapInfo(area:"서울", audio:"city_se9"), location:Location(lat:37.6482172, lgt:127.0126882)),  //37.6482078,126.9813014
                    LowerMapInfo(lower:"도봉구", mapInfo:MapInfo(area:"서울", audio:"city_se10"), location:Location(lat:37.6749326, lgt:127.0404903)), //37.6662273,126.9947671
                    LowerMapInfo(lower:"노원구", mapInfo:MapInfo(area:"서울", audio:"city_se11"), location:Location(lat:37.6583162, lgt:127.0696824)), //37.6541904,127.0418638
                 LowerMapInfo(lower:"은평구", mapInfo:MapInfo(area:"서울", audio:"city_se12"), location:Location(lat:37.6209353, lgt:126.9298879)), //37.6174899,126.8547044
                    LowerMapInfo(lower:"서대문구", mapInfo:MapInfo(area:"서울", audio:"city_se13"), location:Location(lat:37.5747944,lgt:126.9327811)),//37.5833068,126.9005547
                 LowerMapInfo(lower:"마포구", mapInfo:MapInfo(area:"서울", audio:"city_se14"), location:Location(lat:37.5615911, lgt:126.8735376)), //37.5615911,126.8735376
                    LowerMapInfo(lower:"양천구", mapInfo:MapInfo(area:"서울", audio:"city_se15"), location:Location(lat:37.5362311, lgt:126.8279545)), //37.5274268,126.820773
                 LowerMapInfo(lower:"강서구", mapInfo:MapInfo(area:"서울", audio:"city_se16"), location:Location(lat:37.5672838, lgt:126.7883052)), //37.5672838,126.7883052
                 LowerMapInfo(lower:"구로구", mapInfo:MapInfo(area:"서울", audio:"city_se17"), location:Location(lat:37.4957599, lgt:126.8227643)), //37.4957599,126.8227643
                    LowerMapInfo(lower:"금천구", mapInfo:MapInfo(area:"서울", audio:"city_se18"), location:Location(lat:37.4741236, lgt:126.883709)), //37.4599845,126.8661611
                    LowerMapInfo(lower:"영등포구", mapInfo:MapInfo(area:"서울", audio:"city_se19"), location:Location(lat:37.5240681, lgt:126.9067776)),//37.520829,126.8782207
                    LowerMapInfo(lower:"동작구", mapInfo:MapInfo(area:"서울", audio:"city_se20"), location:Location(lat:37.5024912, lgt:126.940212)), //37.4971068,126.9092725
                    LowerMapInfo(lower:"관악구", mapInfo:MapInfo(area:"서울", audio:"city_se21"), location:Location(lat:37.4836233, lgt:126.9376684)), //37.4654477,126.9091424
                    LowerMapInfo(lower:"서초구", mapInfo:MapInfo(area:"서울", audio:"city_se22"), location:Location(lat:37.5037704, lgt:127.0117366)), //37.4760052,126.9669898
                 LowerMapInfo(lower:"강남구", mapInfo:MapInfo(area:"서울", audio:"city_se23"), location:Location(lat:37.4968436, lgt:127.032834)), //37.4968436,127.032834
                 LowerMapInfo(lower:"송파구", mapInfo:MapInfo(area:"서울", audio:"city_se24"), location:Location(lat:37.5047358, lgt:127.0793595)), //37.5047358,127.0793595
                    LowerMapInfo(lower:"강동구", mapInfo:MapInfo(area:"서울", audio:"city_se25"), location:Location(lat:37.5623723, lgt:127.14947))]),   //37.5492942,127.111322
             /*
            UpperMapInfo(upper:"인천광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"인천", audio:"city_ic1"), location:Location(lat:37.4497701, lgt:126.3554499)),   //37.4497701,126.3554499
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"인천", audio:"city_ic2"), location:Location(lat:37.4839099, lgt:126.6185878)),   //37.4839099,126.6185878
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"인천", audio:"city_ic3"), location:Location(lat:37.4569323, lgt:126.6307623)),   //37.4569323,126.6307623
                 LowerMapInfo(lower:"연수구", mapInfo:MapInfo(area:"인천", audio:"city_ic4"), location:Location(lat:37.3819159, lgt:126.5570843)),  //37.3819159,126.5570843
                 LowerMapInfo(lower:"남동구", mapInfo:MapInfo(area:"인천", audio:"city_ic5"), location:Location(lat:37.4238363, lgt:126.6542135)),  //37.4238363,126.6542135
                 LowerMapInfo(lower:"부평구", mapInfo:MapInfo(area:"인천", audio:"city_ic6"), location:Location(lat:37.4946281, lgt:126.6915222)),  //37.4946281,126.6915222
                 LowerMapInfo(lower:"계양구", mapInfo:MapInfo(area:"인천", audio:"city_ic7"), location:Location(lat:37.5576712, lgt:126.7018147)),  //37.5576712,126.7018147
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"인천", audio:"city_ic8"), location:Location(lat:37.5550399, lgt:126.4886293)),   //37.5550399,126.4886293
                 LowerMapInfo(lower:"강화군", mapInfo:MapInfo(area:"인천", audio:"city_ic9"), location:Location(lat:37.7048823, lgt:126.1080774)),  //37.7048823,126.1080774
                 LowerMapInfo(lower:"옹진군", mapInfo:MapInfo(area:"인천", audio:"city_ic10"), location:Location(lat:37.1527136, lgt:126.0846985))]),   //37.1527136,126.0846985
                
            UpperMapInfo(upper:"부산광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"부산", audio:"city_pu1"), location:Location(lat:35.1050281, lgt:129.0177955)),   //35.1050281,129.0177955
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"부산", audio:"city_pu2"), location:Location(lat:35.0724337, lgt:128.9538834)),   //35.0724337,128.9538834
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"부산", audio:"city_pu3"), location:Location(lat:35.1265617, lgt:129.0272727)),   //35.1265617,129.0272727
                 LowerMapInfo(lower:"영도구", mapInfo:MapInfo(area:"부산", audio:"city_pu4"), location:Location(lat:35.1265617, lgt:129.0272727)),  //35.1265617,129.0272727
                 LowerMapInfo(lower:"부산진구", mapInfo:MapInfo(area:"부산", audio:"city_pu5"), location:Location(lat:35.165633, lgt:129.010846)), //35.165633,129.010846
                 LowerMapInfo(lower:"동래구", mapInfo:MapInfo(area:"부산", audio:"city_pu6"), location:Location(lat:35.204797, lgt:129.0441172)),  //35.204797,129.0441172
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"부산", audio:"city_pu7"), location:Location(lat:35.1072834, lgt:129.0493563)),   //35.1072834,129.0493563
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"부산", audio:"city_pu8"), location:Location(lat:35.2332144, lgt:128.9550622)),   //35.2332144,128.9550622
                 LowerMapInfo(lower:"해운대구", mapInfo:MapInfo(area:"부산", audio:"city_pu9"), location:Location(lat:35.1769654, lgt:129.1033871)), //35.1769654,129.1033871
                 LowerMapInfo(lower:"사하구", mapInfo:MapInfo(area:"부산", audio:"city_pu10"), location:Location(lat:35.0694614, lgt:128.9078753)), //35.0694614,128.9078753
                 LowerMapInfo(lower:"금정구", mapInfo:MapInfo(area:"부산", audio:"city_pu11"), location:Location(lat:35.2579864, lgt:129.0201793)), //35.2579864,129.0201793
                 LowerMapInfo(lower:"강서구", mapInfo:MapInfo(area:"부산", audio:"city_pu12"), location:Location(lat:35.0934658, lgt:128.7376386)), //35.0934658,128.7376386
                 LowerMapInfo(lower:"연제구", mapInfo:MapInfo(area:"부산", audio:"city_pu13"), location:Location(lat:35.1783996, lgt:129.0625107)), //35.1783996,129.0625107
                 LowerMapInfo(lower:"수영구", mapInfo:MapInfo(area:"부산", audio:"city_pu14"), location:Location(lat:35.1606288, lgt:129.0804241)), //35.1606288,129.0804241
                 LowerMapInfo(lower:"사상구", mapInfo:MapInfo(area:"부산", audio:"city_pu15"), location:Location(lat:35.1597869, lgt:128.9535312)), //35.1597869,128.9535312
                    LowerMapInfo(lower:"기장군", mapInfo:MapInfo(area:"부산", audio:"city_pu16"), location:Location(lat:35.1597869, lgt:128.9535312))]),   //35.1597869,128.9535312
            
            UpperMapInfo(upper:"대구광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"대구", audio:"city_tk1"), location:Location(lat:35.8671876, lgt:128.5764446)),   //35.8671876,128.5764446
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"대구", audio:"city_tk2"), location:Location(lat:35.9342845, lgt:128.6123682)),   //35.9342845,128.6123682
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"대구", audio:"city_tk3"), location:Location(lat:35.8489406, lgt:128.5495057)),   //35.8489406,128.5495057
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"대구", audio:"city_tk4"), location:Location(lat:35.8329725, lgt:128.5468734)),   //35.8329725,128.5468734
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"대구", audio:"city_tk5"), location:Location(lat:35.9306007, lgt:128.4981195)),   //35.9306007,128.4981195
                 LowerMapInfo(lower:"수성구", mapInfo:MapInfo(area:"대구", audio:"city_tk6"), location:Location(lat:35.8348788, lgt:128.5892442)),  //35.8348788,128.5892442
                 LowerMapInfo(lower:"달서구", mapInfo:MapInfo(area:"대구", audio:"city_tk7"), location:Location(lat:35.8211001, lgt:128.457341)),  //35.8211001,128.457341
                 LowerMapInfo(lower:"달성군", mapInfo:MapInfo(area:"대구", audio:"city_tk8"), location:Location(lat:35.7751027, lgt:128.3829382))]),    //35.7751027,128.3829382
            
            UpperMapInfo(upper:"대전광역시", lowerList:
                [LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"대전", audio:"city_dj1"), location:Location(lat:36.3183082, lgt:127.3460015)),   //36.3183082,127.3460015
                 LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"대전", audio:"city_dj2"), location:Location(lat:36.2801182, lgt:127.3428611)),   //36.2801182,127.3428611
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"대전", audio:"city_dj3"), location:Location(lat:36.2777495, lgt:127.2014586)),   //36.2777495,127.2014586
                 LowerMapInfo(lower:"유성구", mapInfo:MapInfo(area:"대전", audio:"city_dj4"), location:Location(lat:36.3818643, lgt:127.1927475)),  //36.3818643,127.1927475
                 LowerMapInfo(lower:"대덕구", mapInfo:MapInfo(area:"대전", audio:"city_dj5"), location:Location(lat:36.4093999, lgt:127.3767521))]),    //36.4093999,127.3767521
            
            UpperMapInfo(upper:"광주광역시", lowerList:
                [LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"광주", audio:"city_kj1"), location:Location(lat:35.1193445, lgt:126.8865155)),       //35.1193445,126.8865155
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"광주", audio:"city_kj2"), location:Location(lat:35.1349229, lgt:126.7846379)),       //35.1349229,126.7846379
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"광주", audio:"city_kj3"), location:Location(lat:35.1016286, lgt:126.7713379)),       //35.1016286,126.7713379
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"광주", audio:"city_kj4"), location:Location(lat:35.1907495, lgt:126.8588858)),       //35.1907495,126.8588858
                 LowerMapInfo(lower:"광산구", mapInfo:MapInfo(area:"광주", audio:"city_kj5"), location:Location(lat:35.1644858, lgt:126.6120807))]),    //35.1644858,126.6120807
            
            UpperMapInfo(upper:"울산광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"울산", audio:"city_ul1"), location:Location(lat:35.5721475, lgt:129.2681731)),       //35.5721475,129.2681731
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"울산", audio:"city_ul2"), location:Location(lat:35.5031069, lgt:129.2466499)),       //35.5031069,129.2466499
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"울산", audio:"city_ul3"), location:Location(lat:35.5093296, lgt:129.3696678)),       //35.5093296,129.3696678
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"울산", audio:"city_ul4"), location:Location(lat:35.5982818, lgt:129.3229632)),       //35.5982818,129.3229632
                 LowerMapInfo(lower:"울주군", mapInfo:MapInfo(area:"울산", audio:"city_ul5"), location:Location(lat:35.513835, lgt:128.9058191))]),    //35.513835,128.9058191

            UpperMapInfo(upper:"경기도", lowerList:
                [LowerMapInfo(lower:"수원시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky1"), location:Location(lat:37.2707199, lgt:126.9780979)),    //37.2707199,126.9780979
                LowerMapInfo(lower:"수원시 장안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky2"), location:Location(lat:37.3189992, lgt:126.966552)), //37.3189992,126.966552
                LowerMapInfo(lower:"수원시 권선구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky3"), location:Location(lat:37.2640862, lgt:126.9486157)), //37.2640862,126.9486157
                LowerMapInfo(lower:"수원시 팔달구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky4"), location:Location(lat:37.275173, lgt:126.9945765)), //37.275173,126.9945765
                LowerMapInfo(lower:"수원시 영통구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky5"), location:Location(lat:37.2758837, lgt:126.9909666)), //37.2758837,126.9909666
                LowerMapInfo(lower:"성남시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky6"), location:Location(lat:37.4002292, lgt:127.0707379)),     //37.4002292,127.0707379
                LowerMapInfo(lower:"성남시 중원구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky7"), location:Location(lat:37.4401693, lgt:127.1221109)), //37.4401693,127.1221109
                LowerMapInfo(lower:"성남시 수정구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky8"), location:Location(lat:37.4362802, lgt:127.0722703)), //37.4362802,127.0722703
                LowerMapInfo(lower:"성남시 분당구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky9"), location:Location(lat:37.3752448, lgt:127.0295391)), //37.3752448,127.0295391
                LowerMapInfo(lower:"의정부시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky10"), location:Location(lat:37.7325448, lgt:127.0277946)),   //37.7325448,127.0277946
                LowerMapInfo(lower:"안양시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky11"), location:Location(lat:37.3885448, lgt:126.9019446)),    //37.3885448,126.9019446
                LowerMapInfo(lower:"안양시 만안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky12"), location:Location(lat:37.4066896, lgt:126.8422628)),    //37.4066896,126.8422628
                LowerMapInfo(lower:"안양시 동안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky13"), location:Location(lat:37.4013521, lgt:126.9199124)),    //37.4013521,126.9199124
                LowerMapInfo(lower:"부천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky14"), location:Location(lat:37.5004448, lgt:126.7498946)),        //37.5004448,126.7498946
                LowerMapInfo(lower:"광명시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky15"), location:Location(lat:37.4718948, lgt:126.8314946)),        //37.4718948,126.8314946
                LowerMapInfo(lower:"평택시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky16"), location:Location(lat:36.9947987, lgt:127.0809475)),        //36.9947987,127.0809475
                LowerMapInfo(lower:"동두천시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky17"), location:Location(lat:37.9070448, lgt:127.0220446)),       //37.9070448,127.0220446
                LowerMapInfo(lower:"안산시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky18"), location:Location(lat:37.3201448, lgt:126.7669446)),        //37.3201448,126.7669446
                LowerMapInfo(lower:"안산시 상록구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky19"), location:Location(lat:37.3232227, lgt:126.8048859)),   //37.3232227,126.8048859
                LowerMapInfo(lower:"안산시 단원구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky20"), location:Location(lat:37.32242, lgt:126.7046535)),    //37.32242,126.7046535
                LowerMapInfo(lower:"고양시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky21"), location:Location(lat:37.6559292, lgt:126.7275879)),            //37.6559292,126.7275879
                LowerMapInfo(lower:"고양시 덕양구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky22"), location:Location(lat:37.662398, lgt:126.7373616)),        //37.662398,126.7373616
                LowerMapInfo(lower:"고양시 일산동구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky23"), location:Location(lat:37.6813277, lgt:126.7249785)),       //37.6813277,126.7249785
                LowerMapInfo(lower:"고양시 일산서구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky24"), location:Location(lat:37.6774085, lgt:126.6938146)),       //37.6774085,126.6938146
                LowerMapInfo(lower:"과천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky25"), location:Location(lat:37.4337487, lgt:126.9826475)),        //37.4337487,126.9826475
                LowerMapInfo(lower:"구리시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky26"), location:Location(lat:37.6006987, lgt:127.1244475)),        //37.6006987,127.1244475
                LowerMapInfo(lower:"남양주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky27"), location:Location(lat:37.6311948, lgt:127.1696446)),       //37.6311948,127.1696446
                LowerMapInfo(lower:"오산시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky28"), location:Location(lat:37.1515948, lgt:127.0358946)),        //37.1515948,127.0358946
                LowerMapInfo(lower:"시흥시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky29"), location:Location(lat:37.3811292, lgt:126.6815379)),        //37.3811292,126.6815379
                LowerMapInfo(lower:"군포시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky30"), location:Location(lat:37.3594487, lgt:126.9151975)),        //37.3811292,126.6815379
                LowerMapInfo(lower:"의왕시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky31"), location:Location(lat:37.3577793, lgt:126.9043879)),        //37.3577793,126.9043879
                LowerMapInfo(lower:"하남시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky32"), location:Location(lat:37.5443487, lgt:127.1932975)),        //37.5443487,127.1932975
                LowerMapInfo(lower:"용인시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky33"), location:Location(lat:37.2839293, lgt:127.0760879)),        //37.2839293,127.0760879
                LowerMapInfo(lower:"용인시 처인구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky34"), location:Location(lat:37.2214636, lgt:127.1273928)),    //37.2214636,127.1273928
                LowerMapInfo(lower:"용인시 기흥구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky35"), location:Location(lat:37.269842, lgt:127.0506013)),    //37.269842,127.0506013
                LowerMapInfo(lower:"용인시 수지구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky36"), location:Location(lat:37.3320078, lgt:127.0441191)),    //37.3320078,127.0441191
                LowerMapInfo(lower:"파주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky37"), location:Location(lat:37.7614987, lgt:126.7585475)),    //37.7614987,126.7585475
                LowerMapInfo(lower:"이천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky38"), location:Location(lat:37.2806987, lgt:127.4301475)),    //37.2806987,127.4301475
                LowerMapInfo(lower:"안성시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky39"), location:Location(lat:37.0112487, lgt:127.2448475)),    //37.0112487,127.2448475
                LowerMapInfo(lower:"김포시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky40"), location:Location(lat:37.6136987, lgt:126.6968475)),    //37.6136987,126.6968475
                LowerMapInfo(lower:"화성시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky41"), location:Location(lat:37.1951448, lgt:126.7759946)),    //37.1951448,126.7759946
                LowerMapInfo(lower:"광주시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky42"), location:Location(lat:37.3666642, lgt:127.1803638)),    //37.3666642,127.1803638
                LowerMapInfo(lower:"양주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky43"), location:Location(lat:37.8085448, lgt:127.0384946)),    //37.8085448,127.0384946
                LowerMapInfo(lower:"포천시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky44"), location:Location(lat:37.8971997, lgt:127.1926238)),    //37.8971997,127.1926238
                LowerMapInfo(lower:"여주시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky45"), location:Location(lat:37.288655, lgt:127.4413165)),    //37.288655,127.4413165
                LowerMapInfo(lower:"연천군", mapInfo:MapInfo(area:"경기북부", audio:"city_ky46"), location:Location(lat:38.1148624, lgt:126.6970869)),    //38.1148624,126.6970869
                LowerMapInfo(lower:"가평군", mapInfo:MapInfo(area:"경기북부", audio:"city_ky47"), location:Location(lat:37.8147596, lgt:127.1626613)),    //37.8147596,127.1626613
                LowerMapInfo(lower:"양평군", mapInfo:MapInfo(area:"경기남부", audio:"city_ky48"), location:Location(lat:37.5159885, lgt:127.440805))]),  //37.5159885,127.440805
            
             UpperMapInfo(upper:"강원도", lowerList:
                [LowerMapInfo(lower:"춘천시", mapInfo:MapInfo(area:"영서", audio:"city_kw1"), location:Location(lat:37.8687948, lgt:127.6972446)),  //37.8687948,127.6972446
                 LowerMapInfo(lower:"원주시", mapInfo:MapInfo(area:"영서", audio:"city_kw2"), location:Location(lat:37.3499948, lgt:127.9054946)),  //37.3499948,127.9054946
                 LowerMapInfo(lower:"홍천군", mapInfo:MapInfo(area:"영서", audio:"city_kw3"), location:Location(lat:37.7476908, lgt:127.787316)),  //37.7476908,127.787316
                 LowerMapInfo(lower:"횡성군", mapInfo:MapInfo(area:"영서", audio:"city_kw4"), location:Location(lat:37.4889034, lgt:127.7501767)),  //37.4889034,127.7501767
                 LowerMapInfo(lower:"영월군", mapInfo:MapInfo(area:"영서", audio:"city_kw5"), location:Location(lat:37.2149567, lgt:128.226415)),  //37.2149567,128.226415
                 LowerMapInfo(lower:"평창군", mapInfo:MapInfo(area:"영서", audio:"city_kw6"), location:Location(lat:37.5431899, lgt:128.2230985)),  //37.5431899,128.2230985
                 LowerMapInfo(lower:"정선군", mapInfo:MapInfo(area:"영서", audio:"city_kw7"), location:Location(lat:37.3685068, lgt:128.4673962)),  //37.3685068,128.4673962
                 LowerMapInfo(lower:"철원군", mapInfo:MapInfo(area:"영서", audio:"city_kw8"), location:Location(lat:38.2467577, lgt:127.1919345)),  //38.2467577,127.1919345
                 LowerMapInfo(lower:"화천군", mapInfo:MapInfo(area:"영서", audio:"city_kw9"), location:Location(lat:38.1388491, lgt:127.5256516)),  //38.1388491,127.5256516
                 LowerMapInfo(lower:"양구군", mapInfo:MapInfo(area:"영서", audio:"city_kw10"), location:Location(lat:38.2011721, lgt:127.7343416)), //38.2011721,127.7343416
                 LowerMapInfo(lower:"인제군", mapInfo:MapInfo(area:"영서", audio:"city_kw11"), location:Location(lat:38.1285764, lgt:127.9637987)), //38.1285764,127.9637987
                 LowerMapInfo(lower:"강릉시", mapInfo:MapInfo(area:"영동", audio:"city_kw12"), location:Location(lat:37.7636948, lgt:128.8648946)), //37.7636948,128.8648946
                 LowerMapInfo(lower:"동해시", mapInfo:MapInfo(area:"영동", audio:"city_kw13"), location:Location(lat:37.5156792, lgt:129.0578879)), //37.5156792,129.0578879
                 LowerMapInfo(lower:"태백시", mapInfo:MapInfo(area:"영동", audio:"city_kw14"), location:Location(lat:37.1628487, lgt:128.9658475)), //37.1628487,128.9658475
                 LowerMapInfo(lower:"속초시", mapInfo:MapInfo(area:"영동", audio:"city_kw15"), location:Location(lat:38.2046448, lgt:128.5534946)), //38.2046448,128.5534946
                 LowerMapInfo(lower:"삼척시", mapInfo:MapInfo(area:"영동", audio:"city_kw16"), location:Location(lat:37.4435487, lgt:129.1466975)), //37.4435487,129.1466975
                 LowerMapInfo(lower:"고성군", mapInfo:MapInfo(area:"영동", audio:"city_kw17"), location:Location(lat:38.447501, lgt:128.0853746)), //38.447501,128.0853746
                 LowerMapInfo(lower:"양양군", mapInfo:MapInfo(area:"영동", audio:"city_kw18"), location:Location(lat:38.0142834, lgt:128.4569405))]),   //38.0142834,128.4569405
             
             UpperMapInfo(upper:"충청북도", lowerList:
                [LowerMapInfo(lower:"청주시", mapInfo:MapInfo(area:"충북", audio:"city_cb1"), location:Location(lat:36.6391449, lgt:127.4345946)),      //36.6391449,127.4345946
                 LowerMapInfo(lower:"청주시 상당구", mapInfo:MapInfo(area:"충북", audio:"city_cb2"), location:Location(lat:36.6548616, lgt:127.4318066)),  //36.6548616,127.4318066
                 LowerMapInfo(lower:"청주시 서원구", mapInfo:MapInfo(area:"충북", audio:"city_cb3"), location:Location(lat:36.6272211, lgt:127.4548931)),  //36.6272211,127.4548931
                 LowerMapInfo(lower:"청주시 흥덕구", mapInfo:MapInfo(area:"충북", audio:"city_cb4"), location:Location(lat:36.6327687, lgt:127.3623222)),  //36.6327687,127.3623222
                 LowerMapInfo(lower:"청주시 청원구", mapInfo:MapInfo(area:"충북", audio:"city_cb5"), location:Location(lat:36.6746603, lgt:127.3732474)),  //36.6746603,127.3732474
                 LowerMapInfo(lower:"충주시", mapInfo:MapInfo(area:"충북", audio:"city_cb6"), location:Location(lat:36.9857948, lgt:127.8922446)),      //36.9857948,127.8922446
                 LowerMapInfo(lower:"제천시", mapInfo:MapInfo(area:"충북", audio:"city_cb7"), location:Location(lat:37.1431448, lgt:128.1664946)),      //37.1431448,128.1664946
                 LowerMapInfo(lower:"보은군", mapInfo:MapInfo(area:"충북", audio:"city_cb8"), location:Location(lat:36.4920807, lgt:127.5722292)),      //36.4920807,127.5722292
                 LowerMapInfo(lower:"옥천군", mapInfo:MapInfo(area:"충북", audio:"city_cb9"), location:Location(lat:36.3082155, lgt:127.5484443)),      //36.3082155,127.5484443
                 LowerMapInfo(lower:"영동군", mapInfo:MapInfo(area:"충북", audio:"city_cb10"), location:Location(lat:36.16492, lgt:127.6836994)),     //36.16492,127.6836994
                 LowerMapInfo(lower:"증평군", mapInfo:MapInfo(area:"충북", audio:"city_cb11"), location:Location(lat:36.781619, lgt:127.532441)),     //36.781619,127.532441
                 LowerMapInfo(lower:"진천군", mapInfo:MapInfo(area:"충북", audio:"city_cb12"), location:Location(lat:36.8801133, lgt:127.2964428)),     //36.8801133,127.2964428
                 LowerMapInfo(lower:"괴산군", mapInfo:MapInfo(area:"충북", audio:"city_cb13"), location:Location(lat:36.7766931, lgt:127.5626973)),     //36.7766931,127.5626973
                 LowerMapInfo(lower:"음성군", mapInfo:MapInfo(area:"충북", audio:"city_cb14"), location:Location(lat:36.9944097, lgt:127.4812614)),     //36.9944097,127.4812614
                LowerMapInfo(lower:"단양군", mapInfo:MapInfo(area:"충북", audio:"city_cb15"), location:Location(lat:36.979559, lgt:128.1560962))]),    //36.979559,128.1560962
             
             UpperMapInfo(upper:"충청남도", lowerList:
                [LowerMapInfo(lower:"천안시", mapInfo:MapInfo(area:"충남", audio:"city_cn1"), location:Location(lat:36.9789006, lgt:128.1547197)),      //36.9789006,128.1547197
                 LowerMapInfo(lower:"천안시 동남구", mapInfo:MapInfo(area:"충남", audio:"city_cn2"), location:Location(lat:36.7559576, lgt:127.0746904)),  //36.7559576,127.0746904
                 LowerMapInfo(lower:"천안시 서북구", mapInfo:MapInfo(area:"충남", audio:"city_cn3"), location:Location(lat:36.8790749, lgt:127.0420444)),  //36.8790749,127.0420444
                 LowerMapInfo(lower:"공주시", mapInfo:MapInfo(area:"충남", audio:"city_cn4"), location:Location(lat:36.4589449, lgt:127.0988446)),          //36.4589449,127.0988446
                 LowerMapInfo(lower:"보령시", mapInfo:MapInfo(area:"충남", audio:"city_cn5"), location:Location(lat:36.3486987, lgt:26.5852475)),      //36.3486987,126.5852475
                 LowerMapInfo(lower:"아산시", mapInfo:MapInfo(area:"충남", audio:"city_cn6"), location:Location(lat:36.7813487, lgt:126.9878975)),      //36.7813487,126.9878975
                 LowerMapInfo(lower:"서산시", mapInfo:MapInfo(area:"충남", audio:"city_cn7"), location:Location(lat:36.7798987, lgt:126.4381475)),      //36.7798987,126.4381475
                 LowerMapInfo(lower:"논산시", mapInfo:MapInfo(area:"충남", audio:"city_cn8"), location:Location(lat:36.1957487, lgt:127.0763975)),      //36.1957487,127.0763975
                 LowerMapInfo(lower:"계룡시", mapInfo:MapInfo(area:"충남", audio:"city_cn9"), location:Location(lat:36.2726987, lgt:127.2390475)),      //36.2726987,127.2390475
                 LowerMapInfo(lower:"당진시", mapInfo:MapInfo(area:"충남", audio:"city_cn10"), location:Location(lat:36.9053758, lgt:126.4954103)),     //36.9053758,126.4954103
                 LowerMapInfo(lower:"금산군", mapInfo:MapInfo(area:"충남", audio:"city_cn11"), location:Location(lat:36.1265663, lgt:127.3381171)),     //36.1265663,127.3381171
                 LowerMapInfo(lower:"부여군", mapInfo:MapInfo(area:"충남", audio:"city_cn12"), location:Location(lat:36.2285972, lgt:126.7354512)),     //36.2285972,126.7354512
                 LowerMapInfo(lower:"서천군", mapInfo:MapInfo(area:"충남", audio:"city_cn13"), location:Location(lat:36.0917836, lgt:126.5400607)),     //36.0917836,126.5400607
                 LowerMapInfo(lower:"청양군", mapInfo:MapInfo(area:"충남", audio:"city_cn14"), location:Location(lat:36.4427243, lgt:126.7087296)),     //36.4427243,126.7087296
                 LowerMapInfo(lower:"홍성군", mapInfo:MapInfo(area:"충남", audio:"city_cn15"), location:Location(lat:36.5653124, lgt:126.4727314)),     //36.5653124,126.4727314
                 LowerMapInfo(lower:"예산군", mapInfo:MapInfo(area:"충남", audio:"city_cn16"), location:Location(lat:36.6652083, lgt:126.6368162)),     //36.6652083,126.6368162
                 LowerMapInfo(lower:"태안군", mapInfo:MapInfo(area:"충남", audio:"city_cn17"), location:Location(lat:36.685669, lgt:125.9605935))]),   //36.685669,125.9605935

            UpperMapInfo(upper:"전라북도", lowerList:
                [LowerMapInfo(lower:"전주시", mapInfo:MapInfo(area:"전북", audio:"city_jb1"), location:Location(lat:35.8254796, lgt:127.0613878)),      //35.8254796,127.0613878
                 LowerMapInfo(lower:"전주시 완산구", mapInfo:MapInfo(area:"전북", audio:"city_jb2"), location:Location(lat:35.7881988, lgt:127.061299)),  //35.7881988,127.061299
                 LowerMapInfo(lower:"전주시 덕진구", mapInfo:MapInfo(area:"전북", audio:"city_jb3"), location:Location(lat:35.8514073, lgt:127.0467703)),  //35.8514073,127.0467703
                 LowerMapInfo(lower:"군산시", mapInfo:MapInfo(area:"전북", audio:"city_jb4"), location:Location(lat:35.9658449, lgt:126.6759446)),          //35.9658449,126.6759446
                 LowerMapInfo(lower:"익산시", mapInfo:MapInfo(area:"전북", audio:"city_jb5"), location:Location(lat:35.9658449, lgt:126.6759446)),          //35.9658449,126.6759446
                 LowerMapInfo(lower:"정읍시", mapInfo:MapInfo(area:"전북", audio:"city_jb6"), location:Location(lat:35.9658449, lgt:126.6759446)),      //35.9658449,126.6759446
                 LowerMapInfo(lower:"남원시", mapInfo:MapInfo(area:"전북", audio:"city_jb7"), location:Location(lat:35.4137949, lgt:127.3569946)),      //35.4137949,127.3569946
                 LowerMapInfo(lower:"김제시", mapInfo:MapInfo(area:"전북", audio:"city_jb8"), location:Location(lat:35.7996487, lgt:126.8737975)),      //35.7996487,126.8737975
                 LowerMapInfo(lower:"완주군", mapInfo:MapInfo(area:"전북", audio:"city_jb9"), location:Location(lat:35.8750586, lgt:126.9047257)),      //35.8750586,126.9047257
                 LowerMapInfo(lower:"진안군", mapInfo:MapInfo(area:"전북", audio:"city_jb10"), location:Location(lat:35.8266953, lgt:127.1651938)),     //35.8266953,127.1651938
                 LowerMapInfo(lower:"무주군", mapInfo:MapInfo(area:"전북", audio:"city_jb11"), location:Location(lat:35.9281289, lgt:127.5779242)),     //35.9281289,127.5779242
                 LowerMapInfo(lower:"장수군", mapInfo:MapInfo(area:"전북", audio:"city_jb12"), location:Location(lat:35.6531082, lgt:127.2459449)),     //35.6531082,127.2459449
                 LowerMapInfo(lower:"임실군", mapInfo:MapInfo(area:"전북", audio:"city_jb13"), location:Location(lat:35.6202341, lgt:127.1197469)),     //35.6202341,127.1197469
                 LowerMapInfo(lower:"순창군", mapInfo:MapInfo(area:"전북", audio:"city_jb14"), location:Location(lat:35.4284133, lgt:126.9441459)),     //35.4284133,126.9441459
                 LowerMapInfo(lower:"고창군", mapInfo:MapInfo(area:"전북", audio:"city_jb15"), location:Location(lat:35.4378761, lgt:126.4602878)),     //35.4378761,126.4602878
                 LowerMapInfo(lower:"부안군", mapInfo:MapInfo(area:"전북", audio:"city_jb16"), location:Location(lat:35.6824488, lgt:126.5088495))]),   //35.6824488,126.5088495
            
             UpperMapInfo(upper:"전라남도", lowerList:
                [LowerMapInfo(lower:"목포시", mapInfo:MapInfo(area:"전남", audio:"city_jn1"), location:Location(lat:34.802795, lgt:126.3850946)),      //34.802795,126.3850946
                 LowerMapInfo(lower:"여수시", mapInfo:MapInfo(area:"전남", audio:"city_jn2"), location:Location(lat:34.752495, lgt:127.6567446)),      //34.752495,127.6567446
                 LowerMapInfo(lower:"순천시", mapInfo:MapInfo(area:"전남", audio:"city_jn3"), location:Location(lat:34.9629949, lgt:127.4697946)),      //34.9629949,127.4697946
                 LowerMapInfo(lower:"나주시", mapInfo:MapInfo(area:"전남", audio:"city_jn4"), location:Location(lat:35.0169949, lgt:126.6794946)),      //35.0169949,126.6794946
                 LowerMapInfo(lower:"광양시", mapInfo:MapInfo(area:"전남", audio:"city_jn5"), location:Location(lat:34.935495, lgt:127.6829446)),      //34.935495,127.6829446
                 LowerMapInfo(lower:"담양군", mapInfo:MapInfo(area:"전남", audio:"city_jn6"), location:Location(lat:35.2906621, lgt:126.7036162)),      //35.2906621,126.7036162
                 LowerMapInfo(lower:"곡성군", mapInfo:MapInfo(area:"전남", audio:"city_jn7"), location:Location(lat:35.202281, lgt:127.1070831)),      //35.202281,127.1070831
                 LowerMapInfo(lower:"구례군", mapInfo:MapInfo(area:"전남", audio:"city_jn8"), location:Location(lat:35.2322309, lgt:127.3554068)),      //35.2322309,127.3554068
                 LowerMapInfo(lower:"고흥군", mapInfo:MapInfo(area:"전남", audio:"city_jn9"), location:Location(lat:34.6012384, lgt:127.0303823)),      //34.6012384,127.0303823
                 LowerMapInfo(lower:"보성군", mapInfo:MapInfo(area:"전남", audio:"city_jn10"), location:Location(lat:34.8090491, lgt:126.9400521)),     //34.8090491,126.9400521
                 LowerMapInfo(lower:"화순군", mapInfo:MapInfo(area:"전남", audio:"city_jn11"), location:Location(lat:35.0197085, lgt:126.7320195)),     //35.0197085,126.7320195
                 LowerMapInfo(lower:"장흥군", mapInfo:MapInfo(area:"전남", audio:"city_jn12"), location:Location(lat:34.6479849, lgt:126.6411802)),     //34.6479849,126.6411802
                 LowerMapInfo(lower:"강진군", mapInfo:MapInfo(area:"전남", audio:"city_jn13"), location:Location(lat:34.6147707, lgt:126.6280995)),     //34.6147707,126.6280995
                 LowerMapInfo(lower:"해남군", mapInfo:MapInfo(area:"전남", audio:"city_jn14"), location:Location(lat:34.524184, lgt:126.2097989)),     //34.524184,126.2097989
                 LowerMapInfo(lower:"영암군", mapInfo:MapInfo(area:"전남", audio:"city_jn15"), location:Location(lat:34.8058758, lgt:126.4709172)),     //34.8058758,126.4709172
                 LowerMapInfo(lower:"무안군", mapInfo:MapInfo(area:"전남", audio:"city_jn16"), location:Location(lat:34.9629545, lgt:126.1129764)),     //34.9629545,126.1129764
                 LowerMapInfo(lower:"함평군", mapInfo:MapInfo(area:"전남", audio:"city_jn17"), location:Location(lat:35.1043291, lgt:126.3816687)),     //35.1043291,126.3816687
                 LowerMapInfo(lower:"영광군", mapInfo:MapInfo(area:"전남", audio:"city_jn18"), location:Location(lat:35.2999917, lgt:126.3308046)),     //35.2999917,126.3308046
                 LowerMapInfo(lower:"장성군", mapInfo:MapInfo(area:"전남", audio:"city_jn19"), location:Location(lat:35.3398708, lgt:126.6146683)),     //35.3398708,126.6146683
                 LowerMapInfo(lower:"완도군", mapInfo:MapInfo(area:"전남", audio:"city_jn20"), location:Location(lat:34.271597, lgt:126.4774492)),     //34.271597,126.4774492
                 LowerMapInfo(lower:"진도군", mapInfo:MapInfo(area:"전남", audio:"city_jn21"), location:Location(lat:34.271597, lgt:126.4774492)),     //34.271597,126.4774492
                 LowerMapInfo(lower:"신안군", mapInfo:MapInfo(area:"전남", audio:"city_jn22"), location:Location(lat:34.8350253, lgt:125.8097861))]),   //34.8350253,125.8097861
             
             UpperMapInfo(upper:"경상북도", lowerList:
                [LowerMapInfo(lower:"포항시", mapInfo:MapInfo(area:"경북", audio:"city_kb1"), location:Location(lat:36.0192795, lgt:129.2993878)),      //36.0192795,129.2993878
                 LowerMapInfo(lower:"포항시 남구", mapInfo:MapInfo(area:"경북", audio:"city_kb2"), location:Location(lat:35.9689666, lgt:129.2961554)),   //35.9689666,129.2961554
                 LowerMapInfo(lower:"포항시 북구", mapInfo:MapInfo(area:"경북", audio:"city_kb3"), location:Location(lat:36.1729709, lgt:129.1040915)),   //36.1729709,129.1040915
                 LowerMapInfo(lower:"경주시", mapInfo:MapInfo(area:"경북", audio:"city_kb4"), location:Location(lat:35.8533949, lgt:129.1692446)),      //35.8533949,129.1692446
                 LowerMapInfo(lower:"김천시", mapInfo:MapInfo(area:"경북", audio:"city_kb5"), location:Location(lat:36.1357949, lgt:128.0784946)),      //36.1357949,128.0784946
                 LowerMapInfo(lower:"안동시", mapInfo:MapInfo(area:"경북", audio:"city_kb6"), location:Location(lat:36.5626987, lgt:128.7092475)),      //36.5626987,128.7092475
                 LowerMapInfo(lower:"구미시", mapInfo:MapInfo(area:"경북", audio:"city_kb7"), location:Location(lat:36.1147795, lgt:128.3037878)),      //36.1147795,128.3037878
                 LowerMapInfo(lower:"영주시", mapInfo:MapInfo(area:"경북", audio:"city_kb8"), location:Location(lat:36.8155987, lgt:128.6020475)),      //36.8155987,128.6020475
                 LowerMapInfo(lower:"영천시", mapInfo:MapInfo(area:"경북", audio:"city_kb9"), location:Location(lat:35.9749987, lgt:128.9236475)),      //35.9749987,128.9236475
                 LowerMapInfo(lower:"상주시", mapInfo:MapInfo(area:"경북", audio:"city_kb10"), location:Location(lat:36.4168987, lgt:128.1432975)),     //36.4168987,128.1432975
                 LowerMapInfo(lower:"문경시", mapInfo:MapInfo(area:"경북", audio:"city_kb11"), location:Location(lat:36.5945987, lgt:128.1768475)),     //36.5945987,128.1768475
                 LowerMapInfo(lower:"경산시", mapInfo:MapInfo(area:"경북", audio:"city_kb12"), location:Location(lat:35.8234949, lgt:128.6941946)),     //35.8234949,128.6941946
                 LowerMapInfo(lower:"군위군", mapInfo:MapInfo(area:"경북", audio:"city_kb13"), location:Location(lat:36.1672689, lgt:128.5148671)),     //36.1672689,128.5148671
                 LowerMapInfo(lower:"의성군", mapInfo:MapInfo(area:"경북", audio:"city_kb14"), location:Location(lat:36.360662, lgt:128.3114855)),     //36.360662,128.3114855
                 LowerMapInfo(lower:"청송군", mapInfo:MapInfo(area:"경북", audio:"city_kb15"), location:Location(lat:36.3771311, lgt:128.7706326)),     //36.3771311,128.7706326
                 LowerMapInfo(lower:"영양군", mapInfo:MapInfo(area:"경북", audio:"city_kb16"), location:Location(lat:36.6885167, lgt:128.8669705)),     //36.6885167,128.8669705
                 LowerMapInfo(lower:"영덕군", mapInfo:MapInfo(area:"경북", audio:"city_kb17"), location:Location(lat:36.4692372, lgt:129.0186467)),     //36.4692372,129.0186467
                 LowerMapInfo(lower:"청도군", mapInfo:MapInfo(area:"경북", audio:"city_kb18"), location:Location(lat:35.7051902, lgt:128.644241)),     //35.7051902,128.644241
                 LowerMapInfo(lower:"고령군", mapInfo:MapInfo(area:"경북", audio:"city_kb19"), location:Location(lat:35.7331627, lgt:128.1800287)),     //35.7331627,128.1800287
                 LowerMapInfo(lower:"성주군", mapInfo:MapInfo(area:"경북", audio:"city_kb20"), location:Location(lat:35.9162486, lgt:128.0844083)),     //35.9162486,128.0844083
                 LowerMapInfo(lower:"칠곡군", mapInfo:MapInfo(area:"경북", audio:"city_kb21"), location:Location(lat:36.0060695, lgt:128.3197072)),     //36.0060695,128.3197072
                 LowerMapInfo(lower:"예천군", mapInfo:MapInfo(area:"경북", audio:"city_kb22"), location:Location(lat:36.6516093, lgt:128.1544556)),     //36.6516093,128.1544556
                 LowerMapInfo(lower:"봉화군", mapInfo:MapInfo(area:"경북", audio:"city_kb23"), location:Location(lat:36.9255917, lgt:128.6338649)),     //36.9255917,128.6338649
                 LowerMapInfo(lower:"울진군", mapInfo:MapInfo(area:"경북", audio:"city_kb24"), location:Location(lat:36.8946816, lgt:128.9951861)),     //36.8946816,128.9951861
                 LowerMapInfo(lower:"울릉군", mapInfo:MapInfo(area:"경북", audio:"city_kb25"), location:Location(lat:37.4977922, lgt:130.7883847))]),   //37.4977922,130.7883847
             
             UpperMapInfo(upper:"경상남도", lowerList:
                [LowerMapInfo(lower:"창원시", mapInfo:MapInfo(area:"경남", audio:"city_kn1"), location:Location(lat:35.2525914, lgt:128.4954166)),      //35.2525914,128.4954166
                 LowerMapInfo(lower:"창원시 의창구", mapInfo:MapInfo(area:"경남", audio:"city_kn2"), location:Location(lat:35.3049626, lgt:128.5205809)),  //35.3049626,128.5205809
                 LowerMapInfo(lower:"창원시 성산구", mapInfo:MapInfo(area:"경남", audio:"city_kn3"), location:Location(lat:35.1976959, lgt:128.5986027)),  //35.1976959,128.5986027
                 LowerMapInfo(lower:"창원시 마산합포구", mapInfo:MapInfo(area:"경남", audio:"city_kn4"), location:Location(lat:35.1229729, lgt:128.3649546)),    //35.1229729,128.3649546
                 LowerMapInfo(lower:"창원시 마산회원구", mapInfo:MapInfo(area:"경남", audio:"city_kn5"), location:Location(lat:35.2277078, lgt:128.4802493)),    //35.2277078,128.4802493
                 LowerMapInfo(lower:"창원시 진해구", mapInfo:MapInfo(area:"경남", audio:"city_kn6"), location:Location(lat:35.1092328, lgt:128.6520035)),      //35.1092328,128.6520035
                 LowerMapInfo(lower:"진주시", mapInfo:MapInfo(area:"경남", audio:"city_kn7"), location:Location(lat:35.1822449, lgt:128.0547446)),      //35.1822449,128.0547446
                 LowerMapInfo(lower:"통영시", mapInfo:MapInfo(area:"경남", audio:"city_kn8"), location:Location(lat:34.856045, lgt:128.3836446)),      //34.856045,128.3836446
                 LowerMapInfo(lower:"사천시", mapInfo:MapInfo(area:"경남", audio:"city_kn9"), location:Location(lat:34.9694798, lgt:128.0057378)),      //34.9694798,128.0057378
                 LowerMapInfo(lower:"김해시", mapInfo:MapInfo(area:"경남", audio:"city_kn10"), location:Location(lat:35.2479449, lgt:128.8512946)),     //35.2479449,128.8512946
                 LowerMapInfo(lower:"밀양시", mapInfo:MapInfo(area:"경남", audio:"city_kn11"), location:Location(lat:35.4919949, lgt:128.7204446)),     //35.4919949,128.7204446
                 LowerMapInfo(lower:"거제시", mapInfo:MapInfo(area:"경남", audio:"city_kn12"), location:Location(lat:34.8858487, lgt:128.6067475)),     //34.8858487,128.6067475
                 LowerMapInfo(lower:"양산시", mapInfo:MapInfo(area:"경남", audio:"city_kn13"), location:Location(lat:35.3407949, lgt:128.9963946)),     //35.3407949,128.9963946
                 LowerMapInfo(lower:"의령군", mapInfo:MapInfo(area:"경남", audio:"city_kn14"), location:Location(lat:35.3852679, lgt:128.1193632)),     //35.3852679,128.1193632
                 LowerMapInfo(lower:"함안군", mapInfo:MapInfo(area:"경남", audio:"city_kn15"), location:Location(lat:35.2820676, lgt:128.2905851)),     //35.2820676,128.2905851
                 LowerMapInfo(lower:"창녕군", mapInfo:MapInfo(area:"경남", audio:"city_kn16"), location:Location(lat:35.5267127, lgt:128.3605925)),     //35.5267127,128.3605925
                 LowerMapInfo(lower:"고성군", mapInfo:MapInfo(area:"경남", audio:"city_kn17"), location:Location(lat:35.0094928, lgt:128.1554012)),     //35.0094928,128.1554012
                 LowerMapInfo(lower:"남해군", mapInfo:MapInfo(area:"경남", audio:"city_kn18"), location:Location(lat:34.8241892, lgt:127.8080983)),     //34.8241892,127.8080983
                 LowerMapInfo(lower:"하동군", mapInfo:MapInfo(area:"경남", audio:"city_kn19"), location:Location(lat:35.1340149, lgt:127.4704031)),     //35.1340149,127.4704031
                 LowerMapInfo(lower:"산청군", mapInfo:MapInfo(area:"경남", audio:"city_kn20"), location:Location(lat:35.3968553, lgt:127.6116857)),     //35.3968553,127.6116857
                 LowerMapInfo(lower:"함양군", mapInfo:MapInfo(area:"경남", audio:"city_kn21"), location:Location(lat:35.5531161, lgt:127.4498942)),     //35.5531161,127.4498942
                 LowerMapInfo(lower:"거창군", mapInfo:MapInfo(area:"경남", audio:"city_kn22"), location:Location(lat:35.7119241, lgt:127.6098501)),     //35.7119241,127.6098501
                 LowerMapInfo(lower:"합천군", mapInfo:MapInfo(area:"경남", audio:"city_kn23"), location:Location(lat:35.6003428, lgt:127.884885))]),   //35.6003428,127.884885

             
             UpperMapInfo(upper:"제주특별자치도", lowerList:
                [LowerMapInfo(lower:"제주시", mapInfo:MapInfo(area:"제주", audio:"city_je1"), location:Location(lat:33.503845, lgt:126.4948946)),      //33.503845,126.4948946
                 LowerMapInfo(lower:"서귀포시", mapInfo:MapInfo(area:"제주", audio:"city_je2"), location:Location(lat:33.2501997, lgt:126.5587238))]),   //33.2501997,126.5587238
                
             UpperMapInfo(upper:"세종특별자치시", lowerList:
                [LowerMapInfo(lower:"세종특별자치시", mapInfo:MapInfo(area:"세종", audio:"city_sj1"), location:Location(lat:36.5840857, lgt:127.1165384))])     //36.5840857,127.1165384

                 */
             
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
