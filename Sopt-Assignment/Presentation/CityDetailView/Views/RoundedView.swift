//
//  RoundedView.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/17/23.
//

import UIKit

import SnapKit
import Then

final class RoundedView: UIView {
    static var isFromNib: Bool = false
    
    let identifier = "RoundedView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RoundedView {
    private func setStyle() {
        self.backgroundColor = .darkNavy2
    }
    
    private func setLayout() {
    }
}
