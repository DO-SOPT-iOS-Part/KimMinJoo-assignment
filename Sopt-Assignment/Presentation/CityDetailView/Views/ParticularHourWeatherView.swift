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
        timeLabel.do {
            $0.font = .medium(size: 17)
            $0.textColor = .white
        }
        
        weatherImageView.do {
            $0.tintColor = .white
        }
        
        temperatureLabel.do {
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubviews(timeLabel, weatherImageView, temperatureLabel)
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(24)
            $0.width.equalTo(30)
            $0.height.equalTo(26)
            $0.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(24)
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
