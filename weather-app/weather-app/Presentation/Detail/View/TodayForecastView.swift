//
//  TodayForecastView.swift
//  weather-app
//
//  Created by 윤영서 on 10/23/23.
//

import UIKit
import SnapKit

class TodayForecastView: UIScrollView {
    let hourStackView = UIStackView().then {
        $0.distribution = .equalSpacing
        $0.spacing = 22
        $0.axis = .horizontal
    }
    let weatherStackView = UIStackView().then {
        $0.distribution = .equalSpacing
        $0.spacing = 22
        $0.axis = .horizontal
    }
    let temperatureStackView = UIStackView().then {
        $0.distribution = .equalSpacing
        $0.spacing = 22
        $0.axis = .horizontal
    }
    
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
    
    func setLayout() {
        
        self.addSubViews(hourStackView, weatherStackView, temperatureStackView)
        
//        self.snp.makeConstraints { //뷰컨에서 나중에 seperateline이랑 같게 설정 top
//            $0.top.equalToSuperview().offset(100)
//        } // 요기가 문제야 ㅠㅠㅠ. ㅠ. ㅠ
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
    
    func setStyle() {
        self.do {
            $0.alwaysBounceHorizontal = true
        }
    }
    
    func setupUI(timeStrings: [String], icons: [UIImage], temperatures: [String]) {
        // 가로 스택뷰를 만드는 함수
        func createHorizontalStackView() -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.distribution = .equalSpacing
            return stackView
        }
        
        // 입력된 문자열 배열을 기반으로 UILabel 생성
        for timeString in timeStrings {
            let label = UILabel()
            label.text = timeString
            label.font = UIFont.sfMedium(size: 17)
            label.textColor = .white
            label.textAlignment = .center
            hourStackView.addArrangedSubview(label)
        }
        
        // 입력된 이미지 배열을 기반으로 UIImageView 생성
        for icon in icons {
            let imageView = UIImageView()
            imageView.image = icon
            weatherStackView.addArrangedSubview(imageView)
        }
        
        // 입력된 문자열 배열을 기반으로 UILabel 생성
        for temperature in temperatures {
            let label = UILabel()
            label.text = temperature
            label.font = UIFont.sfMedium(size: 17)
            label.textColor = .white
            label.textAlignment = .center
            temperatureStackView.addArrangedSubview(label)
        }
    }
}

