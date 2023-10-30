//
//  WeatherCardView.swift
//  weather-app
//
//  Created by 윤영서 on 10/22/23.
//

import UIKit
import SnapKit
import Then


class WeatherCardView: UIButton {
        
    private let myLocation = UILabel()
    private let currentLocation = UILabel()
    private let currentCondition = UILabel()
    private let maxTemperature = UILabel()
    private let minTemperature = UILabel()
    private let currentTemperature = UILabel()
    
    init() {
        super.init(frame: .zero)
        setStyle()
        setLayout()
        self.frame = CGRect(x:0, y:0, width: 335, height: 117)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setLayout() {
        self.addSubViews(myLocation,
                         currentLocation,
                         currentCondition,
                         currentTemperature,
                         maxTemperature,
                         minTemperature)
        
        myLocation.snp.makeConstraints {
            $0.top.equalTo(self).offset(10)
            $0.leading.equalTo(self).offset(16)
        }
        
        currentLocation.snp.makeConstraints {
            $0.top.equalTo(self).offset(44)
            $0.leading.equalTo(self).offset(16)
        }
        
        currentCondition.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.leading.equalTo(self).offset(16)
        }
        
        maxTemperature.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.trailing.equalTo(self).offset(-79)
        }
        
        minTemperature.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.trailing.equalTo(self).offset(-16)
        }
        
        currentTemperature.snp.makeConstraints {
            $0.top.equalTo(self).offset(4)
            $0.trailing.equalTo(self).offset(-16)
        }
    }
    
    private func setStyle() {
        self.do {
            $0.setImage(UIImage(named: "list-image"), for:.normal)
            $0.layer.cornerRadius = 16
            $0.isUserInteractionEnabled = true
        }
        
        myLocation.do {
            $0.text = "나의 위치"
            $0.font = .sfBold(size: 24)
            $0.textColor = .white
        }
        
        currentLocation.do {
            $0.text = "고양시"
            $0.font = .sfMedium(size: 17)
            $0.textColor = .white
        }
        
        currentCondition.do {
            $0.text = "흐림"
            $0.font = .sfMedium(size: 16)
            $0.textColor = .white
        }
        
        maxTemperature.do {
            $0.text = "최고:29°"
            $0.font = .sfMedium(size: 15)
            $0.textColor = .white
        }
        minTemperature.do {
            $0.text = "최저:15°"
            $0.font = .sfMedium(size: 15)
            $0.textColor = .white
        }
        currentTemperature.do {
            $0.text = "21°"
            $0.font = .sfLight(size: 52)
            $0.textColor = .white
        }
    }
}
