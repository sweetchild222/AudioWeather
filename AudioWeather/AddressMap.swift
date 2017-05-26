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


class AddressMap{
    
    
    static let instance = AddressMap()

    let mapList:[String:[String:MapInfo]]
    
    
    init(){
        
        mapList =
            ["경기도":
                ["수원시": MapInfo(area:"경기남부", audio:"city_ky1"),
                 "수원시 장안구": MapInfo(area:"경기남부", audio:"city_ky2"),
                 "수원시 권선구": MapInfo(area:"경기남부", audio:"city_ky3"),
                 "수원시 팔달구": MapInfo(area:"경기남부", audio:"city_ky4"),
                 "수원시 영통구": MapInfo(area:"경기남부", audio:"city_ky5"),
                 "성남시": MapInfo(area:"경기남부", audio:"city_ky6"),
                 "성남시 중원구": MapInfo(area:"경기남부", audio:"city_ky7"),
                 "성남시 수정구": MapInfo(area:"경기남부", audio:"city_ky8"),
                 "성남시 분당구": MapInfo(area:"경기남부", audio:"city_ky9"),
                 "의정부시": MapInfo(area:"경기북부", audio:"city_ky10"),
                 "안양시": MapInfo(area:"경기남부", audio:"city_ky11"),
                 "안양시 만안구": MapInfo(area:"경기남부", audio:"city_ky12"),
                 "안양시 동안구": MapInfo(area:"경기남부", audio:"city_ky13"),
                 "부천시": MapInfo(area:"경기남부", audio:"city_ky14"),
                 "광명시": MapInfo(area:"경기남부", audio:"city_ky15"),
                 "평택시": MapInfo(area:"경기남부", audio:"city_ky16"),
                 "동두천시": MapInfo(area:"경기북부", audio:"city_ky17"),
                 "안산시": MapInfo(area:"경기남부", audio:"city_ky18"),
                 "안산시 상록구": MapInfo(area:"경기남부", audio:"city_ky19"),
                 "안산시 단원구": MapInfo(area:"경기남부", audio:"city_ky20"),
                 "고양시": MapInfo(area:"경기북부", audio:"city_ky21"),
                 "고양시 덕양구": MapInfo(area:"경기북부", audio:"city_ky22"),
                 "고양시 일산동구": MapInfo(area:"경기북부", audio:"city_ky23"),
                 "고양시 일산서구": MapInfo(area:"경기북부", audio:"city_ky24"),
                 "과천시": MapInfo(area:"경기남부", audio:"city_ky25"),
                 "구리시": MapInfo(area:"경기북부", audio:"city_ky26"),
                 "남양주시": MapInfo(area:"경기북부", audio:"city_ky27"),
                 "오산시": MapInfo(area:"경기남부", audio:"city_ky28"),
                 "시흥시": MapInfo(area:"경기남부", audio:"city_ky29"),
                 "군포시": MapInfo(area:"경기남부", audio:"city_ky30"),
                 "의왕시": MapInfo(area:"경기남부", audio:"city_ky31"),
                 "하남시": MapInfo(area:"경기남부", audio:"city_ky32"),
                 "용인시": MapInfo(area:"경기남부", audio:"city_ky33"),
                 "용인시 처인구": MapInfo(area:"경기남부", audio:"city_ky34"),
                 "용인시 기흥구": MapInfo(area:"경기남부", audio:"city_ky35"),
                 "용인시 수지구": MapInfo(area:"경기남부", audio:"city_ky36"),
                 "파주시": MapInfo(area:"경기북부", audio:"city_ky37"),
                 "이천시": MapInfo(area:"경기남부", audio:"city_ky38"),
                 "안성시": MapInfo(area:"경기남부", audio:"city_ky39"),
                 "김포시": MapInfo(area:"경기남부", audio:"city_ky40"),
                 "화성시": MapInfo(area:"경기남부", audio:"city_ky41"),
                 "광주시": MapInfo(area:"경기남부", audio:"city_ky42"),
                 "양주시": MapInfo(area:"경기북부", audio:"city_ky43"),
                 "포천시": MapInfo(area:"경기북부", audio:"city_ky44"),
                 "여주시": MapInfo(area:"경기남부", audio:"city_ky45"),
                 "연천군": MapInfo(area:"경기북부", audio:"city_ky46"),
                 "가평군": MapInfo(area:"경기북부", audio:"city_ky47"),
                 "양평군": MapInfo(area:"경기남부", audio:"city_ky48")
                ],
             
             "서울특별시":
                ["종로구": MapInfo(area:"서울", audio:"city_se1"),
                 "중구": MapInfo(area:"서울", audio:"city_se2"),
                 "용산구": MapInfo(area:"서울", audio:"city_se3"),
                 "성동구": MapInfo(area:"서울", audio:"city_se4"),
                 "광진구": MapInfo(area:"서울", audio:"city_se5"),
                 "동대문구": MapInfo(area:"서울", audio:"city_se6"),
                 "중랑구": MapInfo(area:"서울", audio:"city_se7"),
                 "성북구": MapInfo(area:"서울", audio:"city_se8"),
                 "강북구": MapInfo(area:"서울", audio:"city_se9"),
                 "도봉구": MapInfo(area:"서울", audio:"city_se10"),
                 "노원구": MapInfo(area:"서울", audio:"city_se11"),
                 "은평구": MapInfo(area:"서울", audio:"city_se12"),
                 "서대문구": MapInfo(area:"서울", audio:"city_se13"),
                 "마포구": MapInfo(area:"서울", audio:"city_se14"),
                 "양천구": MapInfo(area:"서울", audio:"city_se15"),
                 "강서구": MapInfo(area:"서울", audio:"city_se16"),
                 "구로구": MapInfo(area:"서울", audio:"city_se17"),
                 "금천구": MapInfo(area:"서울", audio:"city_se18"),
                 "영등포구": MapInfo(area:"서울", audio:"city_se19"),
                 "동작구": MapInfo(area:"서울", audio:"city_se20"),
                 "관악구": MapInfo(area:"서울", audio:"city_se21"),
                 "서초구": MapInfo(area:"서울", audio:"city_se22"),
                 "강남구": MapInfo(area:"서울", audio:"city_se23"),
                 "송파구": MapInfo(area:"서울", audio:"city_se24"),
                 "강동구": MapInfo(area:"서울", audio:"city_se25")
                ],
             
             "강원도":
                ["춘천시": MapInfo(area:"영서", audio:"city_kw1"),
                 "원주시": MapInfo(area:"영서", audio:"city_kw2"),
                 "홍천군": MapInfo(area:"영서", audio:"city_kw3"),
                 "횡성군": MapInfo(area:"영서", audio:"city_kw4"),
                 "영월군": MapInfo(area:"영서", audio:"city_kw5"),
                 "평창군": MapInfo(area:"영서", audio:"city_kw6"),
                 "정선군": MapInfo(area:"영서", audio:"city_kw7"),
                 "철원군": MapInfo(area:"영서", audio:"city_kw8"),
                 "화천군": MapInfo(area:"영서", audio:"city_kw9"),
                 "양구군": MapInfo(area:"영서", audio:"city_kw10"),
                 "인제군": MapInfo(area:"영서", audio:"city_kw11"),
                 "강릉시": MapInfo(area:"영동", audio:"city_kw12"),
                 "동해시": MapInfo(area:"영동", audio:"city_kw13"),
                 "태백시": MapInfo(area:"영동", audio:"city_kw14"),
                 "속초시": MapInfo(area:"영동", audio:"city_kw15"),
                 "삼척시": MapInfo(area:"영동", audio:"city_kw16"),
                 "고성군": MapInfo(area:"영동", audio:"city_kw17"),
                 "양양군": MapInfo(area:"영동", audio:"city_kw18")
                ],

             "충청남도":
                ["천안시": MapInfo(area:"충남", audio:"city_cn1"),
                 "천안시 동남구": MapInfo(area:"충남", audio:"city_cn2"),
                 "천안시 서북구": MapInfo(area:"충남", audio:"city_cn3"),
                 "공주시": MapInfo(area:"충남", audio:"city_cn4"),
                 "보령시": MapInfo(area:"충남", audio:"city_cn5"),
                 "아산시": MapInfo(area:"충남", audio:"city_cn6"),
                 "서산시": MapInfo(area:"충남", audio:"city_cn7"),
                 "논산시": MapInfo(area:"충남", audio:"city_cn8"),
                 "계룡시": MapInfo(area:"충남", audio:"city_cn9"),
                 "당진시": MapInfo(area:"충남", audio:"city_cn10"),
                 "금산군": MapInfo(area:"충남", audio:"city_cn11"),
                 "부여군": MapInfo(area:"충남", audio:"city_cn12"),
                 "서천군": MapInfo(area:"충남", audio:"city_cn13"),
                 "청양군": MapInfo(area:"충남", audio:"city_cn14"),
                 "홍성군": MapInfo(area:"충남", audio:"city_cn15"),
                 "예산군": MapInfo(area:"충남", audio:"city_cn16"),
                 "태안군": MapInfo(area:"충남", audio:"city_cn17")
                ],

             "충청북도":
                ["청주시": MapInfo(area:"충북", audio:"city_cb1"),
                 "청주시 상당구": MapInfo(area:"충북", audio:"city_cb2"),
                 "청주시 서원구": MapInfo(area:"충북", audio:"city_cb3"),
                 "청주시 흥덕구": MapInfo(area:"충북", audio:"city_cb4"),
                 "청주시 청원구": MapInfo(area:"충북", audio:"city_cb5"),
                 "충주시": MapInfo(area:"충북", audio:"city_cb6"),
                 "제천시": MapInfo(area:"충북", audio:"city_cb7"),
                 "보은군": MapInfo(area:"충북", audio:"city_cb8"),
                 "옥천군": MapInfo(area:"충북", audio:"city_cb9"),
                 "영동군": MapInfo(area:"충북", audio:"city_cb10"),
                 "증평군": MapInfo(area:"충북", audio:"city_cb11"),
                 "진천군": MapInfo(area:"충북", audio:"city_cb12"),
                 "괴산군": MapInfo(area:"충북", audio:"city_cb13"),
                 "음성군": MapInfo(area:"충북", audio:"city_cb14"),
                 "단양군": MapInfo(area:"충북", audio:"city_cb15")
                ],
             
             "전라북도":
                ["전주시": MapInfo(area:"전북", audio:"city_jb1"),
                 "전주시 완산구": MapInfo(area:"전북", audio:"city_jb2"),
                 "전주시 덕진구": MapInfo(area:"전북", audio:"city_jb3"),
                 "군산시": MapInfo(area:"전북", audio:"city_jb4"),
                 "익산시": MapInfo(area:"전북", audio:"city_jb5"),
                 "정읍시": MapInfo(area:"전북", audio:"city_jb6"),
                 "남원시": MapInfo(area:"전북", audio:"city_jb7"),
                 "김제시": MapInfo(area:"전북", audio:"city_jb8"),
                 "완주군": MapInfo(area:"전북", audio:"city_jb9"),
                 "진안군": MapInfo(area:"전북", audio:"city_jb10"),
                 "무주군": MapInfo(area:"전북", audio:"city_jb11"),
                 "장수군": MapInfo(area:"전북", audio:"city_jb12"),
                 "임실군": MapInfo(area:"전북", audio:"city_jb13"),
                 "순창군": MapInfo(area:"전북", audio:"city_jb14"),
                 "고창군": MapInfo(area:"전북", audio:"city_jb15"),
                 "부안군": MapInfo(area:"전북", audio:"city_jb16")
                ],
             
             "전라남도":
                ["목포시": MapInfo(area:"전남", audio:"city_jn1"),
                 "여수시": MapInfo(area:"전남", audio:"city_jn2"),
                 "순천시": MapInfo(area:"전남", audio:"city_jn3"),
                 "나주시": MapInfo(area:"전남", audio:"city_jn4"),
                 "광양시": MapInfo(area:"전남", audio:"city_jn5"),
                 "담양군": MapInfo(area:"전남", audio:"city_jn6"),
                 "곡성군": MapInfo(area:"전남", audio:"city_jn7"),
                 "구례군": MapInfo(area:"전남", audio:"city_jn8"),
                 "고흥군": MapInfo(area:"전남", audio:"city_jn9"),
                 "보성군": MapInfo(area:"전남", audio:"city_jn10"),
                 "화순군": MapInfo(area:"전남", audio:"city_jn11"),
                 "장흥군": MapInfo(area:"전남", audio:"city_jn12"),
                 "강진군": MapInfo(area:"전남", audio:"city_jn13"),
                 "해남군": MapInfo(area:"전남", audio:"city_jn14"),
                 "영암군": MapInfo(area:"전남", audio:"city_jn15"),
                 "무안군": MapInfo(area:"전남", audio:"city_jn16"),
                 "함평군": MapInfo(area:"전남", audio:"city_jn17"),
                 "영광군": MapInfo(area:"전남", audio:"city_jn18"),
                 "장성군": MapInfo(area:"전남", audio:"city_jn19"),
                 "완도군": MapInfo(area:"전남", audio:"city_jn20"),
                 "진도군": MapInfo(area:"전남", audio:"city_jn21"),
                 "신안군": MapInfo(area:"전남", audio:"city_jn22")
                ],
             
             "경상남도":
                ["창원시": MapInfo(area:"경남", audio:"city_kn1"),
                 "창원시 의창구": MapInfo(area:"경남", audio:"city_kn2"),
                 "창원시 성산구": MapInfo(area:"경남", audio:"city_kn3"),
                 "창원시 마산합포구": MapInfo(area:"경남", audio:"city_kn4"),
                 "창원시 마산회원구": MapInfo(area:"경남", audio:"city_kn5"),
                 "창원시 진해구": MapInfo(area:"경남", audio:"city_kn6"),
                 "진주시": MapInfo(area:"경남", audio:"city_kn7"),
                 "통영시": MapInfo(area:"경남", audio:"city_kn8"),
                 "사천시": MapInfo(area:"경남", audio:"city_kn9"),
                 "김해시": MapInfo(area:"경남", audio:"city_kn10"),
                 "밀양시": MapInfo(area:"경남", audio:"city_kn11"),
                 "거제시": MapInfo(area:"경남", audio:"city_kn12"),
                 "양산시": MapInfo(area:"경남", audio:"city_kn13"),
                 "의령군": MapInfo(area:"경남", audio:"city_kn14"),
                 "함안군": MapInfo(area:"경남", audio:"city_kn15"),
                 "창녕군": MapInfo(area:"경남", audio:"city_kn16"),
                 "고성군": MapInfo(area:"경남", audio:"city_kn17"),
                 "남해군": MapInfo(area:"경남", audio:"city_kn18"),
                 "하동군": MapInfo(area:"경남", audio:"city_kn19"),
                 "산청군": MapInfo(area:"경남", audio:"city_kn20"),
                 "함양군": MapInfo(area:"경남", audio:"city_kn21"),
                 "거창군": MapInfo(area:"경남", audio:"city_kn22"),
                 "합천군": MapInfo(area:"경남", audio:"city_kn23")
                ],
             
             "경상북도":
                ["포항시": MapInfo(area:"경북", audio:"city_kb1"),
                 "포항시 남구": MapInfo(area:"경북", audio:"city_kb2"),
                 "포항시 북구": MapInfo(area:"경북", audio:"city_kb3"),
                 "경주시": MapInfo(area:"경북", audio:"city_kb4"),
                 "김천시": MapInfo(area:"경북", audio:"city_kb5"),
                 "안동시": MapInfo(area:"경북", audio:"city_kb6"),
                 "구미시": MapInfo(area:"경북", audio:"city_kb7"),
                 "영주시": MapInfo(area:"경북", audio:"city_kb8"),
                 "영천시": MapInfo(area:"경북", audio:"city_kb9"),
                 "상주시": MapInfo(area:"경북", audio:"city_kb10"),
                 "문경시": MapInfo(area:"경북", audio:"city_kb11"),
                 "경산시": MapInfo(area:"경북", audio:"city_kb12"),
                 "군위군": MapInfo(area:"경북", audio:"city_kb13"),
                 "의성군": MapInfo(area:"경북", audio:"city_kb14"),
                 "청송군": MapInfo(area:"경북", audio:"city_kb15"),
                 "영양군": MapInfo(area:"경북", audio:"city_kb16"),
                 "영덕군": MapInfo(area:"경북", audio:"city_kb17"),
                 "청도군": MapInfo(area:"경북", audio:"city_kb18"),
                 "고령군": MapInfo(area:"경북", audio:"city_kb19"),
                 "성주군": MapInfo(area:"경북", audio:"city_kb20"),
                 "칠곡군": MapInfo(area:"경북", audio:"city_kb21"),
                 "예천군": MapInfo(area:"경북", audio:"city_kb22"),
                 "봉화군": MapInfo(area:"경북", audio:"city_kb23"),
                 "울진군": MapInfo(area:"경북", audio:"city_kb24"),
                 "울릉군": MapInfo(area:"경북", audio:"city_kb25")
                ],
             
             "부산광역시":
                ["중구": MapInfo(area:"부산", audio:"city_pu1"),
                 "서구": MapInfo(area:"부산", audio:"city_pu2"),
                 "동구": MapInfo(area:"부산", audio:"city_pu3"),
                 "영도구": MapInfo(area:"부산", audio:"city_pu4"),
                 "부산진구": MapInfo(area:"부산", audio:"city_pu5"),
                 "동래구": MapInfo(area:"부산", audio:"city_pu6"),
                 "남구": MapInfo(area:"부산", audio:"city_pu7"),
                 "북구": MapInfo(area:"부산", audio:"city_pu8"),
                 "해운대구": MapInfo(area:"부산", audio:"city_pu9"),
                 "사하구": MapInfo(area:"부산", audio:"city_pu10"),
                 "금정구": MapInfo(area:"부산", audio:"city_pu11"),
                 "강서구": MapInfo(area:"부산", audio:"city_pu12"),
                 "연제구": MapInfo(area:"부산", audio:"city_pu13"),
                 "수영구": MapInfo(area:"부산", audio:"city_pu14"),
                 "사상구": MapInfo(area:"부산", audio:"city_pu15"),
                 "기장군": MapInfo(area:"부산", audio:"city_pu116")
                ],
             
             "울산광역시":
                ["중구": MapInfo(area:"울산", audio:"city_ul1"),
                 "남구": MapInfo(area:"울산", audio:"city_ul2"),
                 "동구": MapInfo(area:"울산", audio:"city_ul3"),
                 "북구": MapInfo(area:"울산", audio:"city_ul4"),
                 "울주군": MapInfo(area:"울산", audio:"city_ul5")
                ],
             
             "대구광역시":
                ["중구": MapInfo(area:"대구", audio:"city_tk1"),
                 "동구": MapInfo(area:"대구", audio:"city_tk2"),
                 "서구": MapInfo(area:"대구", audio:"city_tk3"),
                 "남구": MapInfo(area:"대구", audio:"city_tk4"),
                 "북구": MapInfo(area:"대구", audio:"city_tk5"),
                 "수성구": MapInfo(area:"대구", audio:"city_tk6"),
                 "달서구": MapInfo(area:"대구", audio:"city_tk7"),
                 "달성군": MapInfo(area:"대구", audio:"city_tk8")
                ],
             
             "대전광역시":
                ["동구": MapInfo(area:"대전", audio:"city_dj1"),
                 "중구": MapInfo(area:"대전", audio:"city_dj2"),
                 "서구": MapInfo(area:"대전", audio:"city_dj3"),
                 "유성구": MapInfo(area:"대전", audio:"city_dj4"),
                 "대덕구": MapInfo(area:"대전", audio:"city_dj5")
                ],

             "광주광역시":
                ["동구": MapInfo(area:"광주", audio:"city_kj1"),
                 "서구": MapInfo(area:"광주", audio:"city_kj2"),
                 "남구": MapInfo(area:"광주", audio:"city_kj3"),
                 "북구": MapInfo(area:"광주", audio:"city_kj4"),
                 "광산구": MapInfo(area:"광주", audio:"city_kj5")
                ],

             "세종특별자치시":
                ["세종특별자치시": MapInfo(area:"세종", audio:"city_sj1")
                ],
             
             "인천광역시":
                ["중구": MapInfo(area:"인천", audio:"city_ic1"),
                 "동구": MapInfo(area:"인천", audio:"city_ic2"),
                 "남구": MapInfo(area:"인천", audio:"city_ic3"),
                 "연수구": MapInfo(area:"인천", audio:"city_ic4"),
                 "남동구": MapInfo(area:"인천", audio:"city_ic5"),
                 "부평구": MapInfo(area:"인천", audio:"city_ic6"),
                 "계양구": MapInfo(area:"인천", audio:"city_ic7"),
                 "서구": MapInfo(area:"인천", audio:"city_ic8"),
                 "강화군": MapInfo(area:"인천", audio:"city_ic9"),
                 "옹진군": MapInfo(area:"인천", audio:"city_ic10")
                ],

             "제주특별자치도":
                ["제주시": MapInfo(area:"제주", audio:"city_je1"),
                 "서귀포시": MapInfo(area:"제주", audio:"city_je1")
                ]
            ]
    }
    
    
    func getMapInfo(addr:Address) -> MapInfo? {
        
        let value = self.mapList[addr.getUpper()]?[addr.getLower()]
        
        return value
    }
}
