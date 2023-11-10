//
//  ParticularDayWeatherCollectionViewCell.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/10/23.
//

import UIKit

import SnapKit
import Then

final class ParticularDayCollectionViewCell: UICollectionViewCell {
    private let dayLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let minTemperatureLabel = UILabel()
    private let maxTemperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ParticularDayCollectionViewCell {
    private func setStyle() {
        dayLabel.do {
            $0.font = .medium(size: 20)
            $0.textColor = .white
        }
        
        weatherImageView.do {
            $0.tintColor = .white
            $0.contentMode = .scaleAspectFit
        }
        
        minTemperatureLabel.do {
            $0.font = .medium(size: 18)
            $0.textColor = .white
        }
        
        maxTemperatureLabel.do {
            $0.font = .medium(size: 18)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubviews(dayLabel, weatherImageView, minTemperatureLabel, maxTemperatureLabel)
        dayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(88)
            $0.height.equalTo(22)
            $0.centerY.equalToSuperview()
        }
        
        minTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(172)
            $0.centerY.equalToSuperview()
        }
        
        maxTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
    }
}

extension ParticularDayCollectionViewCell {
    func setLabels(dailyWeather: DailyWeather) {
        dayLabel.text = dailyWeather.day
        weatherImageView.image = dailyWeather.weather
        minTemperatureLabel.text = "\(dailyWeather.minTemperature)º"
        maxTemperatureLabel.text = "\(dailyWeather.maxTemperature)º"
    }
}
