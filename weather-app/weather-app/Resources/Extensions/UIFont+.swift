//
//  UIFont+.swift
//  weather-app
//
//  Created by 윤영서 on 10/21/23.
//

import UIKit

extension UIFont {
    enum SFProFontName: String {
            case regular      = "SFProText-Regular"
            case bold       = "SFProText-Bold"
            case light     = "SFProText-Light"
            case thin = "SFProText-Thin"
            case medium = "SFProText-Medium"
        }
        
        class func sfRegular(size: CGFloat) -> UIFont {
            return UIFont(name: SFProFontName.regular.rawValue, size: size)!
        }
    
        class func sfBold(size: CGFloat) -> UIFont {
            return UIFont(name: SFProFontName.bold.rawValue, size: size)!
        }
        
        class func sfLight(size: CGFloat) -> UIFont {
            return UIFont(name: SFProFontName.light.rawValue, size: size)!
        }
        
        class func sfThin(size: CGFloat) -> UIFont {
            return UIFont(name: SFProFontName.thin.rawValue, size: size)!
        }
    
        class func sfMedium(size: CGFloat) -> UIFont {
            return UIFont(name: SFProFontName.medium.rawValue, size: size)!
    }
}
