//
//  TemperatureDTO.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/17/23.
//

import Foundation

struct TemperatureDTO: Codable {
    let coord: HomeCoord
    let weather: [HomeWeather]
    let base: String
    let main: Home
    let visibility: Int
    let wind: HomeWind
    let clouds: MainClouds
    let dt: Int
    let sys: HomeSys
    let timezone, id: Int
    let name: String
    let cod: Int
}

struct MainClouds: Codable {
    let all: Int
}

struct HomeCoord: Codable {
    let lon, lat: Double
}

struct Home: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

struct HomeSys: Codable {
    let type: Int?
    let id: Int?
    let country: String
    let sunrise, sunset: Int
}

struct HomeWeather: Codable {
    let id: Int
    let main, description, icon: String
}

struct HomeWind: Codable {
    let speed: Double
    let deg: Int
}
