//
//  ParticularHourWeatherView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class ParticularHourWeatherView: UIView {
    private let timeLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ParticularHourWeatherView {
    private func setStyle() {
        self.backgroundColor = .systemPink
        timeLabel.do {
            $0.font = .medium(size: 13)
            $0.textColor = .white
            $0.text = HourlyWeather.dummy().last?.time
        }
        
        weatherImageView.do {
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
            $0.image = HourlyWeather.dummy().last?.weather
        }
        
        temperatureLabel.do {
            $0.font = .medium(size: 18)
            $0.textColor = .white
            $0.text = "10"
        }
    }
    
    private func setLayout() {
        self.addSubviews(timeLabel, weatherImageView, temperatureLabel)
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(12)
            $0.height.equalTo(24)
            $0.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }
}

extension ParticularHourWeatherView {
    func setLabels(hourlyWeather: HourlyWeather) {
        timeLabel.text = hourlyWeather.time
        weatherImageView.image = hourlyWeather.weather
        temperatureLabel.text = "\(hourlyWeather.temperature)º"
    }
}
