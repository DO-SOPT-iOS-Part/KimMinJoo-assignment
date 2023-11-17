//
//  DailyHeaderView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/17/23.
//

import UIKit

import SnapKit
import Then

final class DailyHeaderView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    static var isFromNib: Bool = false
    
    private let descriptionLabel = UILabel()
    private let divisionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DailyHeaderView {
    private func setStyle() {
        self.backgroundColor = .darkNavy2
        self.layer.cornerRadius = 15
        layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        descriptionLabel.do {
            $0.text = StringLiterals.CityDetail.daily
            $0.font = .medium(size: 14)
            $0.textColor = .white.withAlphaComponent(0.4)
        }
        
        divisionLabel.do {
            $0.backgroundColor = .white.withAlphaComponent(0.4)
        }
    }
    
    private func setLayout() {
        self.addSubviews(descriptionLabel, divisionLabel)
        
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
    }
}
