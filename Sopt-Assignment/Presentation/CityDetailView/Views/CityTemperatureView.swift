//
//  CityTemperatureView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class CityTemperatureView: UIView {
    
    private let cityLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let weatherLabel = UILabel()
    private let maxMinLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityTemperatureView {
    private func setStyle() { 
        cityLabel.do {
            $0.font = .regular(size: 32)
            $0.textColor = .white
        }
        
        temperatureLabel.do {
            $0.font = .thin(size: 100)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.font = .regular(size: 18)
            $0.textColor = .white
        }
        
        maxMinLabel.do {
            $0.font = .medium(size: 18)
            $0.textColor = .white
        }
    }
    private func setLayout() { 
        self.addSubviews(cityLabel, temperatureLabel, weatherLabel, maxMinLabel)
        
        cityLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(85)
            $0.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).inset(5)
            $0.centerX.equalToSuperview()
        }
        
        maxMinLabel.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}

extension CityTemperatureView {
    func setLabels(temperature: Temperature) {
        cityLabel.text = temperature.city
        temperatureLabel.text = "\(temperature.temperature)º"
        weatherLabel.text = temperature.weather
        maxMinLabel.text = "H: \(temperature.maximumTemperature)º  L: \(temperature.minimumTemperature)º"
    }
}
