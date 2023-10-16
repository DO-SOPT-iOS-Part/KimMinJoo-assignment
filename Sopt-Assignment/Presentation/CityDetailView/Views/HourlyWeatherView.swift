//
//  HourlyWeatherView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class HourlyWeatherView: UIView {
    private let descriptionLabel = UILabel()
    private let lineLabel = UILabel()
    private let hourlyWeatherScrollView = UIScrollView()
    private lazy var hourlyWeatherStackView = UIStackView.init(arrangedSubviews: [self.timeView1, self.timeView2, self.timeView3, self.timeView4, self.timeView5, self.timeView6, self.timeView7, self.timeView8, self.timeView9, self.timeView10, self.timeView11, self.timeView12])
    private let timeView1 = ParticularHourWeatherView()
    private let timeView2 = ParticularHourWeatherView()
    private let timeView3 = ParticularHourWeatherView()
    private let timeView4 = ParticularHourWeatherView()
    private let timeView5 = ParticularHourWeatherView()
    private let timeView6 = ParticularHourWeatherView()
    private let timeView7 = ParticularHourWeatherView()
    private let timeView8 = ParticularHourWeatherView()
    private let timeView9 = ParticularHourWeatherView()
    private let timeView10 = ParticularHourWeatherView()
    private let timeView11 = ParticularHourWeatherView()
    private let timeView12 = ParticularHourWeatherView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HourlyWeatherView {
    private func setStyle() {
        self.layer.cornerRadius = 15
        self.backgroundColor = .systemGray
        descriptionLabel.do {
            $0.text = StringLiterals.CityDetail.description
            $0.font = .medium(size: 14)
            $0.textColor = .white
            $0.numberOfLines = 2
        }
        
        lineLabel.do {
            $0.backgroundColor = .white
        }
        
        hourlyWeatherScrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.isScrollEnabled = true
        }
        
        hourlyWeatherStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 16
        }
    }
    
    private func setLayout() {
        self.addSubviews(descriptionLabel, lineLabel, hourlyWeatherScrollView)
        hourlyWeatherScrollView.addSubview(hourlyWeatherStackView)
        hourlyWeatherStackView.addArrangedSubviews(self.timeView1, self.timeView2, self.timeView3, self.timeView4, self.timeView5, self.timeView6, self.timeView7, self.timeView8, self.timeView9, self.timeView10, self.timeView11, self.timeView12)
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        
        lineLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.2)
        }
        
        hourlyWeatherScrollView.snp.makeConstraints {
            $0.top.equalTo(lineLabel.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        hourlyWeatherStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
    }
}

extension HourlyWeatherView {
    func setParticularView(hourlyWeather: [HourlyWeather]) {
        timeView1.setLabels(hourlyWeather: hourlyWeather[0])
        timeView2.setLabels(hourlyWeather: hourlyWeather[1])
        timeView3.setLabels(hourlyWeather: hourlyWeather[2])
        timeView4.setLabels(hourlyWeather: hourlyWeather[3])
        timeView5.setLabels(hourlyWeather: hourlyWeather[4])
        timeView6.setLabels(hourlyWeather: hourlyWeather[5])
        timeView7.setLabels(hourlyWeather: hourlyWeather[6])
        timeView8.setLabels(hourlyWeather: hourlyWeather[7])
        timeView9.setLabels(hourlyWeather: hourlyWeather[8])
        timeView10.setLabels(hourlyWeather: hourlyWeather[9])
        timeView11.setLabels(hourlyWeather: hourlyWeather[10])
        timeView12.setLabels(hourlyWeather: hourlyWeather[11])
    }
}
