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
    var dailyWeather: BehaviorRelay<[DailyWeather]> { get }
}

protocol CityDetailViewModelType {
    var outputs: CityDetailViewModelOutputs { get }
}

final class CityDetailViewModel: CityDetailViewModelOutputs, CityDetailViewModelType {
    var cityTemperature: BehaviorRelay<Temperature> = BehaviorRelay(value: Temperature(no: 0,
                                                                                       city: "",
                                                                                       time: "",
                                                                                       weather: "",
                                                                                       temperature: 0,
                                                                                       maximumTemperature: 0,
                                                                                       minimumTemperature: 0))
    var hourlyWeather: BehaviorRelay<[HourlyWeather]> = BehaviorRelay(value: [])
    var dailyWeather: BehaviorRelay<[DailyWeather]> = BehaviorRelay(value: [])
    var outputs: CityDetailViewModelOutputs { return self }
    
    init(index: Int) {
        self.cityTemperature.accept(Temperature.dummy()[index])
        self.hourlyWeather.accept(HourlyWeather.dummy())
        self.dailyWeather.accept(DailyWeather.dummy())
    }
}
