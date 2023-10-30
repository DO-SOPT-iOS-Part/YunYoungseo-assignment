//
//  TodayForecastView.swift
//  weather-app
//
//  Created by 윤영서 on 10/23/23.
//

import UIKit
import SnapKit
import Then


class TodayForecastView: UIScrollView {
    
    let hourStackView = UIStackView()
    let weatherStackView = UIStackView()
    let temperatureStackView = UIStackView()
    
    init(timeStrings: [String], icons: [UIImage], temperatures: [String]) {
        super.init(frame: .zero)
        setupUI(timeStrings: timeStrings, icons: icons, temperatures: temperatures)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI(timeStrings: [], icons: [], temperatures: [])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.weatherStackView.subviews.forEach { [weak self] in
            guard let self else {return}
            
            let width = $0.frame.width
            self.hourStackView.subviews.forEach {
                $0.snp.remakeConstraints {
                    $0.width.equalTo(width)
                }
            }
            
            self.temperatureStackView.subviews.forEach {
                $0.snp.remakeConstraints {
                    $0.width.equalTo(width)
                }
            }
        }
    }
    
    private func setLayout() {
        
        self.addSubViews(hourStackView, weatherStackView, temperatureStackView)
        
        hourStackView.snp.makeConstraints {
            $0.top.equalTo(contentLayoutGuide).offset(14)
            $0.leading.equalTo(contentLayoutGuide)
            $0.trailing.equalTo(contentLayoutGuide)
        }
        
        weatherStackView.snp.makeConstraints {
            $0.top.equalTo(self.hourStackView.snp.bottom).offset(14)
            $0.leading.equalTo(contentLayoutGuide)
            $0.trailing.equalTo(contentLayoutGuide)
        }
        
        temperatureStackView.snp.makeConstraints {
            $0.top.equalTo(self.weatherStackView.snp.bottom).offset(14)
            $0.leading.equalTo(contentLayoutGuide)
            $0.trailing.equalTo(contentLayoutGuide)
            $0.bottom.equalTo(contentLayoutGuide)
        }
    }
    
    private func setStyle() {
        self.do {
            $0.alwaysBounceHorizontal = true
        }
        hourStackView.do {
            $0.distribution = .equalSpacing
            $0.spacing = 22
            $0.axis = .horizontal
        }
        weatherStackView.do {
            $0.distribution = .equalSpacing
            $0.spacing = 22
            $0.axis = .horizontal
        }
        temperatureStackView.do {
            $0.distribution = .equalSpacing
            $0.spacing = 22
            $0.axis = .horizontal
        }
    }
    
    private func setupUI(timeStrings: [String], icons: [UIImage], temperatures: [String]) {
        
        for timeString in timeStrings {
            let label = UILabel()
            label.text = timeString
            label.font = .sfMedium(size: 17)
            label.textColor = .white
            label.textAlignment = .center
            hourStackView.addArrangedSubview(label)
        }
        
        for icon in icons {
            let imageView = UIImageView()
            imageView.image = icon
            weatherStackView.addArrangedSubview(imageView)
        }
        
        for temperature in temperatures {
            let label = UILabel()
            label.text = temperature
            label.font = .sfMedium(size: 17)
            label.textColor = .white
            label.textAlignment = .center
            temperatureStackView.addArrangedSubview(label)
        }
    }
}

