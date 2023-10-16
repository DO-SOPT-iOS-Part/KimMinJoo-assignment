//
//  HourlyWeather.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import Foundation
import UIKit

struct HourlyWeather {
    let time: String
    let wheather: UIImage
    let temperature: Int
}

extension HourlyWeather {
    static func dummy() -> [HourlyWeather] {
        return [HourlyWeather(time: "Now", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "12AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "1AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "2AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "3AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "4AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "5AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "6AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "7AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "8AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "9AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11),
                HourlyWeather(time: "10AM", wheather: ImageLiterals.Home.cloudBolt, temperature: 11)]
    }
}

