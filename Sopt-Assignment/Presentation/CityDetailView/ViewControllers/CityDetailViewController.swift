//
//  CityDetailViewController.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import RxCocoa
import RxSwift
import Then

final class CityDetailViewController: UIViewController {
    private var viewModel = CityDetailViewModel(index: 0)
    private let disposeBag = DisposeBag()
    
    private let cityDetailView = CityDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        self.view = cityDetailView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

extension CityDetailViewController {
    private func bindViewModel() {
        viewModel.outputs.cityTemperature
            .asDriver()
            .drive { [weak self] temperature in
                guard let self else { return }
                cityDetailView.setCityTemperatureView(temperature: temperature)
            }
            .disposed(by: disposeBag)
        viewModel.outputs.hourlyWeather
            .asDriver()
            .drive { [weak self] hourlyWeather in
                guard let self else { return }
                cityDetailView.setHourlyWeatherView(hourlyWeather: hourlyWeather)
                
            }
            .disposed(by: disposeBag)
        
        cityDetailView.bottonMenuView.listButton.rx.tap
            .bind { [weak self] in
                guard let self else { return }
                if let navigationController = self.navigationController {
                    navigationController.popViewController(animated: true)
                }
            }
            .disposed(by: disposeBag)
    }
}

extension CityDetailViewController {
    func setIndex(index: Int) {
        self.viewModel = CityDetailViewModel(index: index)
    }
}
