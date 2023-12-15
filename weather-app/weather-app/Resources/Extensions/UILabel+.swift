//
//  UILabel+.swift
//  weather-app
//
//  Created by 윤영서 on 12/15/23.
//

import UIKit

extension UILabel {
    
    func highlightText(forText: String, forColor: UIColor) {
        guard let labelText = self.text else { return }
        let attributedString = NSMutableAttributedString(string: labelText)
        
        let range = (labelText as NSString).range(of: forText)
        attributedString.addAttribute(.foregroundColor, value: forColor, range: range)
        
        self.attributedText = attributedString
    }
    
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
    
    func setupLabel(font: UIFont, text: String? = nil, textColor: UIColor, alignment: NSTextAlignment = .center) {
        self.font = font
        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment
    }
    
    func setupRoundedLabel(text: String, font: UIFont, textColor: UIColor, alignment: NSTextAlignment, bgColor: UIColor, borderColor: UIColor, borderWidth: CGFloat, radius: CGFloat) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.backgroundColor = bgColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
