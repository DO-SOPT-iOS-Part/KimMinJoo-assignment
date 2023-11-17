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
    
    private let cityTemperatureView = CityTemperatureView()
    private let cityTemperatureSmallView = CityTemperatureSmallView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    private let detailCollectionView = CityTemperatureView()
//    private let detailTableView = ()
    
//    lazy var cityDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: getLayout())
//    lazy var cityDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: getLayout())
    
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
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    private func setLayout() {
        self.addSubviews(backgroundImageView, cityDetailCollectionView, bottonMenuView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cityDetailCollectionView.snp.makeConstraints {
            $0.verticalEdges.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(18)
        }
        
        bottonMenuView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(82)
        }
    }
    
    private func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = CityDetailViewController.SectionType.allCases[sectionIndex]
            switch sectionType {
            case .cityTemperature:
                return self.getLayoutCityTemperature()
            case .hourlyWeather:
                return self.getLayoutHourlyWeather()
            case .tenDaysForecast:
                return self.getLayoutDailyWeather()
            }
        }
    }
    
    private func getLayoutCityTemperature() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(310)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
    
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        return section
    }
    
    private func getLayoutHourlyWeather() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
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
            heightDimension: .absolute(55)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        header.pinToVisibleBounds = true
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 10
        return section
        
    }
    
    private func getLayoutDailyWeather() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.057)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(37)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        header.pinToVisibleBounds = true
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 10
        return section
    }
}
