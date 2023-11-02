//
//  CardCollectionData.swift
//  weather-app
//
//  Created by 윤영서 on 11/2/23.
//

import Foundation


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
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°"),
                                                           .init(backgroundImage: "list-image",
                                                                 location: "라스베가스",
                                                                 time: "오전 6:37",
                                                                 condition: "청명함",
                                                                 temperature: "8°",
                                                                 minTemp: "최고:24°",
                                                                 maxTemp: "최저:8°")]
}
