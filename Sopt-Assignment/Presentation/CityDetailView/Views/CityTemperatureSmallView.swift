//
//  CityTemperatureSmallView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/17/23.
//

import UIKit

import SnapKit

final class CityTemperatureSmallView: UIView {
    
    // MARK: - UI Components
    
    var locationSmallDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 36)
        label.textColor = .white
        return label
    }()
    
    var tempSmallDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(size: 20)
        label.textColor = .white
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.addArrangedSubviews(locationSmallDetailLabel, tempSmallDetailLabel)
        return stackview
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityTemperatureSmallView {
    func setHierarchy() {
        self.addSubview(stackView)
    }
    
    func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    func setDataBind(model: Temperature) {
        locationSmallDetailLabel.text = model.city
        tempSmallDetailLabel.text = "\(model.temperature)° | \(model.weather)"
    }
}
