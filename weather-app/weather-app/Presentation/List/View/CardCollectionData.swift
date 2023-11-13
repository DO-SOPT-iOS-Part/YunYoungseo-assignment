//
//  CardCollectionData.swift
//  weather-app
//
//  Created by 윤영서 on 11/2/23.
//

import UIKit


struct CardCollectionData {
    let backgroundImage: String
    let location: String
    let time: String
    let condition: String
    let temperature: String
    let minTemp: String
    let maxTemp: String
    
    init(backgroundImage: String, location: String, time: String, condition: String, temperature: String, minTemp: String, maxTemp: String) {
        self.backgroundImage = backgroundImage
        self.location = location
        self.time = time
        self.condition = condition
        self.temperature = temperature
        self.minTemp = minTemp
        self.maxTemp = maxTemp
    }
}

extension CardCollectionData {
    static let cardCollectionData: [CardCollectionData] = [.init(backgroundImage: "list-image",
                                                                 location: "나의 위치",
                                                                 time: "고양시",
                                                                 condition: "대체로 청명함",
                                                                 temperature: "18°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저17°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "서울",
                                                                 time: "오전 10:37",
                                                                 condition: "대체로 맑음",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:9°",
                                                                 maxTemp: "최저:3°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "제주특별자치도",
                                                                 time: "오전 10:37",
                                                                 condition: "청명함",
                                                                 temperature: "11°",
                                                                 minTemp: "최고:12°",
                                                                 maxTemp: "최저:9°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "부산광역시",
                                                                 time: "오전 10:37",
                                                                 condition: "맑음",
                                                                 temperature: "12°",
                                                                 minTemp: "최고:16°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "뉴욕",
                                                                 time: "오전 8:37",
                                                                 condition: "1시간 이내에 비가 예상됨",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:11°",
                                                                 maxTemp: "최저:-1°")]
}
