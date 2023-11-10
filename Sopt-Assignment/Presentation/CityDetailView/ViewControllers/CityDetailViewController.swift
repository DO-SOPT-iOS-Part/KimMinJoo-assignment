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

@frozen
enum Sections: CaseIterable {
    case hourlyWeather, tenDaysForecast
}

final class CityDetailViewController: UIViewController {
    private var viewModel = CityDetailViewModel(index: 0)
    private let disposeBag = DisposeBag()
    
    private let cityDetailView = CityDetailView()
    
    typealias SectionType = Sections
    
    private var temperatureData = Temperature(no: 0, city: "", time: "", weather: "", temperature: 0, maximumTemperature: 0, minimumTemperature: 0)
    private var hourlyData: [HourlyWeather] = []
    private var dailyData: [DailyWeather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        bindViewModel()
        setRegister()
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
    
    deinit {
        print(#function)
    }
}

extension CityDetailViewController {
    private func setDelegate() {
        cityDetailView.cityDetailCollectionView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.outputs.cityTemperature
            .asDriver()
            .drive { [weak self] temperature in
                guard let self else { return }
//                cityDetailView.setCityTemperatureView(temperature: temperature)
                self.temperatureData = temperature
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.hourlyWeather
            .asDriver()
            .drive { [weak self] hourlyWeather in
                guard let self else { return }
//                cityDetailView.setHourlyWeatherView(hourlyWeather: hourlyWeather)
                self.hourlyData = hourlyWeather
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.dailyWeather
            .asDriver()
            .drive { [weak self] dailyWeather in
                guard let self else { return }
//                cityDetailView.setDailyWeatherView(dailyWeather: dailyWeather)
                self.dailyData = dailyWeather
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
        
//        viewModel.outputs.cityTemperature
//            .bind(to: cityDetailView.cityDetailCollectionView.rx
//                .items(cellIdentifier: ParticularDayCollectionViewCell.className, cellType: ParticularDayCollectionViewCell.self)) { index, model, cell in
//                        cell.setLabels(dailyWeather: model)
//                }
//                .disposed(by: disposeBag)
//        let items = Observable.just([
//            SectionModel(model: "", items: items: [
//            ])])
//
        cityDetailView.cityDetailCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func setRegister() {
        cityDetailView.cityDetailCollectionView.registerHeader(CityTemperatureView.self)
        cityDetailView.cityDetailCollectionView.registerCell(ParticularHourCollectionViewCell.self)
        cityDetailView.cityDetailCollectionView.registerCell(ParticularDayCollectionViewCell.self)
    }
}

extension CityDetailViewController {
    func setIndex(index: Int) {
        self.viewModel = CityDetailViewModel(index: index)
    }
}

extension CityDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = 117.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 82)
    }
}

extension CityDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .hourlyWeather:
            return hourlyData.count
        case .tenDaysForecast:
            print("\(dailyData.count)########################")
            return dailyData.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .hourlyWeather:
            let cell = collectionView.dequeueCell(type: ParticularHourCollectionViewCell.self, indexPath: indexPath)
            cell.setLabels(hourlyWeather: hourlyData[indexPath.item])
            return cell
        case .tenDaysForecast:
            let cell = collectionView.dequeueCell(type: ParticularDayCollectionViewCell.self, indexPath: indexPath)
            cell.setLabels(dailyWeather: dailyData[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = cityDetailView.cityDetailCollectionView.dequeueReusableCell(kind: UICollectionView.elementKindSectionHeader, type: CityTemperatureView.self, indexPath: indexPath)
        view.setLabels(temperature: temperatureData)
        return view
    }
    
}
