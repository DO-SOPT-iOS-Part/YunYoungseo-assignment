//
//  WeatherListViewModel.swift
//  weather-app
//
//  Created by 윤영서 on 11/16/23.
//

import Foundation

class WeatherListViewModel {
    let cityNameList: [String] = ["seoul", "daegu", "ulsan", "chuncheon", "jeju"]
    lazy var weatherListModel: [WeatherListModel] = []
    
    func fetchIndexOfWeather(forIndex: Int) -> WeatherListModel {
        return weatherListModel[forIndex]
    }
    
    func fetchWeatherList() {
        Task {
            weatherListModel.removeAll()
            for cityName in cityNameList {
                do {
                    let result = try await GetWeatherService.shared.getWeatherData(cityName: cityName)
                    self.weatherListModel.append(self.bindData(data: result))
                } catch {
                    print(error)
                }
            }
        }
    }
    
}
extension WeatherListViewModel {
    func bindData(data: WeatherInfoDataModel) -> WeatherListModel {
        return WeatherListModel(cityName: data.name,
                                time: String(data.timezone),
                                condition: data.weather[0].main,
                                temperature: Int(data.main.temp),
                                minTemp: Int(data.main.tempMin),
                                maxTemp: Int(data.main.tempMax))
    }
}
