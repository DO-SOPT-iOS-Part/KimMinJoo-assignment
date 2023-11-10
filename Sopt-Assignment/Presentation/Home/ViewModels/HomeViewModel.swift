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
    var sectionIndex: BehaviorRelay<Int> { get }
}

protocol HomeViewModelType {
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelOutputs, HomeViewModelType {
    var cityTemperature: BehaviorRelay<[Temperature]> = BehaviorRelay(value: [])
    var sectionIndex: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    var outputs: HomeViewModelOutputs { return self }
    
    init() {
        self.cityTemperature.accept(Temperature.dummy())
        self.sectionIndex.accept(Temperature.dummy().count)
    }
}
