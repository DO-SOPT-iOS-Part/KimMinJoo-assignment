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
        return [DailyWeather(day: "Today", weather: ImageLiterals.Home.cloudBolt, minTemperature: -1, maxTemperature: 9),
                DailyWeather(day: "Sat", weather: ImageLiterals.Home.cloudDrizzle, minTemperature: 2, maxTemperature: 2),
                DailyWeather(day: "Sun", weather: ImageLiterals.Home.cloudMoon, minTemperature: 3, maxTemperature: 2),
                DailyWeather(day: "Mon", weather: ImageLiterals.Home.cloudHeavyRain, minTemperature: 4, maxTemperature: 2),
                DailyWeather(day: "Tue", weather: ImageLiterals.Home.cloudDrizzle, minTemperature: 5, maxTemperature: 2),
                DailyWeather(day: "Wed", weather: ImageLiterals.Home.cloudBolt, minTemperature: 6, maxTemperature: 2),
                DailyWeather(day: "Thu", weather: ImageLiterals.Home.cloudBolt, minTemperature: 7, maxTemperature: 2),
                DailyWeather(day: "Fri", weather: ImageLiterals.Home.cloudHeavyRain, minTemperature: 8, maxTemperature: 3),
                DailyWeather(day: "Sat", weather: ImageLiterals.Home.cloudDrizzle, minTemperature: 9, maxTemperature: 3),
                DailyWeather(day: "Sun", weather: ImageLiterals.Home.cloudSunRain, minTemperature: 10, maxTemperature: 3)]
    }
}
