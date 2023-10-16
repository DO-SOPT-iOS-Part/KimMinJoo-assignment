//
//  CityDetailViewModel.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import RxCocoa
import RxSwift

protocol CityDetailViewModelOutputs {
    var cityTemperature: BehaviorRelay<Temperature> { get }
    var hourlyWeather: BehaviorRelay<[HourlyWeather]> { get }
}

protocol CityDetailViewModelType {
    var outputs: CityDetailViewModelOutputs { get }
}

final class CityDetailViewModel: CityDetailViewModelOutputs, CityDetailViewModelType {
    var cityTemperature: BehaviorRelay<Temperature> = BehaviorRelay(value: Temperature(city: "", 
                                                                                       time: "",
                                                                                       weather: "",
                                                                                       temperature: 0,
                                                                                       maximumTemperature: 0,
                                                                                       minimumTemperature: 0))
    var hourlyWeather: BehaviorRelay<[HourlyWeather]> = BehaviorRelay(value: [])
    var outputs: CityDetailViewModelOutputs { return self }
    
    init(city: String) {
        let index = getCityTemperature(city: city)
        self.cityTemperature.accept(Temperature.dummy()[index])
        self.hourlyWeather.accept(HourlyWeather.dummy())
    }
}

extension CityDetailViewModel {
    private func getCityTemperature(city: String) -> Int {
        let temperature = Temperature.dummy()
        var result = 0
        temperature.forEach {
            if($0.city == city) {
                result += 1
            }
        }
        return result
    }
}
