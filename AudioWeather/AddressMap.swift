//
//  AddressMap.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 12..
//  Copyright © 2017년 최인국. All rights reserved.
//

import Foundation


class MapInfo{
    

    
    init(area:String, resouceID:Int){
        
    }
    
}


class AddressMap{
    

    let mapList:[String:[String:MapInfo]]
    
    
    init(){
        
        mapList =
            ["경기도":
                ["수원시": MapInfo(area:"경기남부", resouceID:3),
                 "수원시 장안구": MapInfo(area:"경기남부", resouceID:3),
                 "수원시 권선구": MapInfo(area:"경기남부", resouceID:3),
                 "수원시 팔달구": MapInfo(area:"경기남부", resouceID:3),
                 "수원시 영통구": MapInfo(area:"경기남부", resouceID:3),
                 "성남시": MapInfo(area:"경기남부", resouceID:3),
                 "성남시 중원구": MapInfo(area:"경기남부", resouceID:3),
                 "성남시 수정구": MapInfo(area:"경기남부", resouceID:3),
                 "성남시 분당구": MapInfo(area:"경기남부", resouceID:3),
                 "의정부시": MapInfo(area:"경기북부", resouceID:3),
                 "안양시": MapInfo(area:"경기남부", resouceID:3),
                 "안양시 만안구": MapInfo(area:"경기남부", resouceID:3),
                 "안양시 동안구": MapInfo(area:"경기남부", resouceID:3),
                 "부천시": MapInfo(area:"경기남부", resouceID:3),
                 "광명시": MapInfo(area:"경기남부", resouceID:3),
                 "평택시": MapInfo(area:"경기남부", resouceID:3),
                 "동두천시": MapInfo(area:"경기북부", resouceID:3),
                 "안산시": MapInfo(area:"경기남부", resouceID:3),
                 "안산시 상록구": MapInfo(area:"경기남부", resouceID:3),
                 "안산시 단원구": MapInfo(area:"경기남부", resouceID:3),
                 "고양시": MapInfo(area:"경기북부", resouceID:3),
                 "고양시 덕양구": MapInfo(area:"경기북부", resouceID:3),
                 "고양시 일산동구": MapInfo(area:"경기북부", resouceID:3),
                 "고양시 일산서구": MapInfo(area:"경기북부", resouceID:3),
                 "과천시": MapInfo(area:"경기남부", resouceID:3),
                 "구리시": MapInfo(area:"경기북부", resouceID:3),
                 "남양주시": MapInfo(area:"경기북부", resouceID:3),
                 "오산시": MapInfo(area:"경기남부", resouceID:3),
                 "시흥시": MapInfo(area:"경기남부", resouceID:3),
                 "군포시": MapInfo(area:"경기남부", resouceID:3),
                 "의왕시": MapInfo(area:"경기남부", resouceID:3),
                 "하남시": MapInfo(area:"경기남부", resouceID:3),
                 "용인시": MapInfo(area:"경기남부", resouceID:3),
                 "용인시 처인구": MapInfo(area:"경기남부", resouceID:3),
                 "용인시 기흥구": MapInfo(area:"경기남부", resouceID:3),
                 "용인시 수지구": MapInfo(area:"경기남부", resouceID:3),
                 "파주시": MapInfo(area:"경기북부", resouceID:3),
                 "이천시": MapInfo(area:"경기남부", resouceID:3),
                 "안성시": MapInfo(area:"경기남부", resouceID:3),
                 "김포시": MapInfo(area:"경기남부", resouceID:3),
                 "화성시": MapInfo(area:"경기남부", resouceID:3),
                 "광주시": MapInfo(area:"경기남부", resouceID:3),
                 "양주시": MapInfo(area:"경기북부", resouceID:3),
                 "포천시": MapInfo(area:"경기북부", resouceID:3),
                 "여주시": MapInfo(area:"경기남부", resouceID:3),
                 "연천군": MapInfo(area:"경기북부", resouceID:3),
                 "가평군": MapInfo(area:"경기북부", resouceID:3),
                 "양평군": MapInfo(area:"경기남부", resouceID:3)
                ],
             
             "서울특별시":
                ["종로구": MapInfo(area:"서울", resouceID:3),
                 "중구": MapInfo(area:"서울", resouceID:3),
                 "용산구": MapInfo(area:"서울", resouceID:3),
                 "성동구": MapInfo(area:"서울", resouceID:3),
                 "광진구": MapInfo(area:"서울", resouceID:3),
                 "동대문구": MapInfo(area:"서울", resouceID:3),
                 "중랑구": MapInfo(area:"서울", resouceID:3),
                 "성북구": MapInfo(area:"서울", resouceID:3),
                 "강북구": MapInfo(area:"서울", resouceID:3),
                 "도봉구": MapInfo(area:"서울", resouceID:3),
                 "노원구": MapInfo(area:"서울", resouceID:3),
                 "은평구": MapInfo(area:"서울", resouceID:3),
                 "서대문구": MapInfo(area:"서울", resouceID:3),
                 "마포구": MapInfo(area:"서울", resouceID:3),
                 "양천구": MapInfo(area:"서울", resouceID:3),
                 "강서구": MapInfo(area:"서울", resouceID:3),
                 "구로구": MapInfo(area:"서울", resouceID:3),
                 "금천구": MapInfo(area:"서울", resouceID:3),
                 "영등포구": MapInfo(area:"서울", resouceID:3),
                 "동작구": MapInfo(area:"서울", resouceID:3),
                 "관악구": MapInfo(area:"서울", resouceID:3),
                 "서초구": MapInfo(area:"서울", resouceID:3),
                 "강남구": MapInfo(area:"서울", resouceID:3),
                 "송파구": MapInfo(area:"서울", resouceID:3),
                 "강동구": MapInfo(area:"서울", resouceID:3)
                ],
             
             "강원도":
                ["춘천시": MapInfo(area:"영서", resouceID:3),
                 "원주시": MapInfo(area:"영서", resouceID:3),
                 "홍천군": MapInfo(area:"영서", resouceID:3),
                 "횡성군": MapInfo(area:"영서", resouceID:3),
                 "영월군": MapInfo(area:"영서", resouceID:3),
                 "평창군": MapInfo(area:"영서", resouceID:3),
                 "정선군": MapInfo(area:"영서", resouceID:3),
                 "철원군": MapInfo(area:"영서", resouceID:3),
                 "화천군": MapInfo(area:"영서", resouceID:3),
                 "양구군": MapInfo(area:"영서", resouceID:3),
                 "인제군": MapInfo(area:"영서", resouceID:3),
                 "강릉시": MapInfo(area:"영동", resouceID:3),
                 "동해시": MapInfo(area:"영동", resouceID:3),
                 "태백시": MapInfo(area:"영동", resouceID:3),
                 "속초시": MapInfo(area:"영동", resouceID:3),
                 "삼척시": MapInfo(area:"영동", resouceID:3),
                 "고성군": MapInfo(area:"영동", resouceID:3),
                 "양양군": MapInfo(area:"영동", resouceID:3)
                ],

             "충청남도":
                ["천안시": MapInfo(area:"충남", resouceID:3),
                 "천안시 동남구": MapInfo(area:"충남", resouceID:3),
                 "천안시 서북구": MapInfo(area:"충남", resouceID:3),
                 "공주시": MapInfo(area:"충남", resouceID:3),
                 "보령시": MapInfo(area:"충남", resouceID:3),
                 "아산시": MapInfo(area:"충남", resouceID:3),
                 "서산시": MapInfo(area:"충남", resouceID:3),
                 "논산시": MapInfo(area:"충남", resouceID:3),
                 "계룡시": MapInfo(area:"충남", resouceID:3),
                 "당진시": MapInfo(area:"충남", resouceID:3),
                 "금산군": MapInfo(area:"충남", resouceID:3),
                 "부여군": MapInfo(area:"충남", resouceID:3),
                 "서천군": MapInfo(area:"충남", resouceID:3),
                 "청양군": MapInfo(area:"충남", resouceID:3),
                 "홍성군": MapInfo(area:"충남", resouceID:3),
                 "예산군": MapInfo(area:"충남", resouceID:3),
                 "태안군": MapInfo(area:"충남", resouceID:3)
                ],

             "충청북도":
                ["청주시": MapInfo(area:"충북", resouceID:3),
                 "청주시 상당구": MapInfo(area:"충북", resouceID:3),
                 "청주시 서원구": MapInfo(area:"충북", resouceID:3),
                 "청주시 흥덕구": MapInfo(area:"충북", resouceID:3),
                 "청주시 청원구": MapInfo(area:"충북", resouceID:3),
                 "충주시": MapInfo(area:"충북", resouceID:3),
                 "제천시": MapInfo(area:"충북", resouceID:3),
                 "보은군": MapInfo(area:"충북", resouceID:3),
                 "옥천군": MapInfo(area:"충북", resouceID:3),
                 "영동군": MapInfo(area:"충북", resouceID:3),
                 "증평군": MapInfo(area:"충북", resouceID:3),
                 "진천군": MapInfo(area:"충북", resouceID:3),
                 "괴산군": MapInfo(area:"충북", resouceID:3),
                 "음성군": MapInfo(area:"충북", resouceID:3),
                 "단양군": MapInfo(area:"충북", resouceID:3)
                ],
             
             "전라북도":
                ["전주시": MapInfo(area:"전북", resouceID:3),
                 "전주시 완산구": MapInfo(area:"전북", resouceID:3),
                 "전주시 덕진구": MapInfo(area:"전북", resouceID:3),
                 "군산시": MapInfo(area:"전북", resouceID:3),
                 "익산시": MapInfo(area:"전북", resouceID:3),
                 "정읍시": MapInfo(area:"전북", resouceID:3),
                 "남원시": MapInfo(area:"전북", resouceID:3),
                 "김제시": MapInfo(area:"전북", resouceID:3),
                 "완주군": MapInfo(area:"전북", resouceID:3),
                 "진안군": MapInfo(area:"전북", resouceID:3),
                 "무주군": MapInfo(area:"전북", resouceID:3),
                 "장수군": MapInfo(area:"전북", resouceID:3),
                 "임실군": MapInfo(area:"전북", resouceID:3),
                 "순창군": MapInfo(area:"전북", resouceID:3),
                 "고창군": MapInfo(area:"전북", resouceID:3),
                 "부안군": MapInfo(area:"전북", resouceID:3)
                ],
             
             "전라남도":
                ["목포시": MapInfo(area:"전남", resouceID:3),
                 "여수시": MapInfo(area:"전남", resouceID:3),
                 "순천시": MapInfo(area:"전남", resouceID:3),
                 "나주시": MapInfo(area:"전남", resouceID:3),
                 "광양시": MapInfo(area:"전남", resouceID:3),
                 "담양군": MapInfo(area:"전남", resouceID:3),
                 "곡성군": MapInfo(area:"전남", resouceID:3),
                 "구례군": MapInfo(area:"전남", resouceID:3),
                 "고흥군": MapInfo(area:"전남", resouceID:3),
                 "보성군": MapInfo(area:"전남", resouceID:3),
                 "화순군": MapInfo(area:"전남", resouceID:3),
                 "장흥군": MapInfo(area:"전남", resouceID:3),
                 "강진군": MapInfo(area:"전남", resouceID:3),
                 "해남군": MapInfo(area:"전남", resouceID:3),
                 "영암군": MapInfo(area:"전남", resouceID:3),
                 "무안군": MapInfo(area:"전남", resouceID:3),
                 "함평군": MapInfo(area:"전남", resouceID:3),
                 "영광군": MapInfo(area:"전남", resouceID:3),
                 "장성군": MapInfo(area:"전남", resouceID:3),
                 "완도군": MapInfo(area:"전남", resouceID:3),
                 "진도군": MapInfo(area:"전남", resouceID:3),
                 "신안군": MapInfo(area:"전남", resouceID:3)
                ],
             
             "경상남도":
                ["창원시": MapInfo(area:"경남", resouceID:3),
                 "창원시 의창구": MapInfo(area:"경남", resouceID:3),
                 "창원시 성산구": MapInfo(area:"경남", resouceID:3),
                 "창원시 마산합포구": MapInfo(area:"경남", resouceID:3),
                 "창원시 마산회원구": MapInfo(area:"경남", resouceID:3),
                 "창원시 진해구": MapInfo(area:"경남", resouceID:3),
                 "진주시": MapInfo(area:"경남", resouceID:3),
                 "통영시": MapInfo(area:"경남", resouceID:3),
                 "사천시": MapInfo(area:"경남", resouceID:3),
                 "김해시": MapInfo(area:"경남", resouceID:3),
                 "밀양시": MapInfo(area:"경남", resouceID:3),
                 "거제시": MapInfo(area:"경남", resouceID:3),
                 "양산시": MapInfo(area:"경남", resouceID:3),
                 "의령군": MapInfo(area:"경남", resouceID:3),
                 "함안군": MapInfo(area:"경남", resouceID:3),
                 "창녕군": MapInfo(area:"경남", resouceID:3),
                 "고성군": MapInfo(area:"경남", resouceID:3),
                 "남해군": MapInfo(area:"경남", resouceID:3),
                 "하동군": MapInfo(area:"경남", resouceID:3),
                 "산청군": MapInfo(area:"경남", resouceID:3),
                 "함양군": MapInfo(area:"경남", resouceID:3),
                 "거창군": MapInfo(area:"경남", resouceID:3),
                 "합천군": MapInfo(area:"경남", resouceID:3)
                ],
             
             "경상북도":
                ["포항시": MapInfo(area:"경북", resouceID:3),
                 "포항시 남구": MapInfo(area:"경북", resouceID:3),
                 "포항시 북구": MapInfo(area:"경북", resouceID:3),
                 "경주시": MapInfo(area:"경북", resouceID:3),
                 "김천시": MapInfo(area:"경북", resouceID:3),
                 "안동시": MapInfo(area:"경북", resouceID:3),
                 "구미시": MapInfo(area:"경북", resouceID:3),
                 "영주시": MapInfo(area:"경북", resouceID:3),
                 "영천시": MapInfo(area:"경북", resouceID:3),
                 "상주시": MapInfo(area:"경북", resouceID:3),
                 "문경시": MapInfo(area:"경북", resouceID:3),
                 "경산시": MapInfo(area:"경북", resouceID:3),
                 "군위군": MapInfo(area:"경북", resouceID:3),
                 "의성군": MapInfo(area:"경북", resouceID:3),
                 "청송군": MapInfo(area:"경북", resouceID:3),
                 "영양군": MapInfo(area:"경북", resouceID:3),
                 "영덕군": MapInfo(area:"경북", resouceID:3),
                 "청도군": MapInfo(area:"경북", resouceID:3),
                 "고령군": MapInfo(area:"경북", resouceID:3),
                 "성주군": MapInfo(area:"경북", resouceID:3),
                 "칠곡군": MapInfo(area:"경북", resouceID:3),
                 "예천군": MapInfo(area:"경북", resouceID:3),
                 "봉화군": MapInfo(area:"경북", resouceID:3),
                 "울진군": MapInfo(area:"경북", resouceID:3),
                 "울릉군": MapInfo(area:"경북", resouceID:3)
                ],
             
             "부산광역시":
                ["중구": MapInfo(area:"부산", resouceID:3),
                 "서구": MapInfo(area:"부산", resouceID:3),
                 "동구": MapInfo(area:"부산", resouceID:3),
                 "영도구": MapInfo(area:"부산", resouceID:3),
                 "부산진구": MapInfo(area:"부산", resouceID:3),
                 "동래구": MapInfo(area:"부산", resouceID:3),
                 "남구": MapInfo(area:"부산", resouceID:3),
                 "북구": MapInfo(area:"부산", resouceID:3),
                 "해운대구": MapInfo(area:"부산", resouceID:3),
                 "사하구": MapInfo(area:"부산", resouceID:3),
                 "금정구": MapInfo(area:"부산", resouceID:3),
                 "강서구": MapInfo(area:"부산", resouceID:3),
                 "연제구": MapInfo(area:"부산", resouceID:3),
                 "수영구": MapInfo(area:"부산", resouceID:3),
                 "사상구": MapInfo(area:"부산", resouceID:3),
                 "기장군": MapInfo(area:"부산", resouceID:3)
                ],
             
             "울산광역시":
                ["중구": MapInfo(area:"울산", resouceID:3),
                 "남구": MapInfo(area:"울산", resouceID:3),
                 "동구": MapInfo(area:"울산", resouceID:3),
                 "북구": MapInfo(area:"울산", resouceID:3),
                 "울주군": MapInfo(area:"울산", resouceID:3)
                ],
             
             "대구광역시":
                ["중구": MapInfo(area:"대구", resouceID:3),
                 "동구": MapInfo(area:"대구", resouceID:3),
                 "서구": MapInfo(area:"대구", resouceID:3),
                 "남구": MapInfo(area:"대구", resouceID:3),
                 "북구": MapInfo(area:"대구", resouceID:3),
                 "수성구": MapInfo(area:"대구", resouceID:3),
                 "달서구": MapInfo(area:"대구", resouceID:3),
                 "달성군": MapInfo(area:"대구", resouceID:3)
                ],
             
             "대전광역시":
                ["동구": MapInfo(area:"대전", resouceID:3),
                 "중구": MapInfo(area:"대전", resouceID:3),
                 "서구": MapInfo(area:"대전", resouceID:3),
                 "유성구": MapInfo(area:"대전", resouceID:3),
                 "대덕구": MapInfo(area:"대전", resouceID:3)
                ],

             "광주광역시":
                ["동구": MapInfo(area:"광주", resouceID:3),
                 "서구": MapInfo(area:"광주", resouceID:3),
                 "남구": MapInfo(area:"광주", resouceID:3),
                 "북구": MapInfo(area:"광주", resouceID:3),
                 "광산구": MapInfo(area:"광주", resouceID:3)
                ],

             "세종특별자치시":
                ["세종특별자치시": MapInfo(area:"세종", resouceID:3)
                ],
             
             "인천광역시":
                ["중구": MapInfo(area:"인천", resouceID:3),
                 "동구": MapInfo(area:"인천", resouceID:3),
                 "남구": MapInfo(area:"인천", resouceID:3),
                 "연수구": MapInfo(area:"인천", resouceID:3),
                 "남동구": MapInfo(area:"인천", resouceID:3),
                 "부평구": MapInfo(area:"인천", resouceID:3),
                 "계양구": MapInfo(area:"인천", resouceID:3),
                 "서구": MapInfo(area:"인천", resouceID:3),
                 "강화군": MapInfo(area:"인천", resouceID:3),
                 "옹진군": MapInfo(area:"인천", resouceID:3)
                ],

             "제주특별자치도":
                ["제주시": MapInfo(area:"제주", resouceID:3),
                 "서귀포시": MapInfo(area:"제주", resouceID:3)
                ]
            ]
    }
}
