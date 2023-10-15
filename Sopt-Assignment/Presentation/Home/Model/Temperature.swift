//
//  Temperature.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/14/23.
//

import Foundation


struct Temperature {
    let city: String
    let time: String
    let weather: String
    let temperature: Int
    let maximumTemperature: Int
    let minimumTemperature: Int
}

extension Temperature {
    static func dummy() -> [Temperature] {
        return [Temperature(city: "My Location",
                            time: "서울특별시",
                            weather: "Mostly Clear",
                            temperature: 13,
                            maximumTemperature: 19,
                            minimumTemperature: 12),
                Temperature(city: "Yongsan-gu",
                            time: "11:59PM",
                            weather: "Mostly Clear",
                            temperature: 10,
                            maximumTemperature: 17,
                            minimumTemperature: 9),
                Temperature(city: "Tokyo",
                            time: "11:59PM",
                            weather: "Cloudy",
                            temperature: 18,
                            maximumTemperature: 23,
                            minimumTemperature: 12)]
    }
}

