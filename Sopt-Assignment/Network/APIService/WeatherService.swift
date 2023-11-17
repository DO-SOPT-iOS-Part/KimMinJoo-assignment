//
//  WeatherService.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/17/23.
//

import Foundation

final class WeatherService: BaseService {

    static let shared = WeatherService()

    private override init() {}
}

extension WeatherService {
    func setHomeUrl(city: String) -> URLRequest {
        let urlString = Config.baseURL + "?q=\(city)&appid=" + Config.apiKey + "&units=metric"
        return WeatherService.makeRequest(urlString: urlString)
    }

    func setDetailUrl(city: String) -> URLRequest {
        let urlString = Config.baseURL + "?q=\(city)&appid=" + Config.apiKey + "&units=metric"
        return WeatherService.makeRequest(urlString: urlString)
    }

    func getHomeWeather(city: String) async throws -> TemperatureDTO? {
        do {
            let request = self.setHomeUrl(city: city)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return WeatherService.parseData(data: data, modelType: TemperatureDTO.self)
        } catch {
            throw error
        }
    }

    func getDetailWeather(city: String) async throws -> DetailDTO? {
        do {
            let request = self.setDetailUrl(city: city)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return WeatherService.parseData(data: data, modelType: DetailDTO.self)
        } catch {
            throw error
        }
    }
}
