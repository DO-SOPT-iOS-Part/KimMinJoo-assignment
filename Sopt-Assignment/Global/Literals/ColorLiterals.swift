//
//  ColorLiterals.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/15/23.
//

import UIKit

extension UIColor {
    
    @nonobjc class var gray28: UIColor {
        return UIColor(red: 28 / 255, green: 28 / 255, blue: 30 / 255, alpha: 1)
    }
    
    @nonobjc class var gray152: UIColor {
        return UIColor(red: 152 / 255, green: 152 / 255, blue: 160 / 255, alpha: 1)
    }
    
    @nonobjc class var darkNavy: UIColor {
        return UIColor(red: 41 / 255, green: 47 / 255, blue: 60 / 255, alpha: 1)
    }
    
    static var darkNavy2: UIColor {
        return UIColor(hex: "#202631")
    }
    
    static var gradientLow: UIColor {
        return UIColor(hex: "#4BBBFC")
    }
    
    static var gradientHigh: UIColor {
        return UIColor(hex: "#9ED4AB")
    }
    
    static var gradient: UIColor {
        return UIColor(hex: "#1B2129")
    }
}
