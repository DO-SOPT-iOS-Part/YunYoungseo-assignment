//
//  UIView+.swift
//  weather-app
//
//  Created by 윤영서 on 10/24/23.
//

import UIKit

extension UIView {
        func addSubViews(_ views: UIView...) {
                views.forEach {
                        self.addSubview($0)
                }
        }
}
