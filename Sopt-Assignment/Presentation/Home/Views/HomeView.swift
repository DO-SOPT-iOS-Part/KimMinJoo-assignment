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
    lazy var homeCityCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

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
        homeCityCollectionView.do {
            $0.backgroundColor = .black
            $0.contentInsetAdjustmentBehavior = .never
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    private func setLayout() {
        self.addSubview(homeCityCollectionView)
        
        homeCityCollectionView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
