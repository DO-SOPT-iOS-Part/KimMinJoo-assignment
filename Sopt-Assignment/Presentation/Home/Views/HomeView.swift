//
//  HomeView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/15/23.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    private let homeScrollView = UIScrollView()
    let homeCityView1 = HomeCityView()
    let homeCityView2 = HomeCityView()
    let homeCityView3 = HomeCityView()
    private lazy var homeStackView = UIStackView.init(arrangedSubviews: [self.homeCityView1, self.homeCityView2, self.homeCityView3])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension HomeView {
    private func setStyle() {
        homeScrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
            $0.isScrollEnabled = true
        }
        
        homeStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 16
        }
    }
    
    private func setLayout() {
        self.addSubview(homeScrollView)
        homeScrollView.addSubview(homeStackView)
        homeStackView.addArrangedSubviews(homeCityView1, homeCityView2, homeCityView3)
        
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        homeStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        homeCityView1.snp.makeConstraints {
            $0.height.equalTo(117)
        }
        
        homeCityView2.snp.makeConstraints {
            $0.height.equalTo(117)
        }
        
        homeCityView3.snp.makeConstraints {
            $0.height.equalTo(117)
        }
        
    }
}

extension HomeView {
    func setHomeCityView(temperatures: [Temperature]) {
        homeCityView1.setLabels(temperature: temperatures[0])
        homeCityView2.setLabels(temperature: temperatures[1])
        homeCityView3.setLabels(temperature: temperatures[2])
    }
}
