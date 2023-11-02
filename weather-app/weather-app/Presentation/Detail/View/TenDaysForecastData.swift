//
//  TenDaysForecastData.swift
//  weather-app
//
//  Created by 윤영서 on 10/30/23.
//

import UIKit

struct TenDaysForecastData {
    let day: String
    let icon: String
    let precip: String
    let minTemp: String
    let tempImage: String
    let maxTemp: String
    
    init(day: String, icon: String, precip: String, minTemp: String, tempImage: String, maxTemp: String) {
        self.day = day
        self.icon = icon
        self.precip = precip
        self.minTemp = minTemp
        self.tempImage = tempImage
        self.maxTemp = maxTemp
    }
}

extension TenDaysForecastData {
    static let tenDaysForecastData: [TenDaysForecastData] = [.init(day: "오늘",
                                                                   icon: "sun.max.fill",
                                                                   precip: "",
                                                                   minTemp: "15°",
                                                                   tempImage: "gradient-00",
                                                                   maxTemp: "29°"),
                                                             .init(day: "월",
                                                                   icon: "cloud.rain.fill",
                                                                   precip: "60%",
                                                                   minTemp: "18°",
                                                                   tempImage: "gradient-01",
                                                                   maxTemp: "27°"),
                                                             .init(day: "화",
                                                                   icon: "cloud.rain.fill",
                                                                   precip: "60%",
                                                                   minTemp: "20°",
                                                                   tempImage: "gradient-02",
                                                                   maxTemp: "25°"),
                                                             .init(day: "수",
                                                                   icon: "cloud.rain.fill",
                                                                   precip: "70%",
                                                                   minTemp: "17°",
                                                                   tempImage: "gradient-03",
                                                                   maxTemp: "25°"),
                                                             .init(day: "목",
                                                                   icon: "cloud.rain.fill",
                                                                   precip: "50%",
                                                                   minTemp: "15°",
                                                                   tempImage: "gradient-04",
                                                                   maxTemp: "29°"),
                                                             .init(day: "금",
                                                                   icon: "cloud.sun.fill",
                                                                   precip: "",
                                                                   minTemp: "20°",
                                                                   tempImage: "gradient-05",
                                                                   maxTemp: "26°"),
                                                             .init(day: "토",
                                                                   icon: "sun.max.fill",
                                                                   precip: "",
                                                                   minTemp: "18°",
                                                                   tempImage: "gradient-06",
                                                                   maxTemp: "25°"),
                                                             .init(day: "일",
                                                                   icon: "cloud.sun.fill",
                                                                   precip: "50%",
                                                                   minTemp: "13°",
                                                                   tempImage: "gradient-07",
                                                                   maxTemp: "21°"),
                                                             .init(day: "월",
                                                                   icon: "cloud.sun.fill",
                                                                   precip: "50%",
                                                                   minTemp: "12°",
                                                                   tempImage: "gradient-08",
                                                                   maxTemp: "19°"),
                                                             .init(day: "화",
                                                                   icon: "sun.max.fill",
                                                                   precip: "",
                                                                   minTemp: "18°",
                                                                   tempImage: "gradient-09",
                                                                   maxTemp: "25°"),
                                                             .init(day: "수",
                                                                   icon: "sun.max.fill",
                                                                   precip: "",
                                                                   minTemp: "18°",
                                                                   tempImage: "gradient-09",
                                                                   maxTemp: "25°")]
    
}
