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
    
    private let gradientView = UIView()
    private lazy var gradientLayer = CAGradientLayer()
    
    private let currentImageView = UIImageView()
    private let circleView = UIView()
    
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
        
        gradientView.do {
            $0.backgroundColor = .gradient
            $0.layer.cornerRadius = 2
        }
        
        gradientLayer.do {
            $0.colors = [UIColor.gradientLow.cgColor, UIColor.gradientHigh.cgColor]
            $0.startPoint = CGPoint(x: 0, y: 1)
            $0.endPoint = CGPoint(x: 1, y: 0)
            $0.cornerRadius = 2
        }
        
        currentImageView.do {
            $0.image = UIImage(systemName: "circle.fill")?.withTintColor(.gray152)
        }
        
        circleView.do {
            $0.backgroundColor = .gray28
            $0.layer.cornerRadius = 6
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        self.addSubviews(dayLabel, weatherImageView, minTemperatureLabel, gradientView, maxTemperatureLabel)
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
        
        gradientView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(56)
            $0.width.equalTo(100)
            $0.height.equalTo(4)
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
    
    func setGradientView(model: DailyWeather, lowestTemp: Int, nowTemp: Int, highestTemp: Int) {
        let gradientLength = CGFloat(model.maxTemperature - model.minTemperature)
        let totalLength = CGFloat(highestTemp - lowestTemp)
        let width = gradientLength / totalLength * 100
    
        gradientLayer.frame = CGRect(x: CGFloat(model.minTemperature - lowestTemp) / totalLength * 100, y: 0, width: width, height: 4)
        
        if model.day == "Today" {
            gradientView.addSubviews(circleView, currentImageView)
            circleView.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(CGFloat(nowTemp - lowestTemp) / totalLength * 100)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(10)
            }
            currentImageView.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(CGFloat(nowTemp - lowestTemp) / totalLength * 100)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(10)
            }
        }
        gradientView.setNeedsDisplay()
    }
}
