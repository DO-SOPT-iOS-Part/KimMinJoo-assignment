//
//  UICollectionView+.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/2/23.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let className = type.className
        self.register(type.self, forCellWithReuseIdentifier: className)
    }

    func registerCells<T: UICollectionViewCell>(_ types: T.Type...) {
        types.forEach {
            registerCell($0)
        }
    }
    
    func dequeueCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }

    func registerHeader<T: UICollectionReusableView>(_ type: T.Type) {
        let className = type.className
        register(type.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UICollectionReusableView>(kind: String, type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}

