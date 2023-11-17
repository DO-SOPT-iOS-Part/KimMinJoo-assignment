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
    var minMaxTemp: BehaviorRelay<(Int, Int)> { get }
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
    var minMaxTemp: BehaviorRelay<(Int, Int)> = BehaviorRelay(value: (0, 0))
    
    var outputs: CityDetailViewModelOutputs { return self }
    
    init(index: Int) {
        self.cityTemperature.accept(Temperature.dummy()[index])
        self.hourlyWeather.accept(HourlyWeather.dummy())
        self.dailyWeather.accept(DailyWeather.dummy())
        self.minMaxTemp.accept(setMinMaxTemp(model: dailyWeather.value))
    }
}

extension CityDetailViewModel {
    func setMinMaxTemp(model: [DailyWeather]) -> (Int, Int) {
        var min = model.first?.minTemperature ?? 0
        var max = model.first?.maxTemperature ?? 0
        
        for i in 0 ... 9 {
            if model[i].minTemperature < min {
                min = model[i].minTemperature
            }
            if model[i].maxTemperature > max {
                max = model[i].maxTemperature
            }
        }
        return (min, max)
    }
}
