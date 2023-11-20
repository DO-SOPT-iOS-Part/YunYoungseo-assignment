//
//  String+.swift
//  weather-app
//
//  Created by 윤영서 on 11/16/23.
//

import Foundation

extension String {
    func toKorCityName() -> String {
        let translation: [String:String] = [
            "Seoul": "서울특별시",
            "Paris": "Paris",
            "Daegu": "대구광역시",
            "Ulsan": "울산광역시",
            "Chuncheon": "춘천시",
            "Jeju City": "제주특별자치도",
            "London": "London"
        ]
        return translation[self] ?? self
    }
    
    func changeListTime() -> String {
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")

        let formattedTime = dateFormatter.string(from: currentTime)

        return formattedTime
    }
}
