//
//  HomeCityView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/15/23.
//

import UIKit

import SnapKit

class HomeCityView: UIView {
    
    private let imageView = UIImageView()
    private let locationLabel = UILabel()
    private let timeLabel = UILabel()
    private let weatherLabel = UILabel()
    private let temperatureLabel = UILabel()
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

extension HomeCityView {
    
    private func setStyle() {
        
        self.layer.cornerRadius = 16
        
        imageView.do {
            $0.image = UIImage(named: "horizontalBackground")
        }
        
        locationLabel.do {
            $0.font = .bold(size: 25)
            $0.textColor = .white
            $0.text = "My Location"
        }
        
        timeLabel.do {
            $0.font = .medium(size: 16)
            $0.textColor = .white
            $0.text = "서울특별시"
        }
        
        weatherLabel.do {
            $0.font = .medium(size: 16)
            $0.textColor = .white
            $0.text = "Clear"
        }
        
        temperatureLabel.do {
            $0.font = .light(size: 53)
            $0.textColor = .white
            $0.text = "17º"
        }
        
        maxMinLabel.do {
            $0.font = .medium(size: 15)
            $0.textColor = .white
            $0.text = "H: 20º L: 10º"
        }
        
    }
    private func setLayout() {
        self.addSubviews(imageView, locationLabel, timeLabel, weatherLabel, temperatureLabel, maxMinLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom)
            $0.leading.equalTo(locationLabel.snp.leading)
            
        }
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(28)
            $0.leading.equalTo(locationLabel.snp.leading)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.width.equalTo(82)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        maxMinLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(11)
            $0.trailing.equalToSuperview().inset(19)
        }
    }
}
