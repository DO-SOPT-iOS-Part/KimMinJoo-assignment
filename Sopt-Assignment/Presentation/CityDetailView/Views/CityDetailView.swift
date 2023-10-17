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
    let cityTemperatureView = CityTemperatureView()
    let hourlyWeatherView = HourlyWeatherView()
    
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
        self.addSubviews(backgroundImageView,cityDetailScrollView)
        cityDetailScrollView.addSubviews(cityTemperatureView, hourlyWeatherView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cityDetailScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
}
