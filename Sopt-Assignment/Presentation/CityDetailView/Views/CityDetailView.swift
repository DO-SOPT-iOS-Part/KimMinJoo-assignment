//
//  CityDetailView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class CityDetailView: UIView {
    private let backgroundImageView = UIImageView()
    private let cityDetailScrollView = UIScrollView()
    private let cityTemperatureView = CityTemperatureView()
    private let hourlyWeatherView = HourlyWeatherView()
    let bottonMenuView = BottomMenuView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityDetailView {
    private func setStyle() {
        backgroundImageView.do {
            $0.image = ImageLiterals.Home.verticalBackground
        }
        
        cityDetailScrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.isScrollEnabled = true
        }
        
    }
    
    private func setLayout() {
        self.addSubviews(backgroundImageView, cityDetailScrollView, bottonMenuView)
        cityDetailScrollView.addSubviews(cityTemperatureView, hourlyWeatherView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cityDetailScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottonMenuView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        cityTemperatureView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        hourlyWeatherView.snp.makeConstraints {
            $0.top.equalTo(cityTemperatureView.snp.bottom).offset(44)
            $0.width.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(170)
        }
    }
}

extension CityDetailView {
    func setHourlyWeatherView(hourlyWeather: [HourlyWeather]) {
        hourlyWeatherView.setParticularView(hourlyWeather: hourlyWeather)
    }
    
    func setCityTemperatureView(temperature: Temperature) {
        cityTemperatureView.setLabels(temperature: temperature)
    }
}
