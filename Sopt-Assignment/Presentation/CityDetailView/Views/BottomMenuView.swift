//
//  BottomMenuView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/17/23.
//

import UIKit

import SnapKit
import Then

final class BottomMenuView: UIView {
    private let divisionLabel = UILabel()
    private let mapButton = UIButton()
    private let pageControl = UIPageControl()
    let listButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomMenuView {
    private func setStyle() {
        self.backgroundColor = .darkNavy
        divisionLabel.do {
            $0.backgroundColor = .white.withAlphaComponent(0.4)
        }
        
        mapButton.do {
            $0.setBackgroundImage(ImageLiterals.Home.map, for: .normal)
            
        }
        
        listButton.do {
            $0.setBackgroundImage(ImageLiterals.Home.list, for: .normal)
        }
        
        pageControl.do {
            $0.numberOfPages = 3
            $0.setIndicatorImage(ImageLiterals.Home.location, forPage: 0)
        }
    }
    
    private func setLayout() {
        self.addSubviews(divisionLabel, mapButton, listButton, pageControl)
        
        divisionLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.2)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(20)
            $0.height.equalTo(18)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalTo(mapButton.snp.top).offset(2)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(20)
            $0.height.equalTo(16)
        }
        
        pageControl.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(mapButton.snp.centerY)
        }
    }
}

extension BottomMenuView {
}
