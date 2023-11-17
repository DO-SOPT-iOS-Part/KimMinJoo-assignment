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
    var cityTemperature: BehaviorRelay<[Temperature]> { get }
}

protocol HomeViewModelType {
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelOutputs, HomeViewModelType {
    
    var cityTemperature: BehaviorRelay<[Temperature]> = BehaviorRelay(value: [])
    var outputs: HomeViewModelOutputs { return self }
    
    init() {
        self.cityTemperature.accept(Temperature.dummy())
    }
}
