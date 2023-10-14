//
//  HomeViewModel.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/14/23.
//

import UIKit

import RxCocoa
import RxSwift

protocol HomeViewModelOutputs {
    var cityTemperature: BehaviorRelay<Temperature> { get }
}

protocol HomeViewModelType {
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelOutputs, HomeViewModelType {
    
    var cityTemperature: BehaviorRelay<Temperature> = BehaviorRelay(value: Temperature(city: "", time: "", weather: "", temperature: 0, maximumTemperature: 0, minimumTemperature: 0))
    var outputs: HomeViewModelOutputs { return self }
    
    init() {}
}
