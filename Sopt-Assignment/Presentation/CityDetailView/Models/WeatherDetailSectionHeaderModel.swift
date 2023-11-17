//
//  WeatherDetailSectionHeaderModel.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/16/23.
//

import UIKit

/// compositional layout의 cell 방향을 결정하기 위한 enum
enum Direction {
    case vertical
    case horizontal
}

struct WeatherDetailSectionHeaderModel {
    let image: UIImage?
    let title: String
}

/// compositional layout을 만들기 위한 protocol
protocol WeatherDetailSectionTypeProtocol {
    var itemSize: NSCollectionLayoutSize { get }
    var direction: Direction { get }
    var groupSize: NSCollectionLayoutSize { get }
    var headerSize: NSCollectionLayoutSize? { get }
    var headerNormalModel: WeatherDetailSectionHeaderModel? { get }
}

struct HourlyWeatherSectionType: WeatherDetailSectionTypeProtocol {
    var itemSize: NSCollectionLayoutSize = .init(widthDimension: .absolute(60), heightDimension: .absolute(90))
    var groupSize: NSCollectionLayoutSize = .init(widthDimension: .estimated(1.0), heightDimension: .estimated(1.0))
    var headerSize: NSCollectionLayoutSize? = .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
    var direction: Direction = .horizontal
    var headerNormalModel: WeatherDetailSectionHeaderModel? =  WeatherDetailSectionHeaderModel(image: UIImage(systemName: "clock"), title: "시간별 일기예보")
}

struct TenDaysWeatherSectionType: WeatherDetailSectionTypeProtocol {
    var itemSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
    var groupSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
    var headerSize: NSCollectionLayoutSize? = .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
    var direction: Direction = .vertical
    var headerNormalModel: WeatherDetailSectionHeaderModel? =  WeatherDetailSectionHeaderModel(image: UIImage(systemName: "calendar"), title: "10일간의 일기예보")
}
