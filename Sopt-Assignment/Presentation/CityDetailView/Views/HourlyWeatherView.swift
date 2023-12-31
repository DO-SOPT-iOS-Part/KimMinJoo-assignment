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
    private let divisionLabel = UILabel()
    private let hourlyWeatherScrollView = UIScrollView()
    private lazy var hourlyWeatherStackView = UIStackView()
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
    
    private lazy var timeViews: [ParticularHourWeatherView] = [timeView1, timeView2, timeView3, timeView4, timeView5, timeView6, timeView7, timeView8, timeView9, timeView10, timeView11, timeView12]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HourlyWeatherView {
    private func setStackView() {
        self.timeViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            self.hourlyWeatherStackView.addArrangedSubview($0)
        }
    }
    
    private func setStyle() {
        self.backgroundColor = .darkNavy.withAlphaComponent(0.5)
        self.layer.cornerRadius = 15
        
        descriptionLabel.do {
            $0.text = StringLiterals.CityDetail.description
            $0.font = .medium(size: 14)
            $0.textColor = .white
            $0.numberOfLines = 2
        }
        
        divisionLabel.do {
            $0.backgroundColor = .white.withAlphaComponent(0.4)
        }
        
        hourlyWeatherScrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        
        hourlyWeatherStackView.do {
            $0.axis = .horizontal
            $0.alignment = .top
            $0.distribution = .fillEqually
            $0.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
            $0.isLayoutMarginsRelativeArrangement = true
            $0.spacing = 8
        }
    }
    
    private func setLayout() {
        self.addSubviews(descriptionLabel, divisionLabel, hourlyWeatherScrollView)
        hourlyWeatherScrollView.addSubview(hourlyWeatherStackView)
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        
        divisionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.2)
        }
        
        hourlyWeatherScrollView.snp.makeConstraints {
            $0.top.equalTo(divisionLabel.snp.top)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(115)
        }
        
        hourlyWeatherStackView.snp.makeConstraints {
            $0.edges.height.equalToSuperview()
        }
        
        timeViews.forEach {
            $0.snp.makeConstraints {
                $0.height.equalToSuperview()
            }
        }
    }
}

extension HourlyWeatherView {
    func setParticularView(hourlyWeather: [HourlyWeather]) {
        var index = 0
        self.timeViews.forEach {
            $0.setLabels(hourlyWeather: hourlyWeather[index])
            index += 1
        }
    }
}
