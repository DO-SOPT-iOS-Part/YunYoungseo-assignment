//
//  TodayForecastData.swift
//  weather-app
//
//  Created by 윤영서 on 11/7/23.
//

import Foundation


struct TodayForecastData {
    let description: String
    let time: String
    let conditionIcon: String
    let temperature: String
    
    init(description: String, time: String, conditionIcon: String, temperature: String) {
        self.description = description
        self.time = time
        self.conditionIcon = conditionIcon
        self.temperature = temperature
    }
}

extension TodayForecastData {
    static let todayForecastData: [TodayForecastData] = [.init(description: "오전 2시~3시에 부분적으로 흐린 상태가, 오전 3시에 대체로 흐린 상태가 예상됩니다.",
                                                               time: "지금",
                                                               conditionIcon: "heavy-rain", temperature: "15°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "11시",
                                                               conditionIcon: "heavy-rain", temperature:"15°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "12시",
                                                               conditionIcon: "light-rain", temperature:"15°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "1시",
                                                               conditionIcon: "rainy-sunny", temperature:"15°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "2시",
                                                               conditionIcon: "rainy-sunny", temperature:"18°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "3시",
                                                               conditionIcon: "light-rain", temperature:"17°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "4시",
                                                               conditionIcon: "cloudy-night", temperature:"15°"),
                                                         .init(description: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                                                               time: "5시",
                                                               conditionIcon: "cloudy-night", temperature:"13°"),]
}
