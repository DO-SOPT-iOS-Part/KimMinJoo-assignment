//
//  CityDetailView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class CityDetailView: UIView {
    private let backgroundImageView = UIImageView()
    lazy var cityDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: getLayout())
    let bottonMenuView = BottomMenuView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityDetailView {
    private func setStyle() {
        backgroundImageView.do {
            $0.image = ImageLiterals.Home.verticalBackground
        }
        
        cityDetailCollectionView.do {
            $0.backgroundColor = .clear
            $0.contentInsetAdjustmentBehavior = .never
            
        
//            $0.
        }
    }
    
    private func setLayout() {
        self.addSubviews(backgroundImageView, cityDetailCollectionView, bottonMenuView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cityDetailCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottonMenuView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    private func registerCell() {
        cityDetailCollectionView.registerHeader(CityTemperatureView.self)
        
        cityDetailCollectionView.registerCell(ParticularHourCollectionViewCell.self)
        cityDetailCollectionView.registerCell(ParticularDayCollectionViewCell.self)
    }
    
    private func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = CityDetailViewController.SectionType.allCases[sectionIndex]
            switch sectionType {
            case .hourlyWeather:
                return self.getLayoutHourlyWeather()
            case .tenDaysForecast:
                return self.getLayoutDailyWeather()
            }
        }
    }
    
    private func getLayoutHourlyWeather() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(50),
            heightDimension: .absolute(115)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 300, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 10
        return section
        
    }
    
    private func getLayoutDailyWeather() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.055)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        
//        NSCollectionLayoutGroup.vertical(
//            layoutSize: groupSize,
//            subitems: [item]
//        )
        
//        let headerSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(30)
//        )
//        
//        let header = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: headerSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top
//        )
//        
//        let footerSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(30)
//        )
//        
//        let footer = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: footerSize,
//            elementKind: UICollectionView.elementKindSectionFooter,
//            alignment: .bottom
//        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
//        section.boundarySupplementaryItems = [header, footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 10
        return section
        
    }
}
