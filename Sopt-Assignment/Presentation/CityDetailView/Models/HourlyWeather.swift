//
//  HourlyWeather.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

struct HourlyWeather {
    let time: String
    let weather: UIImage
    let temperature: Int
}

extension HourlyWeather {
    static func dummy() -> [HourlyWeather] {
        return [HourlyWeather(time: "Now", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "12AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "1AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "2AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "3AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "4AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "5AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "6AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "7AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "8AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "9AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "10AM", weather: ImageLiterals.Home.cloudBolt, temperature: 11)]
    }
}
