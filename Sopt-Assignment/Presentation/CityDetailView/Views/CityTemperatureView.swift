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
            $0.font = .regular(size: 37)
            $0.textColor = .white
            $0.text = "의정부시"
        }
        
        temperatureLabel.do {
            $0.font = .thin(size: 102)
            $0.textColor = .white
            $0.text = "21"
        }
        
        weatherLabel.do {
            $0.font = .regular(size: 24)
            $0.textColor = .white
            $0.text = "흐림"
        }
        
        maxMinLabel.do {
            $0.font = .medium(size: 21)
            $0.textColor = .white
            $0.text = "H: 32 L: 3"
        }
    }
    private func setLayout() { 
        self.addSubviews(cityLabel, temperatureLabel, weatherLabel, maxMinLabel)
        
        cityLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom)
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
