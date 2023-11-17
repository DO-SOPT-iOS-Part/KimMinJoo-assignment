//
//  UILabel+.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 11/16/23.
//

import UIKit

extension UILabel {
    
    /// 특정 text의 색상을 바꿔주는 함수
    /// > 사용 예시 : label.highlightText(forText: "안녕", forColor: .FoDongOrange)
    func highlightText(forText: String, forColor: UIColor) {
        guard let labelText = self.text else { return }
        let attributedString = NSMutableAttributedString(string: labelText)
        
        let range = (labelText as NSString).range(of: forText)
        attributedString.addAttribute(.foregroundColor, value: forColor, range: range)
        
        self.attributedText = attributedString
    }
    
    /// 특정 text에 underline을 추가하는 함수
    /// > 사용 예시 : label.underLineText(forText: ["맛집을 추천"])
    func underLineText(forText: [String]) {
        guard let labelText = self.text else { return }
        
        let underLineText = NSMutableAttributedString(string: labelText)
        
        for text in forText {
            let range = (labelText as NSString).range(of: text)
            underLineText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        }
        
        self.attributedText = underLineText
    }
    
    func labelWithImg(composition: NSAttributedString...) {
        let attributedString = NSMutableAttributedString()
        for i in composition {
            attributedString.append(i)
            attributedString.append(NSAttributedString(string: " "))
        }
        self.attributedText = attributedString
    }
}
