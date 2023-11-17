//
//  DailyWeather.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/10/23.
//

import UIKit

struct DailyWeather {
    let day: String
    let weather: UIImage
    let minTemperature: Int
    let maxTemperature: Int
}

extension DailyWeather {
    static func dummy() -> [DailyWeather] {
        return [DailyWeather(day: "Today", weather: ImageLiterals.Home.cloudBolt, minTemperature: -1, maxTemperature: 7),
                DailyWeather(day: "Sat", weather: ImageLiterals.Home.cloudDrizzle, minTemperature: -5, maxTemperature: 6),
                DailyWeather(day: "Sun", weather: ImageLiterals.Home.cloudMoon, minTemperature: 3, maxTemperature: 8),
                DailyWeather(day: "Mon", weather: ImageLiterals.Home.cloudHeavyRain, minTemperature: 0, maxTemperature: 6),
                DailyWeather(day: "Tue", weather: ImageLiterals.Home.cloudDrizzle, minTemperature: -3, maxTemperature: 0),
                DailyWeather(day: "Wed", weather: ImageLiterals.Home.cloudBolt, minTemperature: -7, maxTemperature: 3),
                DailyWeather(day: "Thu", weather: ImageLiterals.Home.cloudBolt, minTemperature: 1, maxTemperature: 10),
                DailyWeather(day: "Fri", weather: ImageLiterals.Home.cloudHeavyRain, minTemperature: -2, maxTemperature: 5),
                DailyWeather(day: "Sat", weather: ImageLiterals.Home.cloudDrizzle, minTemperature: 0, maxTemperature: 4),
                DailyWeather(day: "Sun", weather: ImageLiterals.Home.cloudSunRain, minTemperature: 3, maxTemperature: 8)]
    }
}
