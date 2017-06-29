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
    
    let current = "알람시 위치"
    
    
    init(){
        
         mapList =
            [
                UpperMapInfo(upper:"서울특별시", lowerList:
                [LowerMapInfo(lower:"종로구", mapInfo:MapInfo(area:"서울", audio:"city_se1"), location:Location(lat:37.573025, lgt:126.979638)),
                 LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"서울", audio:"city_se2"), location:Location(lat:37.563842, lgt:126.9976)),
                 LowerMapInfo(lower:"용산구", mapInfo:MapInfo(area:"서울", audio:"city_se3"), location:Location(lat:37.532527, lgt:126.990487)),
                    LowerMapInfo(lower:"성동구", mapInfo:MapInfo(area:"서울", audio:"city_se4"), location:Location(lat:37.563475, lgt:127.036838)),
                 LowerMapInfo(lower:"광진구", mapInfo:MapInfo(area:"서울", audio:"city_se5"), location:Location(lat:37.538617, lgt:127.082375)),
                 LowerMapInfo(lower:"동대문구", mapInfo:MapInfo(area:"서울", audio:"city_se6"), location:Location(lat:37.5744934, lgt:127.0397652)),
                 LowerMapInfo(lower:"중랑구", mapInfo:MapInfo(area:"서울", audio:"city_se7"), location:Location(lat:37.6063242, lgt:127.0925842)),
                 LowerMapInfo(lower:"성북구", mapInfo:MapInfo(area:"서울", audio:"city_se8"), location:Location(lat:37.5893982, lgt:127.0167494)),
                    LowerMapInfo(lower:"강북구", mapInfo:MapInfo(area:"서울", audio:"city_se9"), location:Location(lat:37.63974, lgt:127.025488)),
                    LowerMapInfo(lower:"도봉구", mapInfo:MapInfo(area:"서울", audio:"city_se10"), location:Location(lat:37.668768, lgt:127.047163)),
                    LowerMapInfo(lower:"노원구", mapInfo:MapInfo(area:"서울", audio:"city_se11"), location:Location(lat:37.6543543, lgt:127.0564716)),
                 LowerMapInfo(lower:"은평구", mapInfo:MapInfo(area:"서울", audio:"city_se12"), location:Location(lat:37.60278, lgt:126.9291627)),
                    LowerMapInfo(lower:"서대문구", mapInfo:MapInfo(area:"서울", audio:"city_se13"), location:Location(lat:37.579225, lgt:126.9368)),
                 LowerMapInfo(lower:"마포구", mapInfo:MapInfo(area:"서울", audio:"city_se14"), location:Location(lat:37.5663244, lgt:126.901491)),
                    LowerMapInfo(lower:"양천구", mapInfo:MapInfo(area:"서울", audio:"city_se15"), location:Location(lat:37.51701, lgt:126.8666435)),
                 LowerMapInfo(lower:"강서구", mapInfo:MapInfo(area:"서울", audio:"city_se16"), location:Location(lat:37.5509358, lgt:126.8496421)),
                 LowerMapInfo(lower:"구로구", mapInfo:MapInfo(area:"서울", audio:"city_se17"), location:Location(lat:37.495468, lgt:126.8875436)),
                    LowerMapInfo(lower:"금천구", mapInfo:MapInfo(area:"서울", audio:"city_se18"), location:Location(lat:37.4570783, lgt:126.8957011)),
                    LowerMapInfo(lower:"영등포구", mapInfo:MapInfo(area:"서울", audio:"city_se19"), location:Location(lat:37.5264324, lgt:126.8960076)),
                    LowerMapInfo(lower:"동작구", mapInfo:MapInfo(area:"서울", audio:"city_se20"), location:Location(lat:37.51245, lgt:126.9395)),
                    LowerMapInfo(lower:"관악구", mapInfo:MapInfo(area:"서울", audio:"city_se21"), location:Location(lat:37.4781548, lgt:126.9514847)),
                    LowerMapInfo(lower:"서초구", mapInfo:MapInfo(area:"서울", audio:"city_se22"), location:Location(lat:37.4837522, lgt:127.0067046)),
                 LowerMapInfo(lower:"강남구", mapInfo:MapInfo(area:"서울", audio:"city_se23"), location:Location(lat:37.517408, lgt:127.047313)),
                 LowerMapInfo(lower:"송파구", mapInfo:MapInfo(area:"서울", audio:"city_se24"), location:Location(lat:37.514592, lgt:127.105863)),
                    LowerMapInfo(lower:"강동구", mapInfo:MapInfo(area:"서울", audio:"city_se25"), location:Location(lat:37.530126, lgt:127.1237708))]),
                
            UpperMapInfo(upper:"인천광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"인천", audio:"city_ic1"), location:Location(lat:37.4737783, lgt:126.6215766)),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"인천", audio:"city_ic2"), location:Location(lat:37.48311, lgt:126.63919)),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"인천", audio:"city_ic3"), location:Location(lat:37.4634184, lgt:126.6505562)),
                 LowerMapInfo(lower:"연수구", mapInfo:MapInfo(area:"인천", audio:"city_ic4"), location:Location(lat:37.4101675, lgt:126.67828)),
                 LowerMapInfo(lower:"남동구", mapInfo:MapInfo(area:"인천", audio:"city_ic5"), location:Location(lat:37.4473449, lgt:126.7314909)),
                 LowerMapInfo(lower:"부평구", mapInfo:MapInfo(area:"인천", audio:"city_ic6"), location:Location(lat:37.5070833, lgt:126.7218375)),
                 LowerMapInfo(lower:"계양구", mapInfo:MapInfo(area:"인천", audio:"city_ic7"), location:Location(lat:37.5375598, lgt:126.7377707)),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"인천", audio:"city_ic8"), location:Location(lat:37.5454409, lgt:126.6758765)),
                 LowerMapInfo(lower:"강화군", mapInfo:MapInfo(area:"인천", audio:"city_ic9"), location:Location(lat:37.746435, lgt:126.488025)),
                 LowerMapInfo(lower:"옹진군", mapInfo:MapInfo(area:"인천", audio:"city_ic10"), location:Location(lat:37.262817, lgt:126.465))]),
            
            UpperMapInfo(upper:"부산광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"부산", audio:"city_pu1"), location:Location(lat:35.1063558, lgt:129.032408)),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"부산", audio:"city_pu2"), location:Location(lat:35.097932, lgt:129.0244125)),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"부산", audio:"city_pu3"), location:Location(lat:35.1292469, lgt:129.045431)),
                 LowerMapInfo(lower:"영도구", mapInfo:MapInfo(area:"부산", audio:"city_pu4"), location:Location(lat:35.091199, lgt:129.067875)),
                 LowerMapInfo(lower:"부산진구", mapInfo:MapInfo(area:"부산", audio:"city_pu5"), location:Location(lat:35.162874, lgt:129.053137)),
                 LowerMapInfo(lower:"동래구", mapInfo:MapInfo(area:"부산", audio:"city_pu6"), location:Location(lat:35.205001, lgt:129.083625)),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"부산", audio:"city_pu7"), location:Location(lat:35.136649, lgt:129.084175)),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"부산", audio:"city_pu8"), location:Location(lat:35.197185, lgt:128.990438)),
                 LowerMapInfo(lower:"해운대구", mapInfo:MapInfo(area:"부산", audio:"city_pu9"), location:Location(lat:35.1631761, lgt:129.1636386)),
                 LowerMapInfo(lower:"사하구", mapInfo:MapInfo(area:"부산", audio:"city_pu10"), location:Location(lat:35.1045772, lgt:128.974817)),
                 LowerMapInfo(lower:"금정구", mapInfo:MapInfo(area:"부산", audio:"city_pu11"), location:Location(lat:35.243068, lgt:129.0921)),
                    LowerMapInfo(lower:"강서구", mapInfo:MapInfo(area:"부산", audio:"city_pu12"), location:Location(lat:35.2122179, lgt:128.98045)),
                 LowerMapInfo(lower:"연제구", mapInfo:MapInfo(area:"부산", audio:"city_pu13"), location:Location(lat:35.176235, lgt:129.079762)),
                 LowerMapInfo(lower:"수영구", mapInfo:MapInfo(area:"부산", audio:"city_pu14"), location:Location(lat:35.1456366, lgt:129.1131976)),
                 LowerMapInfo(lower:"사상구", mapInfo:MapInfo(area:"부산", audio:"city_pu15"), location:Location(lat:35.152624, lgt:128.99125)),
                    LowerMapInfo(lower:"기장군", mapInfo:MapInfo(area:"부산", audio:"city_pu16"), location:Location(lat:35.2444985, lgt:129.2223177))]),
 
            UpperMapInfo(upper:"대구광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"대구", audio:"city_tk1"), location:Location(lat:35.86934, lgt:128.606188)),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"대구", audio:"city_tk2"), location:Location(lat:35.8866606, lgt:128.635613)),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"대구", audio:"city_tk3"), location:Location(lat:35.871757, lgt:128.559175)),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"대구", audio:"city_tk4"), location:Location(lat:35.8460175, lgt:128.5974553)),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"대구", audio:"city_tk5"), location:Location(lat:35.8856854, lgt:128.5829515)),
                 LowerMapInfo(lower:"수성구", mapInfo:MapInfo(area:"대구", audio:"city_tk6"), location:Location(lat:35.8581654, lgt:128.630625)),
                 LowerMapInfo(lower:"달서구", mapInfo:MapInfo(area:"대구", audio:"city_tk7"), location:Location(lat:35.8298666, lgt:128.5327375)),
                 LowerMapInfo(lower:"달성군", mapInfo:MapInfo(area:"대구", audio:"city_tk8"), location:Location(lat:35.7746, lgt:128.43145))]),
 
            UpperMapInfo(upper:"대전광역시", lowerList:
                [LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"대전", audio:"city_dj1"), location:Location(lat:36.3271, lgt:127.432663)),
                 LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"대전", audio:"city_dj2"), location:Location(lat:36.325808, lgt:127.421363)),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"대전", audio:"city_dj3"), location:Location(lat:36.3554998, lgt:127.3838401)),
                 LowerMapInfo(lower:"유성구", mapInfo:MapInfo(area:"대전", audio:"city_dj4"), location:Location(lat:36.3623219, lgt:127.3562683)),
                 LowerMapInfo(lower:"대덕구", mapInfo:MapInfo(area:"대전", audio:"city_dj5"), location:Location(lat:36.3549424, lgt:127.4514946))]),

            UpperMapInfo(upper:"광주광역시", lowerList:
                [LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"광주", audio:"city_kj1"), location:Location(lat:35.145999, lgt:126.923312)),
                 LowerMapInfo(lower:"서구", mapInfo:MapInfo(area:"광주", audio:"city_kj2"), location:Location(lat:35.1516508, lgt:126.8901679)),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"광주", audio:"city_kj3"), location:Location(lat:35.122124, lgt:126.90805)),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"광주", audio:"city_kj4"), location:Location(lat:35.17406, lgt:126.911963)),
                 LowerMapInfo(lower:"광산구", mapInfo:MapInfo(area:"광주", audio:"city_kj5"), location:Location(lat:35.139524, lgt:126.793688))]),

            UpperMapInfo(upper:"울산광역시", lowerList:
                [LowerMapInfo(lower:"중구", mapInfo:MapInfo(area:"울산", audio:"city_ul1"), location:Location(lat:35.56945, lgt:129.3327)),
                 LowerMapInfo(lower:"남구", mapInfo:MapInfo(area:"울산", audio:"city_ul2"), location:Location(lat:35.543801, lgt:129.3301087)),
                 LowerMapInfo(lower:"동구", mapInfo:MapInfo(area:"울산", audio:"city_ul3"), location:Location(lat:35.5048448, lgt:129.4166292)),
                 LowerMapInfo(lower:"북구", mapInfo:MapInfo(area:"울산", audio:"city_ul4"), location:Location(lat:35.5827072, lgt:129.3613103)),
                 LowerMapInfo(lower:"울주군", mapInfo:MapInfo(area:"울산", audio:"city_ul5"), location:Location(lat:35.522133, lgt:129.156962))]),

            UpperMapInfo(upper:"경기도", lowerList:
                [LowerMapInfo(lower:"수원시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky1"), location:Location(lat:37.263475, lgt:127.028513)),
                LowerMapInfo(lower:"수원시 장안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky2"), location:Location(lat:37.3040416, lgt:127.0101125)),
                LowerMapInfo(lower:"수원시 권선구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky3"), location:Location(lat:37.2576069, lgt:126.9718932)),
                LowerMapInfo(lower:"수원시 팔달구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky4"), location:Location(lat:37.2867333, lgt:127.0361)),
                LowerMapInfo(lower:"수원시 영통구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky5"), location:Location(lat:37.2596, lgt:127.046525)),
                LowerMapInfo(lower:"성남시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky6"), location:Location(lat:37.4200768, lgt:127.1266254)),
                LowerMapInfo(lower:"성남시 중원구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky7"), location:Location(lat:37.4305233, lgt:127.1372098)),
                LowerMapInfo(lower:"성남시 수정구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky8"), location:Location(lat:37.4503957, lgt:127.1456335)),
                LowerMapInfo(lower:"성남시 분당구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky9"), location:Location(lat:37.3828195, lgt:127.1189255)),
                LowerMapInfo(lower:"의정부시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky10"), location:Location(lat:37.7380776, lgt:127.0337644)),
                LowerMapInfo(lower:"안양시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky11"), location:Location(lat:37.3942906, lgt:126.9567534)),
                LowerMapInfo(lower:"안양시 만안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky12"), location:Location(lat:37.386649, lgt:126.932325)),
                LowerMapInfo(lower:"안양시 동안구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky13"), location:Location(lat:37.3925739, lgt:126.9513539)),
                LowerMapInfo(lower:"부천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky14"), location:Location(lat:37.5035483, lgt:126.7661814)),
                LowerMapInfo(lower:"광명시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky15"), location:Location(lat:37.4786175, lgt:126.8646504)),
                LowerMapInfo(lower:"평택시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky16"), location:Location(lat:36.992368, lgt:127.112763)),
                LowerMapInfo(lower:"동두천시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky17"), location:Location(lat:37.9036586, lgt:127.0606681)),
                LowerMapInfo(lower:"안산시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky18"), location:Location(lat:37.3219123, lgt:126.8308176)),
                LowerMapInfo(lower:"안산시 상록구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky19"), location:Location(lat:37.3006174, lgt:126.8469699)),
                LowerMapInfo(lower:"안산시 단원구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky20"), location:Location(lat:37.3195995, lgt:126.8121829)),
                LowerMapInfo(lower:"고양시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky21"), location:Location(lat:37.6583981, lgt:126.8319831)),
                LowerMapInfo(lower:"고양시 덕양구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky22"), location:Location(lat:37.6374334, lgt:126.8323586)),
                LowerMapInfo(lower:"고양시 일산동구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky23"), location:Location(lat:37.6587819, lgt:126.7751439)),
                LowerMapInfo(lower:"고양시 일산서구", mapInfo:MapInfo(area:"경기북부", audio:"city_ky24"), location:Location(lat:37.6750853, lgt:126.7507022)),
                LowerMapInfo(lower:"과천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky25"), location:Location(lat:37.429201, lgt:126.987638)),
                LowerMapInfo(lower:"구리시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky26"), location:Location(lat:37.5942607, lgt:127.1296364)),
                LowerMapInfo(lower:"남양주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky27"), location:Location(lat:37.6359836, lgt:127.2164716)),
                LowerMapInfo(lower:"오산시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky28"), location:Location(lat:37.1498893, lgt:127.077461)),
                LowerMapInfo(lower:"시흥시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky29"), location:Location(lat:37.380174, lgt:126.802938)),
                LowerMapInfo(lower:"군포시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky30"), location:Location(lat:37.3616098, lgt:126.9353314)),
                LowerMapInfo(lower:"의왕시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky31"), location:Location(lat:37.3448869, lgt:126.9682786)),
                LowerMapInfo(lower:"하남시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky32"), location:Location(lat:37.5393014, lgt:127.2148742)),
                LowerMapInfo(lower:"용인시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky33"), location:Location(lat:37.2410999, lgt:127.1775942)),
                LowerMapInfo(lower:"용인시 처인구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky34"), location:Location(lat:37.2343492, lgt:127.2013437)),
                LowerMapInfo(lower:"용인시 기흥구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky35"), location:Location(lat:37.280448, lgt:127.1146638)),
                LowerMapInfo(lower:"용인시 수지구", mapInfo:MapInfo(area:"경기남부", audio:"city_ky36"), location:Location(lat:37.3221695, lgt:127.0980422)),
                LowerMapInfo(lower:"파주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky37"), location:Location(lat:37.7599478, lgt:126.7798239)),
                LowerMapInfo(lower:"이천시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky38"), location:Location(lat:37.2725216, lgt:127.4351348)),
                LowerMapInfo(lower:"안성시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky39"), location:Location(lat:37.0080178, lgt:127.2796954)),
                LowerMapInfo(lower:"김포시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky40"), location:Location(lat:37.6152667, lgt:126.7156207)),
                LowerMapInfo(lower:"화성시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky41"), location:Location(lat:37.199565, lgt:126.8314045)),
                LowerMapInfo(lower:"광주시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky42"), location:Location(lat:37.4294306, lgt:127.2550476)),
                LowerMapInfo(lower:"양주시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky43"), location:Location(lat:37.7851887, lgt:127.0460634)),
                LowerMapInfo(lower:"포천시", mapInfo:MapInfo(area:"경기북부", audio:"city_ky44"), location:Location(lat:37.894867, lgt:127.2002404)),
                LowerMapInfo(lower:"여주시", mapInfo:MapInfo(area:"경기남부", audio:"city_ky45"), location:Location(lat:37.298342, lgt:127.637088)),
                LowerMapInfo(lower:"연천군", mapInfo:MapInfo(area:"경기북부", audio:"city_ky46"), location:Location(lat:38.0967354, lgt:127.0747624)),
                LowerMapInfo(lower:"가평군", mapInfo:MapInfo(area:"경기북부", audio:"city_ky47"), location:Location(lat:37.8315081, lgt:127.5095419)),
                LowerMapInfo(lower:"양평군", mapInfo:MapInfo(area:"경기남부", audio:"city_ky48"), location:Location(lat:37.4917935, lgt:127.4876064))]),
            
             UpperMapInfo(upper:"강원도", lowerList:
                [LowerMapInfo(lower:"춘천시", mapInfo:MapInfo(area:"영서", audio:"city_kw1"), location:Location(lat:37.8813145, lgt:127.7301492)),
                 LowerMapInfo(lower:"원주시", mapInfo:MapInfo(area:"영서", audio:"city_kw2"), location:Location(lat:37.341807, lgt:127.919575)),
                 LowerMapInfo(lower:"홍천군", mapInfo:MapInfo(area:"영서", audio:"city_kw3"), location:Location(lat:37.6972043, lgt:127.8885167)),
                 LowerMapInfo(lower:"횡성군", mapInfo:MapInfo(area:"영서", audio:"city_kw4"), location:Location(lat:37.4918057, lgt:127.9850237)),
                 LowerMapInfo(lower:"영월군", mapInfo:MapInfo(area:"영서", audio:"city_kw5"), location:Location(lat:37.1837694, lgt:128.4618517)),
                 LowerMapInfo(lower:"평창군", mapInfo:MapInfo(area:"영서", audio:"city_kw6"), location:Location(lat:37.370764, lgt:128.3901936)),
                 LowerMapInfo(lower:"정선군", mapInfo:MapInfo(area:"영서", audio:"city_kw7"), location:Location(lat:37.380607, lgt:128.660875)),
                 LowerMapInfo(lower:"철원군", mapInfo:MapInfo(area:"영서", audio:"city_kw8"), location:Location(lat:38.146682, lgt:127.313063)),
                 LowerMapInfo(lower:"화천군", mapInfo:MapInfo(area:"영서", audio:"city_kw9"), location:Location(lat:38.106182, lgt:127.7082124)),
                 LowerMapInfo(lower:"양구군", mapInfo:MapInfo(area:"영서", audio:"city_kw10"), location:Location(lat:38.1099904, lgt:127.99)),
                 LowerMapInfo(lower:"인제군", mapInfo:MapInfo(area:"영서", audio:"city_kw11"), location:Location(lat:38.0697297, lgt:128.1703553)),
                 LowerMapInfo(lower:"강릉시", mapInfo:MapInfo(area:"영동", audio:"city_kw12"), location:Location(lat:37.7521666, lgt:128.8758375)),
                 LowerMapInfo(lower:"동해시", mapInfo:MapInfo(area:"영동", audio:"city_kw13"), location:Location(lat:37.5247583, lgt:129.1142625)),
                 LowerMapInfo(lower:"태백시", mapInfo:MapInfo(area:"영동", audio:"city_kw14"), location:Location(lat:37.1641332, lgt:128.9857326)),
                 LowerMapInfo(lower:"속초시", mapInfo:MapInfo(area:"영동", audio:"city_kw15"), location:Location(lat:38.2071659, lgt:128.5918474)),
                 LowerMapInfo(lower:"삼척시", mapInfo:MapInfo(area:"영동", audio:"city_kw16"), location:Location(lat:37.450018, lgt:129.165125)),
                 LowerMapInfo(lower:"고성군", mapInfo:MapInfo(area:"영동", audio:"city_kw17"), location:Location(lat:38.3806154, lgt:128.4678625)),
                 LowerMapInfo(lower:"양양군", mapInfo:MapInfo(area:"영동", audio:"city_kw18"), location:Location(lat:38.0754857, lgt:128.6191535))]),
 
             UpperMapInfo(upper:"충청북도", lowerList:
                [LowerMapInfo(lower:"청주시", mapInfo:MapInfo(area:"충북", audio:"city_cb1"), location:Location(lat:36.6424987, lgt:127.488975)),
                 LowerMapInfo(lower:"청주시 상당구", mapInfo:MapInfo(area:"충북", audio:"city_cb2"), location:Location(lat:36.634745, lgt:127.488601)),
                 LowerMapInfo(lower:"청주시 서원구", mapInfo:MapInfo(area:"충북", audio:"city_cb3"), location:Location(lat:36.63769, lgt:127.469488)),
                 LowerMapInfo(lower:"청주시 흥덕구", mapInfo:MapInfo(area:"충북", audio:"city_cb4"), location:Location(lat:36.641475, lgt:127.431534)),
                 LowerMapInfo(lower:"청주시 청원구", mapInfo:MapInfo(area:"충북", audio:"city_cb5"), location:Location(lat:36.651581, lgt:127.486671)),
                 LowerMapInfo(lower:"충주시", mapInfo:MapInfo(area:"충북", audio:"city_cb6"), location:Location(lat:36.991105, lgt:127.9260146)),
                 LowerMapInfo(lower:"제천시", mapInfo:MapInfo(area:"충북", audio:"city_cb7"), location:Location(lat:37.1326438, lgt:128.1910398)),
                 LowerMapInfo(lower:"보은군", mapInfo:MapInfo(area:"충북", audio:"city_cb8"), location:Location(lat:36.4894561, lgt:127.729494)),
                 LowerMapInfo(lower:"옥천군", mapInfo:MapInfo(area:"충북", audio:"city_cb9"), location:Location(lat:36.3064735, lgt:127.571409)),
                 LowerMapInfo(lower:"영동군", mapInfo:MapInfo(area:"충북", audio:"city_cb10"), location:Location(lat:36.174983, lgt:127.7834221)),
                 LowerMapInfo(lower:"증평군", mapInfo:MapInfo(area:"충북", audio:"city_cb11"), location:Location(lat:36.785025, lgt:127.580988)),
                 LowerMapInfo(lower:"진천군", mapInfo:MapInfo(area:"충북", audio:"city_cb12"), location:Location(lat:36.8554218, lgt:127.4356097)),
                 LowerMapInfo(lower:"괴산군", mapInfo:MapInfo(area:"충북", audio:"city_cb13"), location:Location(lat:36.8153813, lgt:127.7867114)),
                 LowerMapInfo(lower:"음성군", mapInfo:MapInfo(area:"충북", audio:"city_cb14"), location:Location(lat:36.9399595, lgt:127.6905078)),
                LowerMapInfo(lower:"단양군", mapInfo:MapInfo(area:"충북", audio:"city_cb15"), location:Location(lat:36.984543, lgt:128.3655933))]),
 
             UpperMapInfo(upper:"충청남도", lowerList:
                [LowerMapInfo(lower:"천안시", mapInfo:MapInfo(area:"충남", audio:"city_cn1"), location:Location(lat:36.8151472, lgt:127.1138946)),
                 LowerMapInfo(lower:"천안시 동남구", mapInfo:MapInfo(area:"충남", audio:"city_cn2"), location:Location(lat:36.8070807, lgt:127.1503134)),
                 LowerMapInfo(lower:"천안시 서북구", mapInfo:MapInfo(area:"충남", audio:"city_cn3"), location:Location(lat:36.8784666, lgt:127.1546437)),
                 LowerMapInfo(lower:"공주시", mapInfo:MapInfo(area:"충남", audio:"city_cn4"), location:Location(lat:36.44656, lgt:127.119025)),
                 LowerMapInfo(lower:"보령시", mapInfo:MapInfo(area:"충남", audio:"city_cn5"), location:Location(lat:36.3334501, lgt:126.6128025)),
                 LowerMapInfo(lower:"아산시", mapInfo:MapInfo(area:"충남", audio:"city_cn6"), location:Location(lat:36.7900159, lgt:127.0024861)),
                 LowerMapInfo(lower:"서산시", mapInfo:MapInfo(area:"충남", audio:"city_cn7"), location:Location(lat:36.7848334, lgt:126.4502966)),
                 LowerMapInfo(lower:"논산시", mapInfo:MapInfo(area:"충남", audio:"city_cn8"), location:Location(lat:36.1872399, lgt:127.0986227)),
                 LowerMapInfo(lower:"계룡시", mapInfo:MapInfo(area:"충남", audio:"city_cn9"), location:Location(lat:36.2745503, lgt:127.2486359)),
                 LowerMapInfo(lower:"당진시", mapInfo:MapInfo(area:"충남", audio:"city_cn10"), location:Location(lat:36.8899935, lgt:126.646034)),
                 LowerMapInfo(lower:"금산군", mapInfo:MapInfo(area:"충남", audio:"city_cn11"), location:Location(lat:36.108857, lgt:127.488213)),
                 LowerMapInfo(lower:"부여군", mapInfo:MapInfo(area:"충남", audio:"city_cn12"), location:Location(lat:36.275658, lgt:126.909775)),
                 LowerMapInfo(lower:"서천군", mapInfo:MapInfo(area:"충남", audio:"city_cn13"), location:Location(lat:36.080283, lgt:126.691763)),
                 LowerMapInfo(lower:"청양군", mapInfo:MapInfo(area:"충남", audio:"city_cn14"), location:Location(lat:36.459151, lgt:126.802238)),
                 LowerMapInfo(lower:"홍성군", mapInfo:MapInfo(area:"충남", audio:"city_cn15"), location:Location(lat:36.601324, lgt:126.660775)),
                 LowerMapInfo(lower:"예산군", mapInfo:MapInfo(area:"충남", audio:"city_cn16"), location:Location(lat:36.68266, lgt:126.848888)),
                 LowerMapInfo(lower:"태안군", mapInfo:MapInfo(area:"충남", audio:"city_cn17"), location:Location(lat:36.74561, lgt:126.297913))]),
             
            UpperMapInfo(upper:"전라북도", lowerList:
                [LowerMapInfo(lower:"전주시", mapInfo:MapInfo(area:"전북", audio:"city_jb1"), location:Location(lat:35.8241706, lgt:127.1480532)),
                 LowerMapInfo(lower:"전주시 완산구", mapInfo:MapInfo(area:"전북", audio:"city_jb2"), location:Location(lat:35.8122, lgt:127.1198125)),
                 LowerMapInfo(lower:"전주시 덕진구", mapInfo:MapInfo(area:"전북", audio:"city_jb3"), location:Location(lat:35.8294, lgt:127.134362)),
                 LowerMapInfo(lower:"군산시", mapInfo:MapInfo(area:"전북", audio:"city_jb4"), location:Location(lat:35.9676262, lgt:126.736875)),
                 LowerMapInfo(lower:"익산시", mapInfo:MapInfo(area:"전북", audio:"city_jb5"), location:Location(lat:35.94826, lgt:126.9578)),
                 LowerMapInfo(lower:"정읍시", mapInfo:MapInfo(area:"전북", audio:"city_jb6"), location:Location(lat:35.569867, lgt:126.856038)),
                 LowerMapInfo(lower:"남원시", mapInfo:MapInfo(area:"전북", audio:"city_jb7"), location:Location(lat:35.416432, lgt:127.390438)),
                 LowerMapInfo(lower:"김제시", mapInfo:MapInfo(area:"전북", audio:"city_jb8"), location:Location(lat:35.8035916, lgt:126.8808375)),
                 LowerMapInfo(lower:"완주군", mapInfo:MapInfo(area:"전북", audio:"city_jb9"), location:Location(lat:35.9386377, lgt:127.1670852)),
                 LowerMapInfo(lower:"진안군", mapInfo:MapInfo(area:"전북", audio:"city_jb10"), location:Location(lat:35.7917621, lgt:127.424875)),
                 LowerMapInfo(lower:"무주군", mapInfo:MapInfo(area:"전북", audio:"city_jb11"), location:Location(lat:36.0068098, lgt:127.6608193)),
                 LowerMapInfo(lower:"장수군", mapInfo:MapInfo(area:"전북", audio:"city_jb12"), location:Location(lat:35.647299, lgt:127.521113)),
                 LowerMapInfo(lower:"임실군", mapInfo:MapInfo(area:"전북", audio:"city_jb13"), location:Location(lat:35.6178286, lgt:127.2890774)),
                 LowerMapInfo(lower:"순창군", mapInfo:MapInfo(area:"전북", audio:"city_jb14"), location:Location(lat:35.3744737, lgt:127.1374875)),
                 LowerMapInfo(lower:"고창군", mapInfo:MapInfo(area:"전북", audio:"city_jb15"), location:Location(lat:35.4358346, lgt:126.701975)),
                 LowerMapInfo(lower:"부안군", mapInfo:MapInfo(area:"전북", audio:"city_jb16"), location:Location(lat:35.731568, lgt:126.733513))]),

             UpperMapInfo(upper:"전라남도", lowerList:
                [LowerMapInfo(lower:"목포시", mapInfo:MapInfo(area:"전남", audio:"city_jn1"), location:Location(lat:34.811875, lgt:126.3923375)),
                 LowerMapInfo(lower:"여수시", mapInfo:MapInfo(area:"전남", audio:"city_jn2"), location:Location(lat:34.760425, lgt:127.662313)),
                 LowerMapInfo(lower:"순천시", mapInfo:MapInfo(area:"전남", audio:"city_jn3"), location:Location(lat:34.9507025, lgt:127.487243)),
                 LowerMapInfo(lower:"나주시", mapInfo:MapInfo(area:"전남", audio:"city_jn4"), location:Location(lat:35.0158173, lgt:126.7108174)),
                 LowerMapInfo(lower:"광양시", mapInfo:MapInfo(area:"전남", audio:"city_jn5"), location:Location(lat:34.9406575, lgt:127.6958987)),
                 LowerMapInfo(lower:"담양군", mapInfo:MapInfo(area:"전남", audio:"city_jn6"), location:Location(lat:35.321175, lgt:126.988175)),
                 LowerMapInfo(lower:"곡성군", mapInfo:MapInfo(area:"전남", audio:"city_jn7"), location:Location(lat:35.2820169, lgt:127.2919779)),
                 LowerMapInfo(lower:"구례군", mapInfo:MapInfo(area:"전남", audio:"city_jn8"), location:Location(lat:35.2025096, lgt:127.4629374)),
                 LowerMapInfo(lower:"고흥군", mapInfo:MapInfo(area:"전남", audio:"city_jn9"), location:Location(lat:34.6111892, lgt:127.2849536)),
                 LowerMapInfo(lower:"보성군", mapInfo:MapInfo(area:"전남", audio:"city_jn10"), location:Location(lat:34.7714897, lgt:127.0800605)),
                 LowerMapInfo(lower:"화순군", mapInfo:MapInfo(area:"전남", audio:"city_jn11"), location:Location(lat:35.0645238, lgt:126.986477)),
                 LowerMapInfo(lower:"장흥군", mapInfo:MapInfo(area:"전남", audio:"city_jn12"), location:Location(lat:34.6816346, lgt:126.907025)),
                 LowerMapInfo(lower:"강진군", mapInfo:MapInfo(area:"전남", audio:"city_jn13"), location:Location(lat:34.64209, lgt:126.7672)),
                 LowerMapInfo(lower:"해남군", mapInfo:MapInfo(area:"전남", audio:"city_jn14"), location:Location(lat:34.573558, lgt:126.599225)),
                 LowerMapInfo(lower:"영암군", mapInfo:MapInfo(area:"전남", audio:"city_jn15"), location:Location(lat:34.8001638, lgt:126.6967961)),
                 LowerMapInfo(lower:"무안군", mapInfo:MapInfo(area:"전남", audio:"city_jn16"), location:Location(lat:34.9904886, lgt:126.4817117)),
                 LowerMapInfo(lower:"함평군", mapInfo:MapInfo(area:"전남", audio:"city_jn17"), location:Location(lat:35.065929, lgt:126.5165816)),
                 LowerMapInfo(lower:"영광군", mapInfo:MapInfo(area:"전남", audio:"city_jn18"), location:Location(lat:35.2772127, lgt:126.5120143)),
                 LowerMapInfo(lower:"장성군", mapInfo:MapInfo(area:"전남", audio:"city_jn19"), location:Location(lat:35.3019056, lgt:126.7848003)),
                 LowerMapInfo(lower:"완도군", mapInfo:MapInfo(area:"전남", audio:"city_jn20"), location:Location(lat:34.3110392, lgt:126.7548524)),
                 LowerMapInfo(lower:"진도군", mapInfo:MapInfo(area:"전남", audio:"city_jn21"), location:Location(lat:34.486818, lgt:126.263475)),
                 LowerMapInfo(lower:"신안군", mapInfo:MapInfo(area:"전남", audio:"city_jn22"), location:Location(lat:34.833626, lgt:126.351124))]),
             
             UpperMapInfo(upper:"경상북도", lowerList:
                [LowerMapInfo(lower:"포항시", mapInfo:MapInfo(area:"경북", audio:"city_kb1"), location:Location(lat:36.0190333, lgt:129.3433898)),
                 LowerMapInfo(lower:"포항시 남구", mapInfo:MapInfo(area:"경북", audio:"city_kb2"), location:Location(lat:36.008767, lgt:129.359475)),
                 LowerMapInfo(lower:"포항시 북구", mapInfo:MapInfo(area:"경북", audio:"city_kb3"), location:Location(lat:36.041867, lgt:129.365688)),
                 LowerMapInfo(lower:"경주시", mapInfo:MapInfo(area:"경북", audio:"city_kb4"), location:Location(lat:35.8562583, lgt:129.2247556)),
                 LowerMapInfo(lower:"김천시", mapInfo:MapInfo(area:"경북", audio:"city_kb5"), location:Location(lat:36.1397715, lgt:128.1136148)),
                 LowerMapInfo(lower:"안동시", mapInfo:MapInfo(area:"경북", audio:"city_kb6"), location:Location(lat:36.568483, lgt:128.729537)),
                 LowerMapInfo(lower:"구미시", mapInfo:MapInfo(area:"경북", audio:"city_kb7"), location:Location(lat:36.1195987, lgt:128.3443)),
                 LowerMapInfo(lower:"영주시", mapInfo:MapInfo(area:"경북", audio:"city_kb8"), location:Location(lat:36.805667, lgt:128.624063)),
                 LowerMapInfo(lower:"영천시", mapInfo:MapInfo(area:"경북", audio:"city_kb9"), location:Location(lat:35.97326, lgt:128.938613)),
                 LowerMapInfo(lower:"상주시", mapInfo:MapInfo(area:"경북", audio:"city_kb10"), location:Location(lat:36.4109922, lgt:128.1592279)),
                 LowerMapInfo(lower:"문경시", mapInfo:MapInfo(area:"경북", audio:"city_kb11"), location:Location(lat:36.5865246, lgt:128.1867897)),
                 LowerMapInfo(lower:"경산시", mapInfo:MapInfo(area:"경북", audio:"city_kb12"), location:Location(lat:35.8250872, lgt:128.741206)),
                 LowerMapInfo(lower:"군위군", mapInfo:MapInfo(area:"경북", audio:"city_kb13"), location:Location(lat:36.2429424, lgt:128.572656)),
                 LowerMapInfo(lower:"의성군", mapInfo:MapInfo(area:"경북", audio:"city_kb14"), location:Location(lat:36.3527158, lgt:128.697171)),
                 LowerMapInfo(lower:"청송군", mapInfo:MapInfo(area:"경북", audio:"city_kb15"), location:Location(lat:36.4362793, lgt:129.0571262)),
                 LowerMapInfo(lower:"영양군", mapInfo:MapInfo(area:"경북", audio:"city_kb16"), location:Location(lat:36.6667174, lgt:129.1123838)),
                 LowerMapInfo(lower:"영덕군", mapInfo:MapInfo(area:"경북", audio:"city_kb17"), location:Location(lat:36.415099, lgt:129.365325)),
                 LowerMapInfo(lower:"청도군", mapInfo:MapInfo(area:"경북", audio:"city_kb18"), location:Location(lat:35.647399, lgt:128.733988)),
                 LowerMapInfo(lower:"고령군", mapInfo:MapInfo(area:"경북", audio:"city_kb19"), location:Location(lat:35.725968, lgt:128.262688)),
                 LowerMapInfo(lower:"성주군", mapInfo:MapInfo(area:"경북", audio:"city_kb20"), location:Location(lat:35.919176, lgt:128.282963)),
                 LowerMapInfo(lower:"칠곡군", mapInfo:MapInfo(area:"경북", audio:"city_kb21"), location:Location(lat:35.995593, lgt:128.401688)),
                 LowerMapInfo(lower:"예천군", mapInfo:MapInfo(area:"경북", audio:"city_kb22"), location:Location(lat:36.6577077, lgt:128.452868)),
                 LowerMapInfo(lower:"봉화군", mapInfo:MapInfo(area:"경북", audio:"city_kb23"), location:Location(lat:36.8931198, lgt:128.7325126)),
                 LowerMapInfo(lower:"울진군", mapInfo:MapInfo(area:"경북", audio:"city_kb24"), location:Location(lat:36.993085, lgt:129.4004)),
                 LowerMapInfo(lower:"울릉군", mapInfo:MapInfo(area:"경북", audio:"city_kb25"), location:Location(lat:37.484451, lgt:130.9057))]),
             
             UpperMapInfo(upper:"경상남도", lowerList:
                [LowerMapInfo(lower:"창원시", mapInfo:MapInfo(area:"경남", audio:"city_kn1"), location:Location(lat:35.227927, lgt:128.6818088)),
                 LowerMapInfo(lower:"창원시 의창구", mapInfo:MapInfo(area:"경남", audio:"city_kn2"), location:Location(lat:35.2540033, lgt:128.6401545)),
                 LowerMapInfo(lower:"창원시 성산구", mapInfo:MapInfo(area:"경남", audio:"city_kn3"), location:Location(lat:35.1983844, lgt:128.7029401)),
                 LowerMapInfo(lower:"창원시 마산합포구", mapInfo:MapInfo(area:"경남", audio:"city_kn4"), location:Location(lat:35.1968716, lgt:128.5678647)),
                 LowerMapInfo(lower:"창원시 마산회원구", mapInfo:MapInfo(area:"경남", audio:"city_kn5"), location:Location(lat:35.2209315, lgt:128.5797119)),
                 LowerMapInfo(lower:"창원시 진해구", mapInfo:MapInfo(area:"경남", audio:"city_kn6"), location:Location(lat:35.133061, lgt:128.7100858)),
                 LowerMapInfo(lower:"진주시", mapInfo:MapInfo(area:"경남", audio:"city_kn7"), location:Location(lat:35.1803282, lgt:128.1076539)),
                 LowerMapInfo(lower:"통영시", mapInfo:MapInfo(area:"경남", audio:"city_kn8"), location:Location(lat:34.85439, lgt:128.433112)),
                 LowerMapInfo(lower:"사천시", mapInfo:MapInfo(area:"경남", audio:"city_kn9"), location:Location(lat:35.0036556, lgt:128.0643501)),
                 LowerMapInfo(lower:"김해시", mapInfo:MapInfo(area:"경남", audio:"city_kn10"), location:Location(lat:35.2285766, lgt:128.8893277)),
                 LowerMapInfo(lower:"밀양시", mapInfo:MapInfo(area:"경남", audio:"city_kn11"), location:Location(lat:35.503833, lgt:128.7467)),
                 LowerMapInfo(lower:"거제시", mapInfo:MapInfo(area:"경남", audio:"city_kn12"), location:Location(lat:34.880457, lgt:128.621175)),
                 LowerMapInfo(lower:"양산시", mapInfo:MapInfo(area:"경남", audio:"city_kn13"), location:Location(lat:35.3350484, lgt:129.0373456)),
                 LowerMapInfo(lower:"의령군", mapInfo:MapInfo(area:"경남", audio:"city_kn14"), location:Location(lat:35.3222239, lgt:128.2616759)),
                 LowerMapInfo(lower:"함안군", mapInfo:MapInfo(area:"경남", audio:"city_kn15"), location:Location(lat:35.272333, lgt:128.406575)),
                 LowerMapInfo(lower:"창녕군", mapInfo:MapInfo(area:"경남", audio:"city_kn16"), location:Location(lat:35.5446109, lgt:128.4923476)),
                 LowerMapInfo(lower:"고성군", mapInfo:MapInfo(area:"경남", audio:"city_kn17"), location:Location(lat:34.9730975, lgt:128.3222643)),
                 LowerMapInfo(lower:"남해군", mapInfo:MapInfo(area:"경남", audio:"city_kn18"), location:Location(lat:34.837707, lgt:127.892475)),
                 LowerMapInfo(lower:"하동군", mapInfo:MapInfo(area:"경남", audio:"city_kn19"), location:Location(lat:35.067333, lgt:127.751275)),
                 LowerMapInfo(lower:"산청군", mapInfo:MapInfo(area:"경남", audio:"city_kn20"), location:Location(lat:35.415557, lgt:127.873463)),
                 LowerMapInfo(lower:"함양군", mapInfo:MapInfo(area:"경남", audio:"city_kn21"), location:Location(lat:35.520532, lgt:127.7252436)),
                 LowerMapInfo(lower:"거창군", mapInfo:MapInfo(area:"경남", audio:"city_kn22"), location:Location(lat:35.6866976, lgt:127.909534)),
                 LowerMapInfo(lower:"합천군", mapInfo:MapInfo(area:"경남", audio:"city_kn23"), location:Location(lat:35.5666646, lgt:128.1656881))]),

             UpperMapInfo(upper:"제주특별자치도", lowerList:
                [LowerMapInfo(lower:"제주시", mapInfo:MapInfo(area:"제주", audio:"city_je1"), location:Location(lat:33.499568, lgt:126.531138)),
                 LowerMapInfo(lower:"서귀포시", mapInfo:MapInfo(area:"제주", audio:"city_je2"), location:Location(lat:33.255592, lgt:126.510575))]),
                
             UpperMapInfo(upper:"세종특별자치시", lowerList:
                [LowerMapInfo(lower:"세종특별자치시", mapInfo:MapInfo(area:"세종", audio:"city_sj1"), location:Location(lat:36.5929071, lgt:127.292375))])

             
             
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
    
    
    func getLocation(addr:Address) -> Location? {
        
        for upperMapInfo in mapList{
            
            if upperMapInfo.getUpper() == addr.getUpper(){
                
                let lowerList = upperMapInfo.getLowerList()
                
                for lowerMapInfo in lowerList{
                    
                    
                    if lowerMapInfo.getLower() == addr.getLower(){
                        
                        return lowerMapInfo.getLocation()
                    }
                }
            }
        }
        
        return nil
    }
}
