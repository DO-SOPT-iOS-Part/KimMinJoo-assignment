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
    var cityTemperature: BehaviorRelay<[TemperatureDTO]> { get }
    var sectionIndex: BehaviorRelay<Int> { get }
}

protocol HomeViewModelType {
    var outputs: HomeViewModelOutputs { get }
}

final class HomeViewModel: HomeViewModelOutputs, HomeViewModelType {
    var cityTemperature: BehaviorRelay<[TemperatureDTO]> = BehaviorRelay(value: [])
    var sectionIndex: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    var outputs: HomeViewModelOutputs { return self }
    
    private let city: [String] = ["seoul", "yongsan", "tokyo", "busan", "jeju"]
    var filteredArray: [String] = []
    var searchArray: [String] = []
    var isFiltering : Bool = false
    private var homeDTO: [TemperatureDTO] = []
    
    init() {
        self.cityTemperature.accept(homeDTO)
        self.sectionIndex.accept(Temperature.dummy().count)
        getHomeAPI()
    }
}

extension HomeViewModel {
    func getHomeAPI() {
        Task {
            for i in self.city {
                do {
                    guard let result = try await WeatherService.shared.getHomeWeather(city: i) else { return }
                        homeDTO.append(result)
                } catch {
                    print(error)
                }
            }
            cityTemperature.accept(homeDTO)
        }
    }
}
