//
//  GetWeatherService.swift
//  weather-app
//
//  Created by 윤영서 on 11/14/23.
//

import Foundation

class GetWeatherService {
    static let shared = GetWeatherService()
    private init() {}
    
    func makeRequest(cityName: String) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        let apiKEY = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKEY) as? String ?? ""
        let url = URL (string: baseURL + "/data/2.5/weather?q=\(cityName)&appid=\(apiKEY)"+"&units=metric")!
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getWeatherData(cityName: String) async throws -> WeatherInfoDataModel {
        do {
            let request = self.makeRequest(cityName: cityName)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            guard let parseData = parseWeatherInfoData(data: data)
            else {
                throw NetworkError.responseDecodingError
            }
            return parseData
        } catch {
            throw error
        }
    }
    
    private func parseWeatherInfoData(data: Data) -> WeatherInfoDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherInfoDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
